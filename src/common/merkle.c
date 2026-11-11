/*****************************************************************************
 *   Ledger App Bitcoin.
 *   (c) 2025 Ledger SAS.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *****************************************************************************/

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "merkle.h"

/* SDK headers */
#include "buffer.h"
#include "ledger_assert.h"

/* Local headers */
#include "crypto.h"
#include "debug.h"
#include "lean_kernels/liblean_ledger_bitcoin.h"

void merkle_compute_element_hash(const uint8_t *in,
                                 size_t in_len,
                                 uint8_t out[static CX_SHA256_SIZE]) {
    // H(0x00 | in)
    uint8_t data = 0x00;
    cx_iovec_t iovec[2] = {{.iov_base = &data, .iov_len = 1}, {.iov_base = in, .iov_len = in_len}};
    cx_sha256_hash_iovec(iovec, 2, out);
}

void merkle_combine_hashes(const uint8_t left[static CX_SHA256_SIZE],
                           const uint8_t right[static CX_SHA256_SIZE],
                           uint8_t out[static CX_SHA256_SIZE]) {
    PRINT_STACK_POINTER();

    uint8_t prefix = 0x01;
    cx_iovec_t iovec[3] = {{.iov_base = &prefix, .iov_len = 1},
                           {.iov_base = left, .iov_len = CX_SHA256_SIZE},
                           {.iov_base = right, .iov_len = CX_SHA256_SIZE}};
    cx_sha256_hash_iovec(iovec, 3, out);
}

// O(log n) top-down Merkle direction descent backed by verified Lean freestanding kernels
// (`llb_merkle_advance_state` + `llb_merkle_state_dir`, replacing the O(log^2 n) ceil_lg loop).
int merkle_get_ith_direction(size_t size, size_t index, size_t i) {
    if (size <= 1 || index >= size) {
        return -1;
    }
#ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
    // Bound fuzz-only sizes to avoid catastrophic iteration counts.
    if (size > ((size_t) 1U << MAX_MERKLE_TREE_DEPTH)) {
        return -1;
    }
#endif
#if SIZE_MAX > UINT32_MAX
    if (size > (size_t) UINT32_MAX) {
        return -1;
    }
#endif
    if (i >= 32U) {
        return -1;
    }

    uint64_t state = ((uint64_t) (uint32_t) size << 32) | (uint64_t) (uint32_t) index;
    for (size_t step = 0;; step++) {
        uint64_t next = llb_merkle_advance_state(state);
        if ((uint32_t) (next >> 32) == (uint32_t) (state >> 32)) {
            return -1;
        }
        if (step == i) {
            // Left child sets next_size = mask (keep index unchanged, except when size - mask == size? Never, mask >= 1),
            // Right child decrements size by mask AND decrements index by mask >= 1!
            return ((uint32_t) next != (uint32_t) state) ? 1 : 0;
        }
        state = next;
    }
}