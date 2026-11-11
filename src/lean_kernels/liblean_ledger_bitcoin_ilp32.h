/* Auto-generated C99 Header by lean-native C-ABI Binding Generator */
/* ABI Slice Layout (ILP32 (wasm32 / ARM Thumb / RV32)): sizeof(lean_native_flat_slice_t) == 12, alignof == 4 */
#pragma once
#ifndef LEAN_NATIVE_GENERATED_C_ABI_H
#define LEAN_NATIVE_GENERATED_C_ABI_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
typedef struct { const void* data; size_t len; size_t stride_bytes; } lean_native_flat_slice_t;
typedef struct { void* data; size_t len; size_t cap; } lean_native_mut_slice_t;
/* Zero-Runtime SliceOut C-ABI Contract: packed u64 span (start:32 | len:24 | kind:8) */
typedef uint32_t (*lean_native_slice_out_scan_fn)(
    const uint8_t* ptr, size_t len, uint64_t* out_spans, size_t cap, uint64_t* state_io);
static inline uint64_t lean_native_pack_span(uint32_t start, uint32_t len, uint8_t kind) {
    return ((uint64_t)start << 32) | ((uint64_t)(len & 0xFFFFFFU) << 8) | (uint64_t)kind;
}
static inline uint32_t lean_native_span_start(uint64_t span) {
    return (uint32_t)(span >> 32);
}
static inline uint32_t lean_native_span_len(uint64_t span) {
    return (uint32_t)((span >> 8) & 0xFFFFFFU);
}
static inline uint8_t lean_native_span_kind(uint64_t span) {
    return (uint8_t)(span & 0xFFU);
}
#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L
#if defined(__wasm32__) || (defined(__ARM_ARCH) && !defined(__aarch64__)) || (defined(__riscv) && (__riscv_xlen == 32))
_Static_assert(sizeof(lean_native_flat_slice_t) == 12, "lean_native_flat_slice_t size");
_Static_assert(_Alignof(lean_native_flat_slice_t) == 4, "lean_native_flat_slice_t align");
_Static_assert(offsetof(lean_native_flat_slice_t, data) == 0, "lean_native_flat_slice_t.data offset");
_Static_assert(offsetof(lean_native_flat_slice_t, len) == 4, "lean_native_flat_slice_t.len offset");
_Static_assert(offsetof(lean_native_flat_slice_t, stride_bytes) == 8, "lean_native_flat_slice_t.stride_bytes offset");
_Static_assert(sizeof(lean_native_mut_slice_t) == 12, "lean_native_mut_slice_t size");
_Static_assert(_Alignof(lean_native_mut_slice_t) == 4, "lean_native_mut_slice_t align");
_Static_assert(offsetof(lean_native_mut_slice_t, data) == 0, "lean_native_mut_slice_t.data offset");
_Static_assert(offsetof(lean_native_mut_slice_t, len) == 4, "lean_native_mut_slice_t.len offset");
_Static_assert(offsetof(lean_native_mut_slice_t, cap) == 8, "lean_native_mut_slice_t.cap offset");
#else
#error "Mismatched or unsupported C-ABI target: pinned to wasm32 (32-bit)"
#endif
#endif
#ifdef __cplusplus
extern "C" {
#endif
uint32_t llb_version_packed(void);
uint8_t llb_valid_amount(uint64_t sats);
uint8_t llb_checked_add_sats_ok(uint64_t a, uint64_t b);
uint64_t llb_checked_add_sats_val(uint64_t a, uint64_t b);
uint8_t llb_checked_sub_sats_ok(uint64_t a, uint64_t b);
uint64_t llb_checked_sub_sats_val(uint64_t a, uint64_t b);
uint8_t llb_varint_encoded_len(uint64_t n);
uint8_t llb_varint_prefix_is_canonical(uint8_t tag, uint64_t decodedVal);
uint8_t llb_bip32_is_hardened(uint32_t idx);
uint32_t llb_bip32_harden(uint32_t n);
uint32_t llb_bip32_unharden(uint32_t idx);
uint8_t llb_bip32_bolos_depth_ok(uint8_t depth);
uint8_t llb_bip32_vanadium_depth_ok(uint8_t depth);
uint8_t llb_bip32_standard_purpose_ok(uint32_t purposeStep);
uint8_t llb_witness_opcode_to_version(uint8_t op);
uint8_t llb_segwit_program_valid(uint8_t witver, uint8_t progLen);
uint32_t llb_bech32_polymod_step(uint32_t pre, uint8_t val);
uint8_t llb_minimal_push_opcode_ok(uint8_t op, uint8_t firstByte, uint32_t pushLen);
uint8_t llb_sighash_type_valid(uint32_t sighashU32);
uint8_t llb_taproot_sighash_valid(uint8_t sighashByte);
uint8_t llb_merkle_depth_index_ok(uint32_t treeSize, uint32_t index, uint8_t depth);
uint16_t llb_bolos_sw_for_error(uint8_t errTag);
uint64_t llb_sats_div_1e8(uint64_t amount);
uint32_t llb_sats_mod_1e8(uint64_t amount);
uint64_t llb_merkle_advance_state(uint64_t st);
uint8_t llb_merkle_state_dir(uint64_t st);
uint8_t llb_bip32_pubkey_export_prefix_ok(uint32_t p0, uint32_t p1, uint32_t p2, uint32_t p3,
                                          uint8_t pathLen, uint32_t expectedCoinType,
                                          uint8_t tailUnhardened);
uint32_t llb_bech32_final_constant(uint8_t enc);
uint8_t llb_wallet_name_char_ok(uint8_t c, uint8_t isEdge);
uint8_t llb_miniscript_older_ok(uint32_t n);
uint8_t llb_miniscript_after_ok(uint32_t n);
uint8_t llb_miniscript_check_postfix(const uint8_t *ops, uint32_t opsLen, uint8_t isTapscript,
                                     uint8_t requireFlags, uint8_t *scratch);
uint64_t llb_psbt_locktime_init(void);
uint64_t llb_psbt_determine_locktime(const uint8_t *heightsAndTimesLe, uint32_t numInputs,
                                     uint32_t fallbackLocktime);
uint64_t llb_psbt_locktime_step(uint64_t state, uint8_t hasH, uint32_t h, uint8_t hasT,
                                uint32_t t);
uint64_t llb_psbt_locktime_finalize(uint64_t state, uint32_t fallbackLocktime);
uint8_t llb_bytes_eq(const uint8_t *a, const uint8_t *b, uint32_t len);
uint8_t llb_check_dual_utxo(uint64_t witAmount, const uint8_t *witSpk, uint32_t witSpkLen,
                            uint64_t nonWitAmount, const uint8_t *nonWitSpk,
                            uint32_t nonWitSpkLen);
uint64_t llb_sum_amounts_le64(const uint8_t *amountsLe, uint32_t count);
uint8_t llb_bip32_check_export_path(const uint32_t *path, uint8_t pathLen,
                                    uint32_t expectedCoinType);
uint64_t llb_read_compact_size_checked(const uint8_t *buf, uint32_t bufLen, uint32_t maxVal);
void llb_sort_fixed_bytes(uint8_t *buf, uint32_t count, uint32_t stride);
void llb_sort_u16(uint16_t *arr, uint32_t count);
uint32_t llb_format_sats_ascii(uint64_t amount, const uint8_t *ticker, uint32_t tickerLen,
                               uint8_t padFrac8, uint8_t *out, uint32_t outCap);
uint8_t llb_miniscript_andor_branches_valid(uint8_t notifOpcode, uint8_t elseOpcode,
                                            uint8_t endifOpcode);
#ifdef __cplusplus
}
#endif
#endif /* LEAN_NATIVE_GENERATED_C_ABI_H */
