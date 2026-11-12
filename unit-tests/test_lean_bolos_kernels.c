#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include <cmocka.h>

#include "lean_kernels/liblean_ledger_bitcoin.h"
#include "ui/display_utils.h"

static void test_llb_version_and_amounts(void **state) {
    (void) state;
    assert_int_equal(llb_version_packed(), 0x00020401U);

    assert_int_equal(llb_valid_amount(0ULL), 1);
    assert_int_equal(llb_valid_amount(2100000000000000ULL), 1);
    assert_int_equal(llb_valid_amount(2100000000000001ULL), 0);
    assert_int_equal(llb_valid_amount(UINT64_MAX), 0);

    assert_int_equal(llb_checked_add_sats_ok(100000000ULL, 250000000ULL), 1);
    assert_int_equal(llb_checked_add_sats_val(100000000ULL, 250000000ULL), 350000000ULL);
    assert_int_equal(llb_checked_add_sats_ok(2100000000000000ULL, 1ULL), 0);
    assert_int_equal(llb_checked_sub_sats_ok(100ULL, 101ULL), 0);
    assert_int_equal(llb_checked_sub_sats_val(250ULL, 100ULL), 150ULL);
}

static void test_llb_sats_div_mod_and_format(void **state) {
    (void) state;
    const uint64_t samples[] = {
        0ULL,
        1ULL,
        99999999ULL,
        100000000ULL,
        100000001ULL,
        123456789ULL,
        9999999999999999ULL,
        10000000000000000ULL,
        2100000000000000ULL,
        9999999999999999999ULL,
        10000000000000000000ULL,
        18446744073700000000ULL,
        UINT64_MAX - 1ULL,
        UINT64_MAX,
    };

    for (size_t i = 0; i < sizeof(samples) / sizeof(samples[0]); i++) {
        uint64_t x = samples[i];
        assert_int_equal(llb_sats_div_1e8(x), x / 100000000ULL);
        assert_int_equal(llb_sats_mod_1e8(x), (uint32_t) (x % 100000000ULL));

        char actual[MAX_AMOUNT_LENGTH + 1] = {0};
        char expected[MAX_AMOUNT_LENGTH + 1] = {0};
        format_sats_amount("BTC", x, actual);

        uint64_t ip = x / 100000000ULL;
        uint32_t fp = (uint32_t) (x % 100000000ULL);
        if (fp == 0U) {
            snprintf(expected, sizeof(expected), "%llu BTC", (unsigned long long) ip);
        } else {
            char frac[9];
            snprintf(frac, sizeof(frac), "%08u", fp);
            for (int k = 7; k > 0 && frac[k] == '0'; k--) {
                frac[k] = '\0';
            }
            snprintf(expected, sizeof(expected), "%llu.%s BTC", (unsigned long long) ip, frac);
        }
        assert_string_equal(actual, expected);
    }
}

static int ref_merkle_get_ith_direction(size_t size, size_t index, size_t i) {
    if (size <= 1 || index >= size) {
        return -1;
    }
    size_t step = 0;
    while (size > 1) {
        uint32_t mask = 1U;
        while (((size_t) mask << 1) < size) {
            mask <<= 1;
        }
        int dir = (index >= mask) ? 1 : 0;
        if (step == i) {
            return dir;
        }
        step++;
        if (dir) {
            size -= mask;
            index -= mask;
        } else {
            size = mask;
        }
    }
    return -1;
}

static void test_llb_merkle_descent_differential(void **state) {
    (void) state;
    for (uint32_t size = 0; size <= 33; size++) {
        uint32_t max_idx = (size + 2U < 36U) ? (size + 2U) : 36U;
        for (uint32_t idx = 0; idx < max_idx; idx++) {
            for (size_t step = 0; step <= 7; step++) {
                int ref = ref_merkle_get_ith_direction(size, idx, step);
                int got = -1;
                if (size > 1 && idx < size) {
                    uint64_t st = ((uint64_t) size << 32) | (uint64_t) idx;
                    bool stopped = false;
                    for (size_t k = 0; k < step; k++) {
                        st = llb_merkle_advance_state(st);
                        if ((uint32_t) (st >> 32) <= 1U) {
                            stopped = true;
                            break;
                        }
                    }
                    if (!stopped) {
                        uint8_t d = llb_merkle_state_dir(st);
                        got = (d == 0xFFU) ? -1 : (int) d;
                    }
                }
                assert_int_equal(got, ref);
            }
        }
    }
}

static void test_llb_bip32_segwit_sighash_and_policy_name(void **state) {
    (void) state;
    assert_int_equal(llb_bip32_bolos_depth_ok(10), 1);
    assert_int_equal(llb_bip32_bolos_depth_ok(11), 0);
    assert_int_equal(llb_bip32_vanadium_depth_ok(16), 1);
    assert_int_equal(llb_bip32_vanadium_depth_ok(17), 0);

    // BIP84 mainnet m/84'/0'/0'
    assert_int_equal(
        llb_bip32_pubkey_export_prefix_ok(0x80000054U, 0x80000000U, 0x80000000U, 0U, 3U, 0U, 1U),
        1);
    // Electrum encryption m/4541509'/1112098098'
    assert_int_equal(
        llb_bip32_pubkey_export_prefix_ok(0x80454C45U, 0xC2494532U, 0U, 0U, 2U, 0U, 1U),
        1);
    // BIP48 invalid script type 3'
    assert_int_equal(
        llb_bip32_pubkey_export_prefix_ok(
            0x80000030U, 0x80000000U, 0x80000000U, 0x80000003U, 4U, 0U, 1U),
        0);

    assert_int_equal(llb_segwit_program_valid(0, 20), 1);
    assert_int_equal(llb_segwit_program_valid(0, 32), 1);
    assert_int_equal(llb_segwit_program_valid(0, 16), 0);
    assert_int_equal(llb_segwit_program_valid(1, 32), 1);
    assert_int_equal(llb_segwit_program_valid(17, 32), 0);

    assert_int_equal(llb_bech32_final_constant(1), 1U);
    assert_int_equal(llb_bech32_final_constant(2), 0x2bc830a3U);
    assert_int_equal(llb_bech32_final_constant(0), 0U);

    assert_int_equal(llb_witness_opcode_to_version(0x00), 0);
    assert_int_equal(llb_witness_opcode_to_version(0x51), 1);
    assert_int_equal(llb_witness_opcode_to_version(0x60), 16);
    assert_int_equal(llb_witness_opcode_to_version(0x50), 0xFF);

    assert_int_equal(llb_sighash_type_valid(0x00), 0);
    assert_int_equal(llb_sighash_type_valid(0x01), 1);
    assert_int_equal(llb_sighash_type_valid(0x83), 1);
    assert_int_equal(llb_taproot_sighash_valid(0x00), 1);

    assert_int_equal(llb_wallet_name_char_ok((uint8_t) ' ', 1), 0);
    assert_int_equal(llb_wallet_name_char_ok((uint8_t) ' ', 0), 1);
    assert_int_equal(llb_wallet_name_char_ok(0x7FU, 0), 0);

    assert_int_equal(llb_miniscript_older_ok(1U), 1);
    assert_int_equal(llb_miniscript_older_ok(65535U), 1);
    assert_int_equal(llb_miniscript_older_ok(65536U), 0);
    assert_int_equal(llb_miniscript_after_ok(1U), 1);
    assert_int_equal(llb_miniscript_after_ok(500000000U), 1);
    assert_int_equal(llb_miniscript_after_ok(0U), 0);
    assert_int_equal(llb_miniscript_andor_branches_valid(0x64U, 0x67U, 0x68U), 1);
    assert_int_equal(llb_miniscript_andor_branches_valid(0x63U, 0x67U, 0x68U), 0);

    uint8_t a[4] = {1, 2, 3, 4};
    uint8_t b[4] = {1, 2, 3, 4};
    uint8_t c[4] = {1, 2, 9, 4};
    assert_int_equal(llb_bytes_eq(a, b, 4), 1);
    assert_int_equal(llb_bytes_eq(a, c, 4), 0);
    assert_int_equal(llb_check_dual_utxo(100ULL, a, 4, 100ULL, b, 4), 1);
    assert_int_equal(llb_check_dual_utxo(100ULL, a, 4, 101ULL, b, 4), 0);

    uint8_t scratch[128] = {0};
    uint8_t ops[] = {0x00, 0x01, 0x10, 0x21};
    assert_int_equal(llb_miniscript_check_postfix(ops, 4, 0, 0, scratch), 1);

    uint64_t st = llb_psbt_locktime_init();
    st = llb_psbt_locktime_step(st, 1, 10000U, 0, 0);
    uint64_t fin = llb_psbt_locktime_finalize(st, 0);
    assert_int_equal((uint32_t) fin, 10000U);

    uint8_t cs[] = {0x02, 0x01, 0x02};
    uint64_t packed = llb_read_compact_size_checked(cs, 3, 10);
    assert_int_equal((uint32_t) packed, 2U);
    assert_int_equal((uint32_t) (packed >> 32), 1U);

    uint16_t xs[] = {3, 1, 2};
    llb_sort_u16(xs, 3);
    assert_int_equal(xs[0], 1);
    assert_int_equal(xs[2], 3);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_llb_version_and_amounts),
        cmocka_unit_test(test_llb_sats_div_mod_and_format),
        cmocka_unit_test(test_llb_merkle_descent_differential),
        cmocka_unit_test(test_llb_bip32_segwit_sighash_and_policy_name),
    };
    return cmocka_run_group_tests(tests, NULL, NULL);
}
