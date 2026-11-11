#pragma once
#if defined(__LP64__) || defined(_LP64)
#include "liblean_ledger_bitcoin_lp64.h"
#else
#include "liblean_ledger_bitcoin_ilp32.h"
#endif
