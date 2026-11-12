#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "display_utils.h"
#include "lean_kernels/liblean_ledger_bitcoin.h"

void format_sats_amount(const char *coin_name,
                        uint64_t amount,
                        char out[static MAX_AMOUNT_LENGTH + 1]) {
    uint8_t ticker[5];
    uint32_t ticker_len = 0;
    while (ticker_len < sizeof(ticker) && coin_name[ticker_len] != '\0') {
        ticker[ticker_len] = (uint8_t) coin_name[ticker_len];
        ticker_len++;
    }

    uint32_t n = llb_format_sats_ascii(amount,
                                       ticker,
                                       ticker_len,
                                       0U,
                                       (uint8_t *) out,
                                       (uint32_t) (MAX_AMOUNT_LENGTH + 1));
    if (n > MAX_AMOUNT_LENGTH) {
        n = 0;
    }
    out[n] = '\0';
}

void format_output_index(const unsigned int output_index,
                         const unsigned int n_outputs,
                         char out[static MAX_OUTPUT_INDEX_LENGTH + 1]) {
    snprintf(out, MAX_OUTPUT_INDEX_LENGTH + 1, "%u of %u", output_index, n_outputs);
}
