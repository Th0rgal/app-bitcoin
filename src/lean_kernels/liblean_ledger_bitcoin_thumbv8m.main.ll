; ModuleID = '/var/lib/sandboxed-node/.scratch/e42fdc4f-ce56-40b8-9b3e-c267ef038ce3/opencode/worktrees/lean-ledger-bitcoin/ffi/bolos/build/lto/liblean_ledger_bitcoin_thumbv8m.main.ll.pre.ll'
source_filename = "BitcoinLedger/FreestandingKernels.lean.lean"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv8m.main-none-eabi"

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr noundef readonly captures(none) %arg_v0, i32 noundef %arg_v1, ptr noundef writeonly captures(none) %arg_v2, i32 noundef %arg_v3) unnamed_addr #0 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  %0 = getelementptr i8, ptr %arg_v2, i32 %arg_v3
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %loop_body_5, %entry
  %loop_idx_8 = phi i64 [ 0, %entry ], [ %loop_next_9, %loop_body_5 ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v1
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %loop_idx_8.tr = trunc i64 %loop_idx_8 to i32
  %rld_gep_21 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %loop_idx_8.tr
  %rld_i8_22 = load i8, ptr %rld_gep_21, align 1
  %rst_gep_27 = getelementptr i8, ptr %0, i32 %loop_idx_8.tr
  store i8 %rld_i8_22, ptr %rst_gep_27, align 1
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  ret void
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext range(i8 0, 2) i8 @llb_check_dual_utxo(i64 noundef %arg_v0, ptr noundef readonly captures(none) %arg_v1, i32 noundef %arg_v2, i64 noundef %arg_v3, ptr noundef readonly captures(none) %arg_v4, i32 noundef %arg_v5) local_unnamed_addr #1 {
entry:
  %cmp_le_3 = icmp ult i64 %arg_v0, 2100000000000001
  br i1 %cmp_le_3, label %ite_then_6, label %common.ret

ite_then_6:                                       ; preds = %entry
  %cmp_eq_12 = icmp eq i64 %arg_v0, %arg_v3
  %cmp_eq_22 = icmp eq i32 %arg_v2, %arg_v5
  %or.cond = and i1 %cmp_eq_12, %cmp_eq_22
  br i1 %or.cond, label %ite_then_24, label %common.ret

common.ret:                                       ; preds = %entry, %ite_then_6, %ite_then_24
  %common.ret.op = phi i8 [ %call_31, %ite_then_24 ], [ 0, %ite_then_6 ], [ 0, %entry ]
  ret i8 %common.ret.op

ite_then_24:                                      ; preds = %ite_then_6
  %call_31 = tail call zeroext i8 @llb_bytes_eq(ptr %arg_v1, ptr %arg_v4, i32 %arg_v2)
  br label %common.ret
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_valid_amount(i64 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 2100000000000001
  %ret_tr_5 = zext i1 %cmp_le_2 to i8
  ret i8 %ret_tr_5
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext range(i8 0, 2) i8 @llb_bytes_eq(ptr noundef readonly captures(none) %arg_v0, ptr noundef readonly captures(none) %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #1 {
entry:
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %loop_body_5, %entry
  %slot_v12.0.off0 = phi i8 [ 1, %entry ], [ %slot_v12.0.off0., %loop_body_5 ]
  %loop_idx_8 = phi i64 [ 0, %entry ], [ %loop_next_9, %loop_body_5 ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v2
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %0 = trunc i64 %loop_idx_8 to i32
  %rld_gep_15 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %0
  %rld_i8_16 = load i8, ptr %rld_gep_15, align 1
  %rld_gep_20 = getelementptr inbounds nuw i8, ptr %arg_v1, i32 %0
  %rld_i8_21 = load i8, ptr %rld_gep_20, align 1
  %cmp_eq_28 = icmp eq i8 %rld_i8_16, %rld_i8_21
  %slot_v12.0.off0. = select i1 %cmp_eq_28, i8 %slot_v12.0.off0, i8 0
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  ret i8 %slot_v12.0.off0
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: write)
define internal fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr noundef writeonly captures(none) %arg_v0, i32 noundef %arg_v1, i32 noundef %arg_v2, i32 noundef %arg_v3) unnamed_addr #3 {
entry:
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  %arg_ext_v3 = zext i32 %arg_v3 to i64
  %0 = getelementptr i8, ptr %arg_v0, i32 %arg_v1
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %loop_body_5, %entry
  %slot_v16.0 = phi i64 [ %arg_ext_v2, %entry ], [ %alu_28, %loop_body_5 ]
  %loop_idx_8 = phi i64 [ 0, %entry ], [ %loop_next_9, %loop_body_5 ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v3
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %loop_idx_8.tr = trunc i64 %loop_idx_8 to i32
  %1 = xor i32 %loop_idx_8.tr, -1
  %alu_26 = mul nuw i64 %slot_v16.0, 3435973837
  %alu_28 = lshr i64 %alu_26, 35
  %alu_34.neg = mul nuw nsw i64 %alu_28, 246
  %alu_40 = add nuw nsw i64 %alu_34.neg, %slot_v16.0
  %rst_gep_52 = getelementptr i8, ptr %0, i32 %1
  %2 = trunc i64 %alu_40 to i8
  %rst_tr8_53 = add i8 %2, 48
  store i8 %rst_tr8_53, ptr %rst_gep_52, align 1
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  ret void
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_checked_add_sats_ok(i64 noundef %arg_v0, i64 noundef %arg_v1) local_unnamed_addr #2 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 2100000000000001
  %alu_4 = sub i64 2100000000000000, %arg_v0
  %cmp_le_8 = icmp ule i64 %arg_v1, %alu_4
  %narrow = and i1 %cmp_le_2, %cmp_le_8
  %ret_tr_16 = zext i1 %narrow to i8
  ret i8 %ret_tr_16
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define internal fastcc zeroext range(i8 0, 2) i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr noundef readonly captures(none) %arg_v0, i32 noundef range(i32 3, 5) %arg_v1, i32 noundef range(i32 0, 11) %arg_v2) unnamed_addr #1 {
entry:
  %arg_ext_v1 = zext nneg i32 %arg_v1 to i64
  %arg_ext_v2 = zext nneg i32 %arg_v2 to i64
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %loop_body_5, %entry
  %slot_v10.0.off0 = phi i8 [ 1, %entry ], [ %slot_v10.0.off0., %loop_body_5 ]
  %loop_idx_8 = phi i64 [ %arg_ext_v1, %entry ], [ %loop_next_9, %loop_body_5 ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v2
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %0 = trunc i64 %loop_idx_8 to i32
  %rld_gep_15 = getelementptr inbounds nuw i32, ptr %arg_v0, i32 %0
  %rld_i32_16 = load i32, ptr %rld_gep_15, align 4
  %ite_cond_32.not = icmp sgt i32 %rld_i32_16, -1
  %slot_v10.0.off0. = select i1 %ite_cond_32.not, i8 %slot_v10.0.off0, i8 0
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  ret i8 %slot_v10.0.off0
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_is_hardened(i32 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %arg_v0.lobit = lshr i32 %arg_v0, 31
  %ret_tr_13 = trunc nuw nsw i32 %arg_v0.lobit to i8
  ret i8 %ret_tr_13
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden void @llb_sort_u16(ptr noundef captures(none) %arg_v0, i32 noundef %arg_v1) local_unnamed_addr #0 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  %cmp_le_5 = icmp ult i32 %arg_v1, 2
  br i1 %cmp_le_5, label %common.ret, label %loop_hdr_14

common.ret:                                       ; preds = %loop_hdr_14, %entry
  ret void

loop_hdr_14:                                      ; preds = %entry, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortU16Pass.exit
  %loop_idx_18 = phi i64 [ %loop_next_19, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortU16Pass.exit ], [ 1, %entry ]
  %loop_cmp_20 = icmp samesign ult i64 %loop_idx_18, %arg_ext_v1
  br i1 %loop_cmp_20, label %loop_body_15, label %common.ret

loop_body_15:                                     ; preds = %loop_hdr_14
  %alu_15.i = add nuw nsw i64 %loop_idx_18, 4294967295
  br label %loop_hdr_4.i

loop_hdr_4.i:                                     ; preds = %loop_latch_6.i, %loop_body_15
  %loop_idx_8.i = phi i64 [ 0, %loop_body_15 ], [ %loop_next_9.i, %loop_latch_6.i ]
  %loop_cmp_10.i = icmp samesign ult i64 %loop_idx_8.i, %loop_idx_18
  br i1 %loop_cmp_10.i, label %loop_body_5.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortU16Pass.exit

loop_body_5.i:                                    ; preds = %loop_hdr_4.i
  %alu_21.i = sub nuw nsw i64 %alu_15.i, %loop_idx_8.i
  %0 = trunc i64 %alu_21.i to i32
  %rld_gep_25.i = getelementptr inbounds nuw i16, ptr %arg_v0, i32 %0
  %rld_i16_26.i = load i16, ptr %rld_gep_25.i, align 2
  %rld_gep_34.i = getelementptr i8, ptr %rld_gep_25.i, i32 2
  %rld_i16_35.i = load i16, ptr %rld_gep_34.i, align 2
  %cmp_lt_42.i = icmp ult i16 %rld_i16_35.i, %rld_i16_26.i
  br i1 %cmp_lt_42.i, label %ite_then_44.i, label %loop_latch_6.i

ite_then_44.i:                                    ; preds = %loop_body_5.i
  store i16 %rld_i16_35.i, ptr %rld_gep_25.i, align 2
  store i16 %rld_i16_26.i, ptr %rld_gep_34.i, align 2
  br label %loop_latch_6.i

loop_latch_6.i:                                   ; preds = %ite_then_44.i, %loop_body_5.i
  %loop_next_9.i = add nuw nsw i64 %loop_idx_8.i, 1
  br label %loop_hdr_4.i

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortU16Pass.exit: ; preds = %loop_hdr_4.i
  %loop_next_19 = add nuw nsw i64 %loop_idx_18, 1
  br label %loop_hdr_14
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i32 @llb_sats_mod_1e8(i64 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %alu_1 = and i64 %arg_v0, 4294967295
  %alu_3 = lshr i64 %arg_v0, 32
  %alu_9 = mul nuw i64 %alu_1, 2221002493
  %alu_14 = mul nuw i64 %alu_1, 2882303761
  %alu_19 = mul nuw i64 %alu_3, 2221002493
  %alu_24 = mul nuw i64 %alu_3, 2882303761
  %alu_27 = lshr i64 %alu_9, 32
  %alu_29 = and i64 %alu_14, 4294967295
  %alu_34 = add nuw nsw i64 %alu_27, %alu_29
  %alu_36 = and i64 %alu_19, 4294967295
  %alu_41 = add nuw nsw i64 %alu_34, %alu_36
  %alu_43 = lshr i64 %alu_14, 32
  %alu_46 = add nuw i64 %alu_43, %alu_24
  %alu_48 = lshr i64 %alu_19, 32
  %alu_51 = add nuw i64 %alu_46, %alu_48
  %alu_53 = lshr i64 %alu_41, 32
  %alu_56 = add nuw i64 %alu_51, %alu_53
  %alu_59 = lshr i64 %alu_56, 26
  %alu_67.neg = mul i64 %alu_59, 4194967296
  %alu_73 = add i64 %alu_67.neg, %arg_v0
  %ret_tr_76 = trunc i64 %alu_73 to i32
  ret i32 %ret_tr_76
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden range(i64 0, 184467440738) i64 @llb_sats_div_1e8(i64 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %alu_1 = and i64 %arg_v0, 4294967295
  %alu_3 = lshr i64 %arg_v0, 32
  %alu_9 = mul nuw i64 %alu_1, 2221002493
  %alu_14 = mul nuw i64 %alu_1, 2882303761
  %alu_19 = mul nuw i64 %alu_3, 2221002493
  %alu_24 = mul nuw i64 %alu_3, 2882303761
  %alu_27 = lshr i64 %alu_9, 32
  %alu_29 = and i64 %alu_14, 4294967295
  %alu_34 = add nuw nsw i64 %alu_27, %alu_29
  %alu_36 = and i64 %alu_19, 4294967295
  %alu_41 = add nuw nsw i64 %alu_34, %alu_36
  %alu_43 = lshr i64 %alu_14, 32
  %alu_46 = add nuw i64 %alu_43, %alu_24
  %alu_48 = lshr i64 %alu_19, 32
  %alu_51 = add nuw i64 %alu_46, %alu_48
  %alu_53 = lshr i64 %alu_41, 32
  %alu_56 = add nuw i64 %alu_51, %alu_53
  %alu_59 = lshr i64 %alu_56, 26
  ret i64 %alu_59
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden void @llb_sort_fixed_bytes(ptr noundef captures(none) %arg_v0, i32 noundef %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #0 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  %cmp_le_5 = icmp ult i32 %arg_v1, 2
  br i1 %cmp_le_5, label %common.ret, label %ite_else_8

common.ret:                                       ; preds = %loop_hdr_24, %ite_else_8, %entry
  ret void

ite_else_8:                                       ; preds = %entry
  %cmp_eq_15 = icmp eq i32 %arg_v2, 0
  br i1 %cmp_eq_15, label %common.ret, label %loop_hdr_24.preheader

loop_hdr_24.preheader:                            ; preds = %ite_else_8
  %arg_ext_v1.i.i = zext i32 %arg_v2 to i64
  br label %loop_hdr_24

loop_hdr_24:                                      ; preds = %loop_hdr_24.preheader, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortBytesPass.exit
  %loop_idx_28 = phi i64 [ %loop_next_29, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortBytesPass.exit ], [ 1, %loop_hdr_24.preheader ]
  %loop_cmp_30 = icmp samesign ult i64 %loop_idx_28, %arg_ext_v1
  br i1 %loop_cmp_30, label %loop_body_25, label %common.ret

loop_body_25:                                     ; preds = %loop_hdr_24
  %alu_17.i = add nuw nsw i64 %loop_idx_28, 4294967295
  br label %loop_hdr_4.i

loop_hdr_4.i:                                     ; preds = %loop_latch_6.i, %loop_body_25
  %loop_idx_8.i = phi i64 [ 0, %loop_body_25 ], [ %loop_next_9.i, %loop_latch_6.i ]
  %loop_cmp_10.i = icmp samesign ult i64 %loop_idx_8.i, %loop_idx_28
  br i1 %loop_cmp_10.i, label %loop_body_5.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortBytesPass.exit

loop_body_5.i:                                    ; preds = %loop_hdr_4.i
  %alu_23.i = sub nuw nsw i64 %alu_17.i, %loop_idx_8.i
  %alu_24.i.i = mul i64 %alu_23.i, %arg_ext_v1.i.i
  %alu_39.i.i.reass = sub nuw nsw i64 %loop_idx_28, %loop_idx_8.i
  %alu_45.i.i = mul i64 %alu_39.i.i.reass, %arg_ext_v1.i.i
  br label %loop_hdr_4.i.i

loop_hdr_4.i.i:                                   ; preds = %loop_latch_6.i.i, %loop_body_5.i
  %slot_v23.0.i.i = phi i64 [ 2, %loop_body_5.i ], [ %slot_v23.1.i.i, %loop_latch_6.i.i ]
  %loop_idx_8.i.i = phi i64 [ 0, %loop_body_5.i ], [ %loop_next_9.i.i, %loop_latch_6.i.i ]
  %loop_cmp_10.i.i = icmp samesign ult i64 %loop_idx_8.i.i, %arg_ext_v1.i.i
  br i1 %loop_cmp_10.i.i, label %loop_body_5.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_recGreater.exit.i

loop_body_5.i.i:                                  ; preds = %loop_hdr_4.i.i
  %cmp_eq_15.i.i = icmp eq i64 %slot_v23.0.i.i, 2
  br i1 %cmp_eq_15.i.i, label %ite_then_17.i.i, label %loop_latch_6.i.i

ite_then_17.i.i:                                  ; preds = %loop_body_5.i.i
  %alu_30.i.i = add i64 %loop_idx_8.i.i, %alu_24.i.i
  %0 = trunc i64 %alu_30.i.i to i32
  %rld_gep_34.i.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %0
  %rld_i8_35.i.i = load i8, ptr %rld_gep_34.i.i, align 1
  %alu_51.i.i = add i64 %loop_idx_8.i.i, %alu_45.i.i
  %1 = trunc i64 %alu_51.i.i to i32
  %rld_gep_55.i.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %1
  %rld_i8_56.i.i = load i8, ptr %rld_gep_55.i.i, align 1
  %cmp_lt_63.i.i = icmp ult i8 %rld_i8_35.i.i, %rld_i8_56.i.i
  br i1 %cmp_lt_63.i.i, label %loop_latch_6.i.i, label %ite_else_66.i.i

ite_else_66.i.i:                                  ; preds = %ite_then_17.i.i
  %cmp_lt_74.i.i = icmp ult i8 %rld_i8_56.i.i, %rld_i8_35.i.i
  %..i.i = select i1 %cmp_lt_74.i.i, i64 1, i64 2
  br label %loop_latch_6.i.i

loop_latch_6.i.i:                                 ; preds = %ite_else_66.i.i, %ite_then_17.i.i, %loop_body_5.i.i
  %slot_v23.1.i.i = phi i64 [ 0, %ite_then_17.i.i ], [ %..i.i, %ite_else_66.i.i ], [ %slot_v23.0.i.i, %loop_body_5.i.i ]
  %loop_next_9.i.i = add nuw nsw i64 %loop_idx_8.i.i, 1
  br label %loop_hdr_4.i.i

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_recGreater.exit.i: ; preds = %loop_hdr_4.i.i
  %cmp_eq_84.i.not.i = icmp eq i64 %slot_v23.0.i.i, 1
  br i1 %cmp_eq_84.i.not.i, label %loop_hdr_4.i8.i, label %loop_latch_6.i

loop_hdr_4.i8.i:                                  ; preds = %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_recGreater.exit.i, %loop_body_5.i11.i
  %loop_idx_8.i9.i = phi i64 [ %loop_next_9.i13.i, %loop_body_5.i11.i ], [ 0, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_recGreater.exit.i ]
  %loop_cmp_10.i10.i = icmp samesign ult i64 %loop_idx_8.i9.i, %arg_ext_v1.i.i
  br i1 %loop_cmp_10.i10.i, label %loop_body_5.i11.i, label %loop_latch_6.i

loop_body_5.i11.i:                                ; preds = %loop_hdr_4.i8.i
  %alu_23.i.i = add i64 %loop_idx_8.i9.i, %alu_24.i.i
  %alu_39.i12.i = add i64 %loop_idx_8.i9.i, %alu_45.i.i
  %2 = trunc i64 %alu_23.i.i to i32
  %rld_gep_43.i.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %2
  %rld_i8_44.i.i = load i8, ptr %rld_gep_43.i.i, align 1
  %3 = trunc i64 %alu_39.i12.i to i32
  %rld_gep_48.i.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %3
  %rld_i8_49.i.i = load i8, ptr %rld_gep_48.i.i, align 1
  store i8 %rld_i8_49.i.i, ptr %rld_gep_43.i.i, align 1
  store i8 %rld_i8_44.i.i, ptr %rld_gep_48.i.i, align 1
  %loop_next_9.i13.i = add nuw nsw i64 %loop_idx_8.i9.i, 1
  br label %loop_hdr_4.i8.i

loop_latch_6.i:                                   ; preds = %loop_hdr_4.i8.i, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_recGreater.exit.i
  %loop_next_9.i = add nuw nsw i64 %loop_idx_8.i, 1
  br label %loop_hdr_4.i

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_sortBytesPass.exit: ; preds = %loop_hdr_4.i
  %loop_next_29 = add nuw nsw i64 %loop_idx_28, 1
  br label %loop_hdr_24
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_miniscript_after_ok(i32 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %alu_182 = icmp sgt i32 %arg_v0, 0
  %ret_tr_27 = zext i1 %alu_182 to i8
  ret i8 %ret_tr_27
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 -128, 48) i8 @llb_witness_opcode_to_version(i8 noundef zeroext %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 0
  %0 = add nsw i8 %arg_v0, -80
  %1 = add i8 %arg_v0, -81
  %2 = icmp ult i8 %1, 16
  %narrow4 = select i1 %2, i8 %0, i8 -1
  %narrow = select i1 %cmp_eq_3, i8 0, i8 %narrow4
  ret i8 %narrow
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_standard_purpose_ok(i32 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %ite_cond_12.not = icmp sgt i32 %arg_v0, -1
  br i1 %ite_cond_12.not, label %common.ret, label %ite_then_13

ite_then_13:                                      ; preds = %entry
  %0 = and i32 %arg_v0, 2147483647
  switch i32 %0, label %ite_else_181 [
    i32 44, label %common.ret
    i32 49, label %common.ret
    i32 84, label %common.ret
    i32 86, label %common.ret
    i32 87, label %common.ret
    i32 45, label %common.ret
  ]

common.ret:                                       ; preds = %ite_then_13, %ite_then_13, %ite_then_13, %ite_then_13, %ite_then_13, %ite_then_13, %entry, %ite_else_181
  %common.ret.op.shrunk = phi i1 [ false, %ite_else_181 ], [ true, %ite_then_13 ], [ false, %entry ], [ true, %ite_then_13 ], [ true, %ite_then_13 ], [ true, %ite_then_13 ], [ true, %ite_then_13 ], [ true, %ite_then_13 ]
  %common.ret.op = zext i1 %common.ret.op.shrunk to i8
  ret i8 %common.ret.op

ite_else_181:                                     ; preds = %ite_then_13
  br label %common.ret
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef range(i32 0, -2147483648) i32 @llb_bip32_unharden(i32 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %0 = and i32 %arg_v0, 2147483647
  ret i32 %0
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: read)
define hidden range(i64 0, 25769803776) i64 @llb_read_compact_size_checked(ptr noundef readonly captures(none) %arg_v0, i32 noundef %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #5 {
entry:
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  %cmp_eq_3 = icmp eq i32 %arg_v1, 0
  br i1 %cmp_eq_3, label %common.ret, label %ite_else_6

common.ret:                                       ; preds = %ite_else_20, %ite_else_802, %ite_then_1004, %ite_then_691, %ite_then_465, %ite_then_547, %ite_then_355, %ite_then_106, %entry, %ite_then_1014, %ite_then_557, %ite_then_116
  %common.ret.op = phi i64 [ %alu_120, %ite_then_116 ], [ %alu_561, %ite_then_557 ], [ %alu_1018, %ite_then_1014 ], [ 0, %entry ], [ 0, %ite_then_106 ], [ 0, %ite_then_355 ], [ 0, %ite_then_547 ], [ 0, %ite_then_465 ], [ 0, %ite_then_691 ], [ 0, %ite_then_1004 ], [ 0, %ite_else_802 ], [ 0, %ite_else_20 ]
  ret i64 %common.ret.op

ite_else_6:                                       ; preds = %entry
  %rld_i8_12 = load i8, ptr %arg_v0, align 1
  %rld_val_13 = zext i8 %rld_i8_12 to i64
  %cmp_le_17 = icmp ult i8 %rld_i8_12, -3
  br i1 %cmp_le_17, label %ite_then_106, label %ite_else_20

ite_then_106:                                     ; preds = %ite_else_6
  %cmp_le_114.not = icmp samesign ugt i64 %rld_val_13, %arg_ext_v2
  br i1 %cmp_le_114.not, label %common.ret, label %ite_then_116

ite_then_116:                                     ; preds = %ite_then_106
  %alu_120 = or disjoint i64 %rld_val_13, 4294967296
  br label %common.ret

ite_else_20:                                      ; preds = %ite_else_6
  switch i8 %rld_i8_12, label %common.ret [
    i8 -3, label %ite_then_355
    i8 -2, label %ite_then_691
  ]

ite_then_355:                                     ; preds = %ite_else_20
  %cmp_lt_361 = icmp ult i32 %arg_v1, 3
  br i1 %cmp_lt_361, label %common.ret, label %ite_then_465

ite_then_465:                                     ; preds = %ite_then_355
  %rld_gep_470 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 1
  %rld_i8_471 = load i8, ptr %rld_gep_470, align 1
  %rld_val_472 = zext i8 %rld_i8_471 to i64
  %rld_gep_477 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 2
  %rld_i8_478 = load i8, ptr %rld_gep_477, align 1
  %rld_val_479 = zext i8 %rld_i8_478 to i64
  %alu_483 = shl nuw nsw i64 %rld_val_479, 8
  %alu_486 = or disjoint i64 %alu_483, %rld_val_472
  %cmp_le_503 = icmp samesign ugt i64 %alu_486, 252
  br i1 %cmp_le_503, label %ite_then_547, label %common.ret

ite_then_547:                                     ; preds = %ite_then_465
  %cmp_le_555.not = icmp samesign ugt i64 %alu_486, %arg_ext_v2
  br i1 %cmp_le_555.not, label %common.ret, label %ite_then_557

ite_then_557:                                     ; preds = %ite_then_547
  %alu_561 = or disjoint i64 %alu_486, 12884901888
  br label %common.ret

ite_then_691:                                     ; preds = %ite_else_20
  %cmp_lt_697 = icmp ult i32 %arg_v1, 5
  br i1 %cmp_lt_697, label %common.ret, label %ite_else_802

ite_else_802:                                     ; preds = %ite_then_691
  %rld_gep_903 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 1
  %rld_i8_904 = load i8, ptr %rld_gep_903, align 1
  %rld_val_905 = zext i8 %rld_i8_904 to i64
  %rld_gep_910 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 2
  %rld_i8_911 = load i8, ptr %rld_gep_910, align 1
  %rld_val_912 = zext i8 %rld_i8_911 to i64
  %alu_916 = shl nuw nsw i64 %rld_val_912, 8
  %alu_919 = or disjoint i64 %alu_916, %rld_val_905
  %rld_gep_922 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 3
  %rld_i8_923 = load i8, ptr %rld_gep_922, align 1
  %rld_val_924 = zext i8 %rld_i8_923 to i64
  %alu_928 = shl nuw nsw i64 %rld_val_924, 16
  %alu_931 = or disjoint i64 %alu_919, %alu_928
  %rld_gep_934 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 4
  %rld_i8_935 = load i8, ptr %rld_gep_934, align 1
  %rld_val_936 = zext i8 %rld_i8_935 to i64
  %alu_940 = shl nuw nsw i64 %rld_val_936, 24
  %alu_943 = or disjoint i64 %alu_931, %alu_940
  %cmp_le_975 = icmp samesign ugt i64 %alu_943, 65535
  br i1 %cmp_le_975, label %ite_then_1004, label %common.ret

ite_then_1004:                                    ; preds = %ite_else_802
  %cmp_le_1012.not = icmp samesign ugt i64 %alu_943, %arg_ext_v2
  br i1 %cmp_le_1012.not, label %common.ret, label %ite_then_1014

ite_then_1014:                                    ; preds = %ite_then_1004
  %alu_1018 = or disjoint i64 %alu_943, 21474836480
  br label %common.ret
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_varint_prefix_is_canonical(i8 noundef zeroext %arg_v0, i64 noundef %arg_v1) local_unnamed_addr #4 {
entry:
  %arg_ext_v0 = zext i8 %arg_v0 to i64
  %cmp_le_3 = icmp ult i8 %arg_v0, -3
  %cmp_eq_9 = icmp eq i64 %arg_v1, %arg_ext_v0
  %cmp_eq_13 = icmp eq i8 %arg_v0, -3
  %0 = add i64 %arg_v1, -253
  %sel_24.v = icmp ult i64 %0, 65283
  %cmp_eq_28 = icmp eq i8 %arg_v0, -2
  %1 = add i64 %arg_v1, -65536
  %sel_39.v = icmp ult i64 %1, 4294901760
  %cmp_le_42 = icmp ugt i64 %arg_v1, 4294967295
  %sel_47.v = select i1 %cmp_eq_28, i1 %sel_39.v, i1 %cmp_le_42
  %sel_52.v = select i1 %cmp_eq_13, i1 %sel_24.v, i1 %sel_47.v
  %sel_57.v = select i1 %cmp_le_3, i1 %cmp_eq_9, i1 %sel_52.v
  %ret_tr_60 = zext i1 %sel_57.v to i8
  ret i8 %ret_tr_60
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_miniscript_andor_branches_valid(i8 noundef zeroext %arg_v0, i8 noundef zeroext %arg_v1, i8 noundef zeroext %arg_v2) local_unnamed_addr #2 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 100
  %cmp_eq_7 = icmp eq i8 %arg_v1, 103
  %alu_181 = and i1 %cmp_eq_3, %cmp_eq_7
  %cmp_eq_28 = icmp eq i8 %arg_v2, 104
  %alu_392 = and i1 %alu_181, %cmp_eq_28
  %ret_tr_48 = zext i1 %alu_392 to i8
  ret i8 %ret_tr_48
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: write)
define internal fastcc range(i64 72057594037927936, 0) i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr noundef writeonly captures(none) %arg_v0, i64 noundef %arg_v1, i16 noundef zeroext range(i16 -32768, 0) %arg_v2) unnamed_addr #6 {
entry:
  %alu_2 = lshr i64 %arg_v1, 56
  %alu_6 = and i64 %alu_2, 127
  %cmp_le_15 = icmp samesign ugt i64 %alu_6, 63
  br i1 %cmp_le_15, label %common.ret, label %ite_else_18

common.ret:                                       ; preds = %entry, %ite_else_18
  %common.ret.op = phi i64 [ %alu_43, %ite_else_18 ], [ -9223372036854775808, %entry ]
  ret i64 %common.ret.op

ite_else_18:                                      ; preds = %entry
  %call_tr_23 = trunc nuw nsw i64 %alu_6 to i32
  %alu_5.i = shl nuw nsw i32 %call_tr_23, 1
  %rst_gep_13.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %alu_5.i
  %rst_tr8_14.i = trunc i16 %arg_v2 to i8
  store i8 %rst_tr8_14.i, ptr %rst_gep_13.i, align 1
  %0 = lshr i16 %arg_v2, 8
  %rst_gep_33.i = getelementptr inbounds nuw i8, ptr %rst_gep_13.i, i32 1
  %rst_tr8_34.i = trunc nuw i16 %0 to i8
  store i8 %rst_tr8_34.i, ptr %rst_gep_33.i, align 1
  %alu_34 = and i64 %arg_v1, -9151314442816847873
  %alu_30 = shl nuw nsw i64 %alu_6, 56
  %alu_39 = add nuw nsw i64 %alu_30, 72057594037927936
  %alu_43 = or disjoint i64 %alu_39, %alu_34
  br label %common.ret
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_miniscript_older_ok(i32 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %arg_ext_v0 = zext i32 %arg_v0 to i64
  %alu_2 = and i64 %arg_ext_v0, 4290707456
  %cmp_eq_7 = icmp eq i64 %alu_2, 0
  %alu_10 = and i64 %arg_ext_v0, 65535
  %cmp_le_15.not = icmp ne i64 %alu_10, 0
  %alu_262 = and i1 %cmp_eq_7, %cmp_le_15.not
  %ret_tr_35 = zext i1 %alu_262 to i8
  ret i8 %ret_tr_35
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(none)
define internal fastcc i32 @l_BitcoinLedger_FreestandingKernels_fracSigLen(i32 noundef %arg_v0) unnamed_addr #7 {
entry:
  %arg_ext_v0 = zext i32 %arg_v0 to i64
  br label %loop_hdr_6

loop_hdr_6:                                       ; preds = %loop_latch_8, %entry
  %slot_v46.0 = phi i64 [ %arg_ext_v0, %entry ], [ %slot_v46.1, %loop_latch_8 ]
  %loop_idx_10 = phi i64 [ 0, %entry ], [ %loop_next_11, %loop_latch_8 ]
  %loop_cmp_12 = icmp samesign ult i64 %loop_idx_10, 8
  br i1 %loop_cmp_12, label %loop_body_7, label %loop_exit_9

loop_body_7:                                      ; preds = %loop_hdr_6
  %alu_16 = and i64 %slot_v46.0, 4294967295
  %alu_28 = mul nuw i64 %alu_16, 3435973837
  %alu_30 = lshr i64 %alu_28, 35
  %alu_36.neg = mul nuw nsw i64 %alu_30, 4294967286
  %alu_42 = add i64 %alu_36.neg, %slot_v46.0
  %alu_43 = and i64 %alu_42, 4294967295
  %cmp_eq_48 = icmp eq i64 %alu_43, 0
  br i1 %cmp_eq_48, label %ite_then_50, label %loop_latch_8

ite_then_50:                                      ; preds = %loop_body_7
  %cmp_eq_24.not = icmp eq i64 %alu_16, 0
  %0 = and i64 %slot_v46.0, -4294967296
  %alu_74 = add i64 %0, 4294967296
  %alu_88 = or disjoint i64 %alu_30, %alu_74
  %alu_102 = select i1 %cmp_eq_24.not, i64 %slot_v46.0, i64 %alu_88
  br label %loop_latch_8

loop_latch_8:                                     ; preds = %loop_body_7, %ite_then_50
  %slot_v46.1 = phi i64 [ %alu_102, %ite_then_50 ], [ %slot_v46.0, %loop_body_7 ]
  %loop_next_11 = add nuw nsw i64 %loop_idx_10, 1
  br label %loop_hdr_6

loop_exit_9:                                      ; preds = %loop_hdr_6
  %cmp_eq_161 = icmp eq i32 %arg_v0, 0
  %alu_163 = lshr i64 %slot_v46.0, 32
  %alu_168 = sub nsw i64 8, %alu_163
  %alu_18415 = select i1 %cmp_eq_161, i64 0, i64 4294967295
  %alu_190 = and i64 %alu_168, %alu_18415
  %ret_tr_194 = trunc nuw i64 %alu_190 to i32
  ret i32 %ret_tr_194
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef range(i32 0, 734539940) i32 @llb_bech32_final_constant(i8 noundef zeroext %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 1
  %cmp_eq_7 = icmp eq i8 %arg_v0, 2
  %0 = select i1 %cmp_eq_7, i32 734539939, i32 0
  %ret_tr_16 = select i1 %cmp_eq_3, i32 1, i32 %0
  ret i32 %ret_tr_16
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 -1, 2) i8 @llb_merkle_state_dir(i64 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %alu_1 = lshr i64 %arg_v0, 32
  %alu_5 = and i64 %arg_v0, 4294967295
  %cmp_le_9 = icmp ult i64 %arg_v0, 8589934592
  %cmp_lt_15 = icmp samesign ult i64 %alu_5, %alu_1
  %alu_18 = add nuw nsw i64 %alu_1, 4294967295
  %alu_19 = and i64 %alu_18, 4294967295
  %alu_22 = lshr i64 %alu_19, 1
  %alu_27 = or i64 %alu_22, %alu_19
  %alu_31 = lshr i64 %alu_27, 2
  %alu_36 = or i64 %alu_31, %alu_27
  %alu_40 = lshr i64 %alu_36, 4
  %alu_45 = or i64 %alu_40, %alu_36
  %alu_49 = lshr i64 %alu_45, 8
  %alu_54 = or i64 %alu_49, %alu_45
  %0 = lshr i64 %alu_54, 17
  %1 = lshr i64 %alu_54, 1
  %alu_67 = or i64 %0, %1
  %cmp_lt_77.not = icmp samesign ugt i64 %alu_5, %alu_67
  %2 = zext i1 %cmp_lt_77.not to i8
  %3 = select i1 %cmp_lt_15, i8 %2, i8 -1
  %ret_tr_94 = select i1 %cmp_le_9, i8 -1, i8 %3
  ret i8 %ret_tr_94
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_minimal_push_opcode_ok(i8 noundef zeroext %arg_v0, i8 noundef zeroext %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #4 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 0
  %cmp_eq_7 = icmp eq i32 %arg_v2, 0
  %alu_6 = zext i1 %cmp_eq_7 to i8
  %cmp_eq_11 = icmp eq i8 %arg_v0, 79
  %alu_10 = zext i1 %cmp_eq_11 to i8
  %cmp_eq_15 = icmp eq i32 %arg_v2, 1
  %cmp_eq_19 = icmp eq i8 %arg_v1, -127
  %sel_24.v = select i1 %cmp_eq_15, i1 %cmp_eq_19, i1 %cmp_eq_3
  %sel_24 = zext i1 %sel_24.v to i8
  %cmp_le_28 = icmp ugt i8 %arg_v0, 80
  %cmp_le_32 = icmp ult i8 %arg_v0, 97
  %alu_35 = add i8 %arg_v0, -80
  %cmp_eq_42 = icmp eq i8 %arg_v1, %alu_35
  %alu_41 = zext i1 %cmp_eq_42 to i8
  %sel_47 = select i1 %cmp_eq_15, i8 %alu_41, i8 %alu_10
  %cmp_eq_51 = icmp eq i8 %arg_v0, 1
  %alu_50 = zext i1 %cmp_eq_51 to i8
  %cmp_le_55.not = icmp eq i8 %arg_v1, 0
  %cmp_le_59 = icmp ult i8 %arg_v1, 17
  %0 = zext i8 %arg_v0 to i32
  %cmp_eq_100 = icmp eq i32 %arg_v2, %0
  %alu_99 = zext i1 %cmp_eq_100 to i8
  %cmp_eq_104 = icmp eq i8 %arg_v0, 76
  %cmp_le_108 = icmp ugt i32 %arg_v2, 75
  %cmp_le_112 = icmp ult i32 %arg_v2, 256
  %alu_111 = zext i1 %cmp_le_112 to i8
  %sel_117 = select i1 %cmp_le_108, i8 %alu_111, i8 %alu_10
  %cmp_eq_121 = icmp eq i8 %arg_v0, 77
  %cmp_le_125 = icmp ugt i32 %arg_v2, 255
  %cmp_le_129 = icmp ult i32 %arg_v2, 65536
  %alu_128 = zext i1 %cmp_le_129 to i8
  %sel_134 = select i1 %cmp_le_125, i8 %alu_128, i8 %alu_10
  %cmp_eq_138 = icmp eq i8 %arg_v0, 78
  %cmp_le_142 = icmp ugt i32 %arg_v2, 65535
  %narrow = and i1 %cmp_eq_138, %cmp_le_142
  %sel_147 = zext i1 %narrow to i8
  %sel_152 = select i1 %cmp_eq_121, i8 %sel_134, i8 %sel_147
  %sel_157 = select i1 %cmp_eq_104, i8 %sel_117, i8 %sel_152
  %1 = add i8 %arg_v0, -2
  %2 = icmp ult i8 %1, 74
  %sel_167 = select i1 %2, i8 %alu_99, i8 %sel_157
  %sel_177 = select i1 %cmp_le_32, i8 %sel_47, i8 %sel_167
  %sel_182 = select i1 %cmp_eq_19, i8 %alu_10, i8 %alu_50
  %sel_187 = select i1 %cmp_le_59, i8 %alu_10, i8 %sel_182
  %sel_192 = select i1 %cmp_eq_11, i8 1, i8 %sel_182
  %sel_197 = select i1 %cmp_le_55.not, i8 %sel_192, i8 %sel_187
  %sel_202 = select i1 %cmp_eq_15, i8 %sel_197, i8 %alu_10
  %sel_207 = select i1 %cmp_eq_51, i8 %sel_202, i8 %sel_167
  %sel_212 = select i1 %cmp_le_28, i8 %sel_177, i8 %sel_207
  %sel_217 = select i1 %cmp_eq_11, i8 %sel_24, i8 %sel_212
  %sel_222 = select i1 %cmp_eq_3, i8 %alu_6, i8 %sel_217
  ret i8 %sel_222
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden range(i64 0, 8589934592) i64 @llb_psbt_determine_locktime(ptr noundef readonly captures(none) %arg_v0, i32 noundef %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #1 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %l_BitcoinLedger_FreestandingKernels_ltRecord.exit, %entry
  %slot_v9.0 = phi i64 [ -9223372036854775808, %entry ], [ %common.ret.op.i, %l_BitcoinLedger_FreestandingKernels_ltRecord.exit ]
  %loop_idx_8 = phi i64 [ 0, %entry ], [ %loop_next_9, %l_BitcoinLedger_FreestandingKernels_ltRecord.exit ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v1
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %call_tr_15 = trunc nuw i64 %loop_idx_8 to i32
  %0 = mul i32 %call_tr_15, 10
  %1 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %0
  %rld_gep_14.i = getelementptr inbounds nuw i8, ptr %1, i32 1
  %rld_i8_15.i = load i8, ptr %rld_gep_14.i, align 1
  %rld_val_16.i = zext i8 %rld_i8_15.i to i64
  %rld_gep_27.i = getelementptr i8, ptr %1, i32 2
  %rld_i8_28.i = load i8, ptr %rld_gep_27.i, align 1
  %rld_val_29.i = zext i8 %rld_i8_28.i to i64
  %alu_37.i = shl nuw nsw i64 %rld_val_29.i, 8
  %alu_44.i = or disjoint i64 %alu_37.i, %rld_val_16.i
  %rld_gep_54.i = getelementptr i8, ptr %1, i32 3
  %rld_i8_55.i = load i8, ptr %rld_gep_54.i, align 1
  %rld_val_56.i = zext i8 %rld_i8_55.i to i64
  %alu_64.i = shl nuw nsw i64 %rld_val_56.i, 16
  %alu_71.i = or disjoint i64 %alu_44.i, %alu_64.i
  %rld_gep_81.i = getelementptr i8, ptr %1, i32 4
  %rld_i8_82.i = load i8, ptr %rld_gep_81.i, align 1
  %rld_val_83.i = zext i8 %rld_i8_82.i to i64
  %alu_91.i = shl nuw nsw i64 %rld_val_83.i, 24
  %alu_98.i = or disjoint i64 %alu_71.i, %alu_91.i
  %rld_gep_108.i = getelementptr i8, ptr %1, i32 6
  %rld_i8_109.i = load i8, ptr %rld_gep_108.i, align 1
  %rld_val_110.i = zext i8 %rld_i8_109.i to i64
  %rld_gep_121.i = getelementptr i8, ptr %1, i32 7
  %rld_i8_122.i = load i8, ptr %rld_gep_121.i, align 1
  %rld_val_123.i = zext i8 %rld_i8_122.i to i64
  %alu_131.i = shl nuw nsw i64 %rld_val_123.i, 8
  %alu_138.i = or disjoint i64 %alu_131.i, %rld_val_110.i
  %rld_gep_148.i = getelementptr i8, ptr %1, i32 8
  %rld_i8_149.i = load i8, ptr %rld_gep_148.i, align 1
  %rld_val_150.i = zext i8 %rld_i8_149.i to i64
  %alu_158.i = shl nuw nsw i64 %rld_val_150.i, 16
  %alu_165.i = or disjoint i64 %alu_138.i, %alu_158.i
  %rld_gep_175.i = getelementptr i8, ptr %1, i32 9
  %rld_i8_176.i = load i8, ptr %rld_gep_175.i, align 1
  %rld_val_177.i = zext i8 %rld_i8_176.i to i64
  %alu_185.i = shl nuw nsw i64 %rld_val_177.i, 24
  %alu_192.i = or disjoint i64 %alu_165.i, %alu_185.i
  %rld_i8_197.i = load i8, ptr %1, align 1
  %rld_gep_207.i = getelementptr i8, ptr %1, i32 5
  %rld_i8_208.i = load i8, ptr %rld_gep_207.i, align 1
  %cmp_eq_215.i = icmp eq i8 %rld_i8_197.i, 0
  %cmp_eq_225.i = icmp eq i8 %rld_i8_208.i, 0
  br i1 %cmp_eq_215.i, label %ite_then_217.i, label %ite_else_218.i

ite_then_217.i:                                   ; preds = %loop_body_5
  br i1 %cmp_eq_225.i, label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit, label %ite_else_228.i

ite_else_228.i:                                   ; preds = %ite_then_217.i
  %cmp_eq_2299.i = icmp eq i64 %slot_v9.0, 0
  br i1 %cmp_eq_2299.i, label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit, label %ite_else_2302.i

ite_else_2302.i:                                  ; preds = %ite_else_228.i
  %cmp_le_2274.i = icmp samesign ugt i64 %alu_192.i, 499999999
  %alu_3302.i = and i64 %slot_v9.0, 4294967295
  %cmp_lt_3374.i = icmp samesign ult i64 %alu_3302.i, %alu_192.i
  %alu_3383.i = select i1 %cmp_lt_3374.i, i64 4294967295, i64 0
  %alu_3388.i = xor i64 %alu_192.i, %alu_3302.i
  %alu_3394.i = and i64 %alu_3383.i, %alu_3388.i
  %alu_3400.i = xor i64 %alu_3394.i, %alu_3302.i
  %2 = and i64 %slot_v9.0, 6917529027641081856
  %cmp_eq_3407.i = icmp eq i64 %2, 0
  %alu_3427.i = or disjoint i64 %alu_192.i, -2305843009213693952
  %alu_3512.i = or disjoint i64 %alu_3400.i, -2305843009213693952
  %.mask.i = and i64 %slot_v9.0, 2305843009213693952
  %isneg.not.i = icmp eq i64 %.mask.i, 0
  %alu_4039.i = select i1 %isneg.not.i, i64 0, i64 %alu_3512.i
  %alu_4058.i = select i1 %cmp_eq_3407.i, i64 %alu_3427.i, i64 %alu_4039.i
  %alu_4157.i = select i1 %cmp_le_2274.i, i64 %alu_4058.i, i64 0
  br label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit

ite_else_218.i:                                   ; preds = %loop_body_5
  %cmp_eq_4276.i = icmp eq i64 %slot_v9.0, 0
  br i1 %cmp_eq_225.i, label %ite_then_4171.i, label %ite_else_4172.i

ite_then_4171.i:                                  ; preds = %ite_else_218.i
  br i1 %cmp_eq_4276.i, label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit, label %ite_else_4279.i

ite_else_4279.i:                                  ; preds = %ite_then_4171.i
  %3 = add nsw i64 %alu_98.i, -1
  %alu_4206862.i = icmp ult i64 %3, 499999999
  %alu_5251.i = lshr i64 %slot_v9.0, 61
  %alu_5255.i = and i64 %alu_5251.i, 3
  %cmp_eq_5268.i = icmp eq i64 %alu_5255.i, 1
  %alu_5271.i = lshr i64 %slot_v9.0, 32
  %alu_5275.i = and i64 %alu_5271.i, 536870911
  %alu_5279.i = and i64 %slot_v9.0, 4294967295
  %alu_5305.i = select i1 %cmp_eq_5268.i, i64 %alu_5275.i, i64 %alu_5279.i
  %cmp_lt_5314.i = icmp samesign ult i64 %alu_5305.i, %alu_98.i
  %alu_5323.i = select i1 %cmp_lt_5314.i, i64 4294967295, i64 0
  %alu_5328.i = xor i64 %alu_98.i, %alu_5305.i
  %alu_5334.i = and i64 %alu_5323.i, %alu_5328.i
  %alu_5340.i = xor i64 %alu_5334.i, %alu_5305.i
  %cmp_eq_5384.i = icmp eq i64 %alu_5255.i, 0
  %alu_5401.i = or disjoint i64 %alu_98.i, -4611686018427387904
  %alu_5486.i = or disjoint i64 %alu_5340.i, -4611686018427387904
  %4 = add nsw i64 %alu_5255.i, -1
  %alu_5856863.i = icmp samesign ult i64 %4, 2
  %alu_5878.i = select i1 %alu_5856863.i, i64 %alu_5486.i, i64 0
  %alu_5897.i = select i1 %cmp_eq_5384.i, i64 %alu_5401.i, i64 %alu_5878.i
  %alu_6134.i = select i1 %alu_4206862.i, i64 %alu_5897.i, i64 0
  br label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit

ite_else_4172.i:                                  ; preds = %ite_else_218.i
  br i1 %cmp_eq_4276.i, label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit, label %ite_else_6246.i

ite_else_6246.i:                                  ; preds = %ite_else_4172.i
  %cmp_le_6218.i = icmp samesign ugt i64 %alu_192.i, 499999999
  %5 = add nsw i64 %alu_98.i, -1
  %alu_6173860.i = icmp ult i64 %5, 499999999
  %alu_7188861.i = and i1 %alu_6173860.i, %cmp_le_6218.i
  %alu_7218.i = lshr i64 %slot_v9.0, 61
  %alu_7222.i = and i64 %alu_7218.i, 3
  %cmp_eq_7235.i = icmp eq i64 %alu_7222.i, 1
  %alu_7238.i = lshr i64 %slot_v9.0, 32
  %alu_7242.i = and i64 %alu_7238.i, 536870911
  %alu_7246.i = and i64 %slot_v9.0, 4294967295
  %alu_7272.i = select i1 %cmp_eq_7235.i, i64 %alu_7242.i, i64 %alu_7246.i
  %cmp_lt_7281.i = icmp samesign ult i64 %alu_7272.i, %alu_98.i
  %alu_7290.i = select i1 %cmp_lt_7281.i, i64 4294967295, i64 0
  %alu_7295.i = xor i64 %alu_98.i, %alu_7272.i
  %alu_7301.i = and i64 %alu_7290.i, %alu_7295.i
  %alu_7307.i = xor i64 %alu_7301.i, %alu_7272.i
  %cmp_lt_7318.i = icmp samesign ult i64 %alu_7246.i, %alu_192.i
  %alu_7327.i = select i1 %cmp_lt_7318.i, i64 4294967295, i64 0
  %alu_7332.i = xor i64 %alu_192.i, %alu_7246.i
  %alu_7338.i = and i64 %alu_7327.i, %alu_7332.i
  %alu_7344.i = xor i64 %alu_7338.i, %alu_7246.i
  %cmp_eq_7351.i = icmp eq i64 %alu_7222.i, 0
  %alu_7356.i = shl nuw i64 %alu_98.i, 32
  %alu_7360.i = or disjoint i64 %alu_7356.i, %alu_192.i
  %alu_7365.i = or i64 %alu_7360.i, -6917529027641081856
  %alu_7441.i = shl nuw i64 %alu_7307.i, 32
  %alu_7445.i = or disjoint i64 %alu_7344.i, %alu_7441.i
  %alu_7450.i = or i64 %alu_7445.i, -6917529027641081856
  %alu_7453.i = or disjoint i64 %alu_7307.i, -4611686018427387904
  %alu_7456.i = or disjoint i64 %alu_7344.i, -2305843009213693952
  %cmp_eq_7521.i = icmp eq i64 %alu_7222.i, 2
  %alu_7698.i = select i1 %cmp_eq_7521.i, i64 %alu_7453.i, i64 %alu_7456.i
  %alu_7714.i = select i1 %cmp_eq_7235.i, i64 %alu_7450.i, i64 %alu_7698.i
  %alu_7730.i = select i1 %cmp_eq_7351.i, i64 %alu_7365.i, i64 %alu_7714.i
  %alu_8101.i = select i1 %alu_7188861.i, i64 %alu_7730.i, i64 0
  br label %l_BitcoinLedger_FreestandingKernels_ltRecord.exit

l_BitcoinLedger_FreestandingKernels_ltRecord.exit: ; preds = %ite_then_217.i, %ite_else_228.i, %ite_else_2302.i, %ite_then_4171.i, %ite_else_4279.i, %ite_else_4172.i, %ite_else_6246.i
  %common.ret.op.i = phi i64 [ %alu_4157.i, %ite_else_2302.i ], [ %alu_6134.i, %ite_else_4279.i ], [ %alu_8101.i, %ite_else_6246.i ], [ 0, %ite_else_228.i ], [ 0, %ite_then_4171.i ], [ 0, %ite_else_4172.i ], [ %slot_v9.0, %ite_then_217.i ]
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  %alu_20 = lshr i64 %slot_v9.0, 61
  %alu_22 = and i64 %alu_20, 3
  %cmp_eq_25 = icmp eq i64 %alu_22, 0
  %cmp_eq_28 = icmp eq i64 %alu_22, 1
  %alu_53 = lshr i64 %slot_v9.0, 32
  %alu_55 = and i64 %alu_53, 536870911
  %alu_59 = and i64 %slot_v9.0, 4294967295
  %alu_110 = select i1 %cmp_eq_28, i64 %alu_55, i64 %alu_59
  %alu_119 = select i1 %cmp_eq_25, i64 4294967295, i64 0
  %alu_124 = xor i64 %alu_110, %arg_ext_v2
  %alu_130 = and i64 %alu_124, %alu_119
  %alu_136 = xor i64 %alu_130, %alu_110
  %cmp_eq_140 = icmp eq i64 %slot_v9.0, 0
  %alu_144 = or disjoint i64 %alu_136, 4294967296
  %sel_158 = select i1 %cmp_eq_140, i64 0, i64 %alu_144
  ret i64 %sel_158
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_psbt_locktime_step(i64 noundef %arg_v0, i8 noundef zeroext %arg_v1, i32 noundef %arg_v2, i8 noundef zeroext %arg_v3, i32 noundef %arg_v4) local_unnamed_addr #4 {
entry:
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  %arg_ext_v4 = zext i32 %arg_v4 to i64
  %cmp_eq_5 = icmp eq i8 %arg_v1, 0
  %cmp_eq_15 = icmp eq i8 %arg_v3, 0
  br i1 %cmp_eq_5, label %ite_then_7, label %ite_else_8

ite_then_7:                                       ; preds = %entry
  br i1 %cmp_eq_15, label %common.ret, label %ite_else_18

common.ret:                                       ; preds = %ite_then_7, %ite_else_3958, %ite_then_3957, %ite_else_18, %ite_else_6030, %ite_else_4065, %ite_else_2090
  %common.ret.op = phi i64 [ %alu_3944, %ite_else_2090 ], [ %alu_5919, %ite_else_4065 ], [ %alu_7884, %ite_else_6030 ], [ 0, %ite_else_18 ], [ 0, %ite_then_3957 ], [ 0, %ite_else_3958 ], [ %arg_v0, %ite_then_7 ]
  ret i64 %common.ret.op

ite_else_18:                                      ; preds = %ite_then_7
  %cmp_eq_2087 = icmp eq i64 %arg_v0, 0
  br i1 %cmp_eq_2087, label %common.ret, label %ite_else_2090

ite_else_2090:                                    ; preds = %ite_else_18
  %cmp_le_2062 = icmp ugt i32 %arg_v4, 499999999
  %alu_3089 = and i64 %arg_v0, 4294967295
  %cmp_lt_3161 = icmp samesign ult i64 %alu_3089, %arg_ext_v4
  %alu_3170 = select i1 %cmp_lt_3161, i64 4294967295, i64 0
  %alu_3175 = xor i64 %alu_3089, %arg_ext_v4
  %alu_3181 = and i64 %alu_3170, %alu_3175
  %alu_3187 = xor i64 %alu_3181, %alu_3089
  %0 = and i64 %arg_v0, 6917529027641081856
  %cmp_eq_3194 = icmp eq i64 %0, 0
  %alu_3214 = or disjoint i64 %arg_ext_v4, -2305843009213693952
  %alu_3299 = or disjoint i64 %alu_3187, -2305843009213693952
  %.mask = and i64 %arg_v0, 2305843009213693952
  %isneg.not = icmp eq i64 %.mask, 0
  %alu_3826 = select i1 %isneg.not, i64 0, i64 %alu_3299
  %alu_3845 = select i1 %cmp_eq_3194, i64 %alu_3214, i64 %alu_3826
  %alu_3944 = select i1 %cmp_le_2062, i64 %alu_3845, i64 0
  br label %common.ret

ite_else_8:                                       ; preds = %entry
  %cmp_eq_4062 = icmp eq i64 %arg_v0, 0
  br i1 %cmp_eq_15, label %ite_then_3957, label %ite_else_3958

ite_then_3957:                                    ; preds = %ite_else_8
  br i1 %cmp_eq_4062, label %common.ret, label %ite_else_4065

ite_else_4065:                                    ; preds = %ite_then_3957
  %1 = add i32 %arg_v2, -1
  %alu_3992849 = icmp ult i32 %1, 499999999
  %alu_5036 = lshr i64 %arg_v0, 61
  %alu_5040 = and i64 %alu_5036, 3
  %cmp_eq_5053 = icmp eq i64 %alu_5040, 1
  %alu_5056 = lshr i64 %arg_v0, 32
  %alu_5060 = and i64 %alu_5056, 536870911
  %alu_5064 = and i64 %arg_v0, 4294967295
  %alu_5090 = select i1 %cmp_eq_5053, i64 %alu_5060, i64 %alu_5064
  %cmp_lt_5099 = icmp samesign ult i64 %alu_5090, %arg_ext_v2
  %alu_5108 = select i1 %cmp_lt_5099, i64 4294967295, i64 0
  %alu_5113 = xor i64 %alu_5090, %arg_ext_v2
  %alu_5119 = and i64 %alu_5108, %alu_5113
  %alu_5125 = xor i64 %alu_5119, %alu_5090
  %cmp_eq_5169 = icmp eq i64 %alu_5040, 0
  %alu_5186 = or disjoint i64 %arg_ext_v2, -4611686018427387904
  %alu_5271 = or disjoint i64 %alu_5125, -4611686018427387904
  %2 = add nsw i64 %alu_5040, -1
  %alu_5641850 = icmp samesign ult i64 %2, 2
  %alu_5663 = select i1 %alu_5641850, i64 %alu_5271, i64 0
  %alu_5682 = select i1 %cmp_eq_5169, i64 %alu_5186, i64 %alu_5663
  %alu_5919 = select i1 %alu_3992849, i64 %alu_5682, i64 0
  br label %common.ret

ite_else_3958:                                    ; preds = %ite_else_8
  br i1 %cmp_eq_4062, label %common.ret, label %ite_else_6030

ite_else_6030:                                    ; preds = %ite_else_3958
  %cmp_le_6002 = icmp ugt i32 %arg_v4, 499999999
  %3 = add i32 %arg_v2, -1
  %alu_5957847 = icmp ult i32 %3, 499999999
  %alu_6971848 = and i1 %alu_5957847, %cmp_le_6002
  %alu_7001 = lshr i64 %arg_v0, 61
  %alu_7005 = and i64 %alu_7001, 3
  %cmp_eq_7018 = icmp eq i64 %alu_7005, 1
  %alu_7021 = lshr i64 %arg_v0, 32
  %alu_7025 = and i64 %alu_7021, 536870911
  %alu_7029 = and i64 %arg_v0, 4294967295
  %alu_7055 = select i1 %cmp_eq_7018, i64 %alu_7025, i64 %alu_7029
  %cmp_lt_7064 = icmp samesign ult i64 %alu_7055, %arg_ext_v2
  %alu_7073 = select i1 %cmp_lt_7064, i64 4294967295, i64 0
  %alu_7078 = xor i64 %alu_7055, %arg_ext_v2
  %alu_7084 = and i64 %alu_7073, %alu_7078
  %alu_7090 = xor i64 %alu_7084, %alu_7055
  %cmp_lt_7101 = icmp samesign ult i64 %alu_7029, %arg_ext_v4
  %alu_7110 = select i1 %cmp_lt_7101, i64 4294967295, i64 0
  %alu_7115 = xor i64 %alu_7029, %arg_ext_v4
  %alu_7121 = and i64 %alu_7110, %alu_7115
  %alu_7127 = xor i64 %alu_7121, %alu_7029
  %cmp_eq_7134 = icmp eq i64 %alu_7005, 0
  %alu_7139 = shl nuw i64 %arg_ext_v2, 32
  %alu_7143 = or disjoint i64 %alu_7139, %arg_ext_v4
  %alu_7148 = or i64 %alu_7143, -6917529027641081856
  %alu_7224 = shl nuw i64 %alu_7090, 32
  %alu_7228 = or disjoint i64 %alu_7224, %alu_7127
  %alu_7233 = or i64 %alu_7228, -6917529027641081856
  %alu_7236 = or disjoint i64 %alu_7090, -4611686018427387904
  %alu_7239 = or disjoint i64 %alu_7127, -2305843009213693952
  %cmp_eq_7304 = icmp eq i64 %alu_7005, 2
  %alu_7481 = select i1 %cmp_eq_7304, i64 %alu_7236, i64 %alu_7239
  %alu_7497 = select i1 %cmp_eq_7018, i64 %alu_7233, i64 %alu_7481
  %alu_7513 = select i1 %cmp_eq_7134, i64 %alu_7148, i64 %alu_7497
  %alu_7884 = select i1 %alu_6971848, i64 %alu_7513, i64 0
  br label %common.ret
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden range(i64 0, 8589934592) i64 @llb_psbt_locktime_finalize(i64 noundef %arg_v0, i32 noundef %arg_v1) local_unnamed_addr #4 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  %alu_1 = lshr i64 %arg_v0, 61
  %alu_3 = and i64 %alu_1, 3
  %cmp_eq_6 = icmp eq i64 %alu_3, 0
  %cmp_eq_9 = icmp eq i64 %alu_3, 1
  %alu_33 = lshr i64 %arg_v0, 32
  %alu_35 = and i64 %alu_33, 536870911
  %alu_39 = and i64 %arg_v0, 4294967295
  %alu_88 = select i1 %cmp_eq_9, i64 %alu_35, i64 %alu_39
  %alu_96 = select i1 %cmp_eq_6, i64 4294967295, i64 0
  %alu_101 = xor i64 %alu_88, %arg_ext_v1
  %alu_107 = and i64 %alu_101, %alu_96
  %alu_113 = xor i64 %alu_107, %alu_88
  %cmp_eq_117 = icmp eq i64 %arg_v0, 0
  %alu_121 = or disjoint i64 %alu_113, 4294967296
  %sel_129 = select i1 %cmp_eq_117, i64 0, i64 %alu_121
  ret i64 %sel_129
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_taproot_sighash_valid(i8 noundef zeroext %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 0
  %0 = and i8 %arg_v0, 127
  %1 = add nsw i8 %0, -1
  %narrow = icmp ult i8 %1, 3
  %narrow5 = select i1 %cmp_eq_3, i1 true, i1 %narrow
  %ret_tr_28 = zext i1 %narrow5 to i8
  ret i8 %ret_tr_28
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_merkle_advance_state(i64 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %alu_1 = lshr i64 %arg_v0, 32
  %alu_5 = and i64 %arg_v0, 4294967295
  %cmp_le_9 = icmp ult i64 %arg_v0, 8589934592
  %alu_12 = add nuw nsw i64 %alu_1, 4294967295
  %alu_13 = and i64 %alu_12, 4294967295
  %alu_16 = lshr i64 %alu_13, 1
  %alu_21 = or i64 %alu_16, %alu_13
  %alu_25 = lshr i64 %alu_21, 2
  %alu_30 = or i64 %alu_25, %alu_21
  %alu_34 = lshr i64 %alu_30, 4
  %alu_39 = or i64 %alu_34, %alu_30
  %alu_43 = lshr i64 %alu_39, 8
  %alu_48 = or i64 %alu_43, %alu_39
  %0 = lshr i64 %alu_48, 17
  %1 = lshr i64 %alu_48, 1
  %alu_61 = or i64 %0, %1
  %alu_64 = add nuw nsw i64 %alu_61, 1
  %cmp_lt_71.not = icmp samesign ugt i64 %alu_5, %alu_61
  %alu_75 = shl nuw i64 %alu_64, 32
  %alu_80 = or disjoint i64 %alu_75, %alu_5
  %alu_85 = sub nsw i64 %alu_1, %alu_64
  %alu_91 = sub i64 %arg_v0, %alu_64
  %alu_92 = and i64 %alu_91, 4294967295
  %alu_86 = shl i64 %alu_85, 32
  %alu_101 = or disjoint i64 %alu_86, %alu_92
  %sel_106 = select i1 %cmp_lt_71.not, i64 %alu_101, i64 %alu_80
  %sel_111 = select i1 %cmp_le_9, i64 %arg_v0, i64 %sel_106
  ret i64 %sel_111
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden zeroext range(i8 0, 2) i8 @llb_miniscript_check_postfix(ptr noundef readonly captures(none) %arg_v0, i32 noundef %arg_v1, i8 noundef zeroext %arg_v2, i8 noundef zeroext %arg_v3, ptr noundef captures(none) %arg_v4) local_unnamed_addr #0 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  %arg_ext_v3 = zext i8 %arg_v3 to i64
  %0 = add i32 %arg_v1, -513
  %alu_2220 = icmp ult i32 %0, -512
  br i1 %alu_2220, label %common.ret, label %loop_hdr_44.preheader

loop_hdr_44.preheader:                            ; preds = %entry
  %cmp_eq_2546.i.i = icmp eq i8 %arg_v2, 0
  br label %loop_hdr_44

common.ret:                                       ; preds = %loop_exit_47, %entry, %ite_else_147
  %common.ret.op = phi i8 [ %ret_tr_354, %ite_else_147 ], [ 0, %entry ], [ 0, %loop_exit_47 ]
  ret i8 %common.ret.op

loop_hdr_44:                                      ; preds = %loop_hdr_44.preheader, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit
  %slot_v1869.0 = phi i64 [ %common.ret.op.i, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit ], [ 0, %loop_hdr_44.preheader ]
  %loop_idx_48 = phi i64 [ %loop_next_49, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit ], [ 0, %loop_hdr_44.preheader ]
  %loop_cmp_50 = icmp samesign ult i64 %loop_idx_48, %arg_ext_v1
  br i1 %loop_cmp_50, label %loop_body_45, label %loop_exit_47

loop_body_45:                                     ; preds = %loop_hdr_44
  %cmp_eq_7.i = icmp sgt i64 %slot_v1869.0, -1
  br i1 %cmp_eq_7.i, label %ite_then_9.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_9.i:                                     ; preds = %loop_body_45
  %call_tr_58 = trunc nuw i64 %loop_idx_48 to i32
  %rld_gep_14.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %call_tr_58
  %rld_i8_15.i = load i8, ptr %rld_gep_14.i, align 1
  %rld_val_16.i = zext i8 %rld_i8_15.i to i64
  %1 = and i64 %slot_v1869.0, 70931694131085312
  %cmp_eq_34.i = icmp eq i64 %1, 0
  br i1 %cmp_eq_34.i, label %ite_then_36.i, label %ite_else_37.i

ite_then_36.i:                                    ; preds = %ite_then_9.i
  switch i8 %rld_i8_15.i, label %ite_else_1424.i [
    i8 0, label %ite_then_46.i
    i8 1, label %ite_then_322.i
    i8 2, label %ite_then_598.i
    i8 3, label %ite_then_873.i
    i8 4, label %ite_then_1148.i
    i8 5, label %ite_then_1423.i
  ]

default.unreachable.i:                            ; preds = %ite_else_5813.i
  unreachable

ite_then_46.i:                                    ; preds = %ite_then_36.i
  %call_313.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -31004)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_322.i:                                   ; preds = %ite_then_36.i
  %call_589.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -31420)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_598.i:                                   ; preds = %ite_then_36.i
  %call_864.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -30982)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_873.i:                                   ; preds = %ite_then_36.i
  %call_1139.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -30990)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_1148.i:                                  ; preds = %ite_then_36.i
  %call_1414.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -30984)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_1423.i:                                  ; preds = %ite_then_36.i
  %call_1689.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -30992)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_1424.i:                                  ; preds = %ite_then_36.i
  %2 = and i8 %rld_i8_15.i, -4
  %alu_1713894.i = icmp eq i8 %2, 8
  br i1 %alu_1713894.i, label %ite_then_1723.i, label %ite_else_1724.i

ite_then_1723.i:                                  ; preds = %ite_else_1424.i
  %call_1990.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %slot_v1869.0, i16 zeroext -31624)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_1724.i:                                  ; preds = %ite_else_1424.i
  switch i8 %rld_i8_15.i, label %ite_else_2108.i [
    i8 40, label %ite_then_2107.i
    i8 13, label %ite_then_2107.i
    i8 12, label %ite_then_2107.i
    i8 7, label %ite_then_2107.i
    i8 6, label %ite_then_2107.i
  ]

ite_then_2107.i:                                  ; preds = %ite_else_1724.i, %ite_else_1724.i, %ite_else_1724.i, %ite_else_1724.i, %ite_else_1724.i
  %alu_2112.i = and i64 %slot_v1869.0, 9151314442816847872
  %alu_2117.i = shl nuw nsw i64 %rld_val_16.i, 50
  %alu_2121.i = add nuw nsw i64 %alu_2117.i, %alu_2112.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_2108.i:                                  ; preds = %ite_else_1724.i
  %3 = add i8 %rld_i8_15.i, -16
  %alu_2146901.i = icmp ult i8 %3, 10
  br i1 %alu_2146901.i, label %ite_then_2156.i, label %ite_else_2157.i

ite_then_2156.i:                                  ; preds = %ite_else_2108.i
  %cmp_lt_2169.i = icmp samesign ult i64 %slot_v1869.0, 72057594037927936
  br i1 %cmp_lt_2169.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_2173.i

ite_else_2173.i:                                  ; preds = %ite_then_2156.i
  %sh.diff.i = lshr i64 %slot_v1869.0, 55
  %tr.sh.diff.i = trunc nuw nsw i64 %sh.diff.i to i32
  %4 = getelementptr i8, ptr %arg_v4, i32 %tr.sh.diff.i
  %rld_gep_10.i.i = getelementptr i8, ptr %4, i32 -2
  %rld_i8_11.i.i = load i8, ptr %rld_gep_10.i.i, align 1
  %rld_val_12.i.i = zext i8 %rld_i8_11.i.i to i16
  %rld_gep_21.i.i = getelementptr i8, ptr %4, i32 -1
  %rld_i8_22.i.i = load i8, ptr %rld_gep_21.i.i, align 1
  %rld_val_23.i.i = zext i8 %rld_i8_22.i.i to i16
  %alu_33.i.i = shl nuw i16 %rld_val_23.i.i, 8
  %alu_40.i.i = or disjoint i16 %alu_33.i.i, %rld_val_12.i.i
  %call_zx_2196.i = zext i16 %alu_40.i.i to i64
  %alu_2201.i = and i64 %call_zx_2196.i, 3
  %5 = and i64 %call_zx_2196.i, 128
  %6 = and i64 %call_zx_2196.i, 256
  %7 = and i64 %call_zx_2196.i, 1024
  %8 = and i64 %call_zx_2196.i, 2048
  %9 = and i64 %call_zx_2196.i, 4096
  %cmp_eq_2488.not.not.i = icmp eq i64 %alu_2201.i, 0
  switch i8 %rld_i8_15.i, label %ite_else_5094.i [
    i8 16, label %ite_then_2508.i
    i8 17, label %ite_then_2824.i
    i8 18, label %ite_then_3159.i
    i8 19, label %ite_then_3475.i
    i8 20, label %ite_then_3791.i
    i8 21, label %ite_then_4442.i
    i8 22, label %ite_then_4758.i
    i8 23, label %ite_then_5093.i
  ]

ite_then_2508.i:                                  ; preds = %ite_else_2173.i
  %alu_2730.i = and i64 %call_zx_2196.i, 32736
  %call_2195.lobit1192.i = and i16 %alu_33.i.i, -32768
  %alu_2759.i = zext i16 %call_2195.lobit1192.i to i64
  %alu_2748.i = or disjoint i64 %alu_2730.i, %alu_2759.i
  %alu_2778.i = select i1 %cmp_eq_2488.not.not.i, i64 65532, i64 0
  %alu_2783.i = xor i64 %alu_2748.i, 65532
  %alu_2789.i = and i64 %alu_2778.i, %alu_2783.i
  %cmp_eq_2804.i = icmp eq i64 %alu_2789.i, 0
  br i1 %cmp_eq_2804.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_2808.i

ite_else_2808.i:                                  ; preds = %ite_then_2508.i
  %10 = trunc nuw i64 %alu_2789.i to i16
  %call_tr_2814.i = xor i16 %10, -1
  %rst_tr8_14.i.i.i = trunc i16 %call_tr_2814.i to i8
  store i8 %rst_tr8_14.i.i.i, ptr %rld_gep_10.i.i, align 1
  %11 = lshr i16 %call_tr_2814.i, 8
  %rst_tr8_34.i.i.i = trunc nuw i16 %11 to i8
  store i8 %rst_tr8_34.i.i.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_2824.i:                                  ; preds = %ite_else_2173.i
  %12 = and i64 %call_zx_2196.i, 11
  %cmp_eq_2844.not.not.i = icmp eq i64 %12, 8
  %alu_3065.i = and i64 %call_zx_2196.i, 32736
  %call_2195.lobit1181.i = and i16 %alu_33.i.i, -32768
  %alu_3094.i = zext i16 %call_2195.lobit1181.i to i64
  %alu_3083.i = or disjoint i64 %alu_3065.i, %alu_3094.i
  %alu_3113.i = select i1 %cmp_eq_2844.not.not.i, i64 65532, i64 0
  %alu_3118.i = xor i64 %alu_3083.i, 65532
  %alu_3124.i = and i64 %alu_3113.i, %alu_3118.i
  %cmp_eq_3139.i = icmp eq i64 %alu_3124.i, 0
  br i1 %cmp_eq_3139.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3143.i

ite_else_3143.i:                                  ; preds = %ite_then_2824.i
  %13 = trunc nuw i64 %alu_3124.i to i16
  %call_tr_3149.i = xor i16 %13, -1
  %rst_tr8_14.i.i1197.i = trunc i16 %call_tr_3149.i to i8
  store i8 %rst_tr8_14.i.i1197.i, ptr %rld_gep_10.i.i, align 1
  %14 = lshr i16 %call_tr_3149.i, 8
  %rst_tr8_34.i.i1199.i = trunc nuw i16 %14 to i8
  store i8 %rst_tr8_34.i.i1199.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_3159.i:                                  ; preds = %ite_else_2173.i
  %cmp_eq_2500.i = icmp eq i64 %alu_2201.i, 2
  %alu_3381.i = and i64 %call_zx_2196.i, 32568
  %call_2195.lobit1168.i = and i16 %alu_33.i.i, -32768
  %alu_3410.i = zext i16 %call_2195.lobit1168.i to i64
  %alu_3399.i = or disjoint i64 %alu_3381.i, %alu_3410.i
  %alu_3429.i = select i1 %cmp_eq_2500.i, i64 65343, i64 0
  %alu_3434.i = xor i64 %alu_3399.i, 65343
  %alu_3440.i = and i64 %alu_3429.i, %alu_3434.i
  %cmp_eq_3455.i = icmp eq i64 %alu_3440.i, 0
  br i1 %cmp_eq_3455.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3459.i

ite_else_3459.i:                                  ; preds = %ite_then_3159.i
  %15 = trunc nuw i64 %alu_3440.i to i16
  %call_tr_3465.i = xor i16 %15, -1
  %rst_tr8_14.i.i1204.i = trunc i16 %call_tr_3465.i to i8
  store i8 %rst_tr8_14.i.i1204.i, ptr %rld_gep_10.i.i, align 1
  %16 = lshr i16 %call_tr_3465.i, 8
  %rst_tr8_34.i.i1206.i = trunc nuw i16 %16 to i8
  store i8 %rst_tr8_34.i.i1206.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_3475.i:                                  ; preds = %ite_else_2173.i
  %cmp_eq_2494.not.i = icmp eq i64 %alu_2201.i, 1
  %alu_3697.i = and i64 %call_zx_2196.i, 31900
  %call_2195.lobit1157.i = and i16 %alu_33.i.i, -32768
  %alu_3726.i = zext i16 %call_2195.lobit1157.i to i64
  %alu_3715.i = or disjoint i64 %alu_3697.i, %alu_3726.i
  %alu_3745.i = select i1 %cmp_eq_2494.not.i, i64 65215, i64 0
  %alu_3750.i = xor i64 %alu_3715.i, 65215
  %alu_3756.i = and i64 %alu_3745.i, %alu_3750.i
  %cmp_eq_3771.i = icmp eq i64 %alu_3756.i, 0
  br i1 %cmp_eq_3771.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3775.i

ite_else_3775.i:                                  ; preds = %ite_then_3475.i
  %17 = trunc nuw i64 %alu_3756.i to i16
  %call_tr_3781.i = xor i16 %17, -1
  %rst_tr8_14.i.i1211.i = trunc i16 %call_tr_3781.i to i8
  store i8 %rst_tr8_14.i.i1211.i, ptr %rld_gep_10.i.i, align 1
  %18 = lshr i16 %call_tr_3781.i, 8
  %rst_tr8_34.i.i1213.i = trunc nuw i16 %18 to i8
  store i8 %rst_tr8_34.i.i1213.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_3791.i:                                  ; preds = %ite_else_2173.i
  %19 = and i64 %call_zx_2196.i, 7
  %cmp_eq_3811.not.not.i = icmp eq i64 %19, 5
  %alu_3963.i = shl nuw nsw i64 %6, 1
  %call_2195.lobit1144.i = and i16 %alu_33.i.i, -32768
  %alu_4071.i = zext i16 %call_2195.lobit1144.i to i64
  %20 = or disjoint i64 %alu_3963.i, %alu_4071.i
  %alu_4090.i = select i1 %cmp_eq_3811.not.not.i, i64 65535, i64 0
  %.masked1145.i = and i64 %call_zx_2196.i, 24576
  %21 = or disjoint i64 %20, %.masked1145.i
  %22 = or disjoint i64 %21, %5
  %23 = or disjoint i64 %22, %7
  %24 = or disjoint i64 %23, %8
  %25 = or i64 %24, %9
  br i1 %cmp_eq_2546.i.i, label %ite_then_3820.i, label %ite_else_3821.i

ite_then_3820.i:                                  ; preds = %ite_then_3791.i
  %alu_4095.i = xor i64 %25, 65479
  %alu_4101.i = and i64 %alu_4095.i, %alu_4090.i
  %cmp_eq_4116.i = icmp eq i64 %alu_4101.i, 0
  br i1 %cmp_eq_4116.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_4120.i

ite_else_4120.i:                                  ; preds = %ite_then_3820.i
  %26 = trunc nuw i64 %alu_4101.i to i16
  %call_tr_4126.i = xor i16 %26, -1
  %rst_tr8_14.i.i1218.i = trunc i16 %call_tr_4126.i to i8
  store i8 %rst_tr8_14.i.i1218.i, ptr %rld_gep_10.i.i, align 1
  %27 = lshr i16 %call_tr_4126.i, 8
  %rst_tr8_34.i.i1220.i = trunc nuw i16 %27 to i8
  store i8 %rst_tr8_34.i.i1220.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_3821.i:                                  ; preds = %ite_then_3791.i
  %alu_4401.i = xor i64 %25, 65415
  %alu_4407.i = and i64 %alu_4401.i, %alu_4090.i
  %cmp_eq_4422.i = icmp eq i64 %alu_4407.i, 0
  br i1 %cmp_eq_4422.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_4426.i

ite_else_4426.i:                                  ; preds = %ite_else_3821.i
  %28 = trunc nuw i64 %alu_4407.i to i16
  %call_tr_4432.i = xor i16 %28, -1
  %rst_tr8_14.i.i1225.i = trunc i16 %call_tr_4432.i to i8
  store i8 %rst_tr8_14.i.i1225.i, ptr %rld_gep_10.i.i, align 1
  %29 = lshr i16 %call_tr_4432.i, 8
  %rst_tr8_34.i.i1227.i = trunc nuw i16 %29 to i8
  store i8 %rst_tr8_34.i.i1227.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_4442.i:                                  ; preds = %ite_else_2173.i
  %alu_4664.i = and i64 %call_zx_2196.i, 31900
  %call_2195.lobit1123.i = and i16 %alu_33.i.i, -32768
  %alu_4693.i = zext i16 %call_2195.lobit1123.i to i64
  %alu_4682.i = or disjoint i64 %alu_4664.i, %alu_4693.i
  %alu_4712.i = select i1 %cmp_eq_2488.not.not.i, i64 65278, i64 0
  %alu_4717.i = xor i64 %alu_4682.i, 65278
  %alu_4723.i = and i64 %alu_4712.i, %alu_4717.i
  %cmp_eq_4738.i = icmp eq i64 %alu_4723.i, 0
  br i1 %cmp_eq_4738.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_4742.i

ite_else_4742.i:                                  ; preds = %ite_then_4442.i
  %30 = trunc nuw i64 %alu_4723.i to i16
  %call_tr_4748.i = xor i16 %30, -1
  %rst_tr8_14.i.i1232.i = trunc i16 %call_tr_4748.i to i8
  store i8 %rst_tr8_14.i.i1232.i, ptr %rld_gep_10.i.i, align 1
  %31 = lshr i16 %call_tr_4748.i, 8
  %rst_tr8_34.i.i1234.i = trunc nuw i16 %31 to i8
  store i8 %rst_tr8_34.i.i1234.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_4758.i:                                  ; preds = %ite_else_2173.i
  %32 = and i64 %call_zx_2196.i, 19
  %cmp_eq_4778.not.not.i = icmp eq i64 %32, 16
  %alu_4873.i = and i64 %call_zx_2196.i, 200
  %alu_4920.i = shl nuw nsw i64 %6, 1
  %alu_4891.i = or disjoint i64 %alu_4920.i, %alu_4873.i
  %call_2195.lobit1110.i = and i16 %alu_33.i.i, -32768
  %alu_5028.i = zext i16 %call_2195.lobit1110.i to i64
  %33 = or disjoint i64 %alu_4891.i, %alu_5028.i
  %alu_5047.i = select i1 %cmp_eq_4778.not.not.i, i64 65535, i64 0
  %.masked1111.i = and i64 %call_zx_2196.i, 24576
  %34 = or disjoint i64 %33, %.masked1111.i
  %35 = or disjoint i64 %34, %7
  %36 = or disjoint i64 %35, %8
  %37 = or i64 %36, %9
  %alu_5052.i = xor i64 %37, 65487
  %alu_5058.i = and i64 %alu_5052.i, %alu_5047.i
  %cmp_eq_5073.i = icmp eq i64 %alu_5058.i, 0
  br i1 %cmp_eq_5073.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_5077.i

ite_else_5077.i:                                  ; preds = %ite_then_4758.i
  %38 = trunc nuw i64 %alu_5058.i to i16
  %call_tr_5083.i = xor i16 %38, -1
  %rst_tr8_14.i.i1239.i = trunc i16 %call_tr_5083.i to i8
  store i8 %rst_tr8_14.i.i1239.i, ptr %rld_gep_10.i.i, align 1
  %39 = lshr i16 %call_tr_5083.i, 8
  %rst_tr8_34.i.i1241.i = trunc nuw i16 %39 to i8
  store i8 %rst_tr8_34.i.i1241.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_5093.i:                                  ; preds = %ite_else_2173.i
  %alu_5315.i = and i64 %call_zx_2196.i, 32700
  %call_2195.lobit1098.i = and i16 %alu_33.i.i, -32768
  %alu_5344.i = zext i16 %call_2195.lobit1098.i to i64
  %alu_5333.i = or disjoint i64 %alu_5315.i, %alu_5344.i
  %alu_5363.i = select i1 %cmp_eq_2488.not.not.i, i64 65471, i64 0
  %alu_5368.i = xor i64 %alu_5333.i, 65471
  %alu_5374.i = and i64 %alu_5363.i, %alu_5368.i
  %cmp_eq_5389.i = icmp eq i64 %alu_5374.i, 0
  br i1 %cmp_eq_5389.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_5393.i

ite_else_5393.i:                                  ; preds = %ite_then_5093.i
  %40 = trunc nuw i64 %alu_5374.i to i16
  %call_tr_5399.i = xor i16 %40, -1
  %rst_tr8_14.i.i1246.i = trunc i16 %call_tr_5399.i to i8
  store i8 %rst_tr8_14.i.i1246.i, ptr %rld_gep_10.i.i, align 1
  %41 = lshr i16 %call_tr_5399.i, 8
  %rst_tr8_34.i.i1248.i = trunc nuw i16 %41 to i8
  store i8 %rst_tr8_34.i.i1248.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_5094.i:                                  ; preds = %ite_else_2173.i
  %42 = shl nuw nsw i64 %call_zx_2196.i, 1
  %43 = and i64 %42, 520
  %call_2195.lobit.i = and i16 %alu_33.i.i, -32768
  %alu_5687.i = zext i16 %call_2195.lobit.i to i64
  %alu_5706.i = select i1 %cmp_eq_2488.not.not.i, i64 65535, i64 0
  %44 = and i64 %call_zx_2196.i, 24640
  %45 = or disjoint i64 %44, %alu_5687.i
  %46 = or disjoint i64 %45, %43
  %47 = or disjoint i64 %46, %5
  %48 = or disjoint i64 %47, %7
  %49 = or i64 %48, %8
  %50 = or i64 %49, %9
  %alu_5711.i = xor i64 %50, 65503
  %alu_5717.i = and i64 %alu_5711.i, %alu_5706.i
  %cmp_eq_5732.i = icmp eq i64 %alu_5717.i, 0
  br i1 %cmp_eq_5732.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_5736.i

ite_else_5736.i:                                  ; preds = %ite_else_5094.i
  %51 = trunc nuw i64 %alu_5717.i to i16
  %call_tr_5742.i = xor i16 %51, -1
  %rst_tr8_14.i.i1253.i = trunc i16 %call_tr_5742.i to i8
  store i8 %rst_tr8_14.i.i1253.i, ptr %rld_gep_10.i.i, align 1
  %52 = lshr i16 %call_tr_5742.i, 8
  %rst_tr8_34.i.i1255.i = trunc nuw i16 %52 to i8
  store i8 %rst_tr8_34.i.i1255.i, ptr %rld_gep_21.i.i, align 1
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_2157.i:                                  ; preds = %ite_else_2108.i
  %53 = add i8 %rld_i8_15.i, -32
  %alu_5786902.i = icmp ult i8 %53, 7
  br i1 %alu_5786902.i, label %ite_then_5796.i, label %ite_else_5797.i

ite_then_5796.i:                                  ; preds = %ite_else_2157.i
  %cmp_lt_5809.i = icmp samesign ult i64 %slot_v1869.0, 144115188075855872
  br i1 %cmp_lt_5809.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_5813.i

ite_else_5813.i:                                  ; preds = %ite_then_5796.i
  %alu_5801.i = lshr i64 %slot_v1869.0, 56
  %54 = trunc nuw nsw i64 %alu_5801.i to i32
  %call_tr_5834.i = shl nuw nsw i32 %54, 1
  %55 = getelementptr i8, ptr %arg_v4, i32 %call_tr_5834.i
  %rld_gep_10.i1257.i = getelementptr i8, ptr %55, i32 -4
  %rld_i8_11.i1258.i = load i8, ptr %rld_gep_10.i1257.i, align 1
  %rld_val_12.i1259.i = zext i8 %rld_i8_11.i1258.i to i16
  %rld_gep_21.i1260.i = getelementptr i8, ptr %55, i32 -3
  %rld_i8_22.i1261.i = load i8, ptr %rld_gep_21.i1260.i, align 1
  %rld_val_23.i1262.i = zext i8 %rld_i8_22.i1261.i to i16
  %alu_33.i1263.i = shl nuw i16 %rld_val_23.i1262.i, 8
  %alu_40.i1264.i = or disjoint i16 %alu_33.i1263.i, %rld_val_12.i1259.i
  %call_zx_5836.i = zext i16 %alu_40.i1264.i to i64
  %alu_5841.i = add nsw i64 %alu_5801.i, -1
  %call_tr_5845.i = trunc nuw nsw i64 %alu_5841.i to i32
  %alu_5.i1265.i = shl nuw nsw i32 %call_tr_5845.i, 1
  %rld_gep_10.i1266.i = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %alu_5.i1265.i
  %rld_i8_11.i1267.i = load i8, ptr %rld_gep_10.i1266.i, align 1
  %rld_val_12.i1268.i = zext i8 %rld_i8_11.i1267.i to i16
  %rld_gep_21.i1269.i = getelementptr inbounds nuw i8, ptr %rld_gep_10.i1266.i, i32 1
  %rld_i8_22.i1270.i = load i8, ptr %rld_gep_21.i1269.i, align 1
  %rld_val_23.i1271.i = zext i8 %rld_i8_22.i1270.i to i16
  %alu_33.i1272.i = shl nuw i16 %rld_val_23.i1271.i, 8
  %alu_40.i1273.i = or disjoint i16 %alu_33.i1272.i, %rld_val_12.i1268.i
  %call_zx_5847.i = zext i16 %alu_40.i1273.i to i64
  %alu_5852.i = and i64 %call_zx_5836.i, 3
  %alu_5858.i = and i64 %call_zx_5847.i, 3
  %56 = and i64 %call_zx_5847.i, 32
  %57 = and i64 %call_zx_5847.i, 64
  %58 = and i64 %call_zx_5836.i, 256
  %59 = and i64 %call_zx_5847.i, 256
  %call_5835.lobit977.i = and i16 %alu_33.i1272.i, %alu_33.i1263.i
  %60 = lshr i64 %call_zx_5836.i, 11
  %61 = lshr i64 %call_zx_5847.i, 12
  %alu_6329.i = and i64 %61, %60
  %62 = lshr i64 %call_zx_5836.i, 12
  %63 = lshr i64 %call_zx_5847.i, 11
  %alu_6388.i = and i64 %63, %62
  %64 = lshr i64 %call_zx_5836.i, 13
  %65 = lshr i64 %call_zx_5847.i, 14
  %alu_6468.i = and i64 %65, %64
  %66 = lshr i64 %call_zx_5836.i, 14
  %67 = lshr i64 %call_zx_5847.i, 13
  %alu_6527.i = and i64 %67, %66
  %alu_6546.i = or i64 %alu_6329.i, %alu_6388.i
  %alu_6407.i = or i64 %alu_6546.i, %alu_6527.i
  %alu_6567.i = or i64 %alu_6407.i, %alu_6468.i
  %call_5835.lobit977.lobit.i = lshr i16 %call_5835.lobit977.i, 15
  %sel_6591.i = zext nneg i16 %call_5835.lobit977.lobit.i to i64
  %sel_6594.i = xor i64 %alu_6567.i, -1
  %alu_6599.i = and i64 %sel_6594.i, %sel_6591.i
  %.lobit978986.i = or i64 %63, %60
  %alu_6658.i = and i64 %.lobit978986.i, 1
  %.lobit980987.i = or i64 %61, %62
  %alu_6719.i = and i64 %.lobit980987.i, 1
  %.lobit982988.i = or i64 %67, %64
  %alu_6780.i = and i64 %.lobit982988.i, 1
  %.lobit984989.i = or i64 %65, %66
  %alu_6841.i = and i64 %.lobit984989.i, 1
  %68 = lshr i64 %call_zx_5836.i, 2
  %69 = lshr i64 %call_zx_5847.i, 2
  %.lobit991.i = and i64 %69, 1
  %alu_6862.i = and i64 %.lobit991.i, %68
  %70 = lshr i64 %call_zx_5847.i, 3
  %.lobit992.i = and i64 %68, 1
  %alu_6881.i = and i64 %70, %.lobit992.i
  %71 = lshr i64 %call_zx_5836.i, 3
  %alu_6900.i = and i64 %.lobit991.i, %71
  %alu_6919.i = or i64 %alu_6900.i, %alu_6881.i
  %72 = lshr i64 %call_zx_5847.i, 4
  %alu_6940.i = and i64 %72, %.lobit992.i
  %73 = lshr i64 %call_zx_5836.i, 4
  %.lobit995.i = and i64 %73, 1
  %alu_6959.i = or i64 %alu_6940.i, %.lobit995.i
  %74 = lshr i64 %call_zx_5836.i, 7
  %.lobit996.i = and i64 %74, 1
  %75 = lshr i64 %call_zx_5847.i, 7
  %.lobit997.i = and i64 %75, 1
  %alu_6980.i = or i64 %.lobit997.i, %.lobit996.i
  %alu_7001.i = and i64 %.lobit997.i, %74
  %76 = and i64 %call_zx_5847.i, %call_zx_5836.i
  %77 = and i64 %76, 1024
  %cmp_eq_7034.i = icmp eq i64 %alu_5852.i, 0
  %78 = lshr i64 %call_zx_5836.i, 5
  %79 = lshr i64 %call_zx_5836.i, 6
  %sel_7056.i = zext i1 %cmp_eq_7034.i to i64
  %80 = and i64 %79, %sel_7056.i
  %alu_7064.i = and i64 %80, %78
  switch i8 %rld_i8_15.i, label %default.unreachable.i [
    i8 32, label %ite_then_7080.i
    i8 33, label %ite_then_7824.i
    i8 34, label %ite_then_8334.i
    i8 35, label %ite_then_8728.i
    i8 36, label %ite_then_9177.i
    i8 37, label %ite_then_9569.i
    i8 38, label %ite_then_9961.i
  ]

ite_then_7080.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_7094.i = icmp eq i64 %alu_5858.i, 3
  br i1 %cmp_eq_7094.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_7097.i

ite_else_7097.i:                                  ; preds = %ite_then_7080.i
  %cmp_eq_7088.i = icmp eq i64 %alu_5852.i, 1
  %alu_7512.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_7530.i = shl nuw nsw i64 %alu_6919.i, 3
  %81 = or disjoint i64 %alu_7530.i, %alu_7512.i
  %alu_7548.i = shl nuw nsw i64 %alu_6959.i, 4
  %82 = or disjoint i64 %81, %alu_7548.i
  %alu_7602.i = shl nuw nsw i64 %alu_6980.i, 7
  %83 = or disjoint i64 %82, %alu_7602.i
  %alu_74871069.i = shl nuw nsw i64 %.lobit996.i, 8
  %alu_7674.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_7692.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_7710.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_7728.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_7746.i = shl nuw nsw i64 %alu_6599.i, 15
  %84 = and i64 %call_zx_5847.i, 67
  %85 = or disjoint i64 %alu_74871069.i, %84
  %86 = or disjoint i64 %alu_7674.i, %85
  %87 = or disjoint i64 %alu_7710.i, %alu_7692.i
  %88 = or disjoint i64 %87, %alu_7728.i
  %89 = or disjoint i64 %alu_7746.i, %88
  %90 = or i64 %86, %83
  %91 = or i64 %90, %89
  %92 = or i64 %91, %59
  %alu_7753.i = or i64 %92, %77
  %alu_7765.i = select i1 %cmp_eq_7088.i, i64 65535, i64 0
  %alu_7770.i = xor i64 %alu_7753.i, -1
  %alu_7776.i = and i64 %alu_7765.i, %alu_7770.i
  %cmp_eq_7791.i = icmp eq i64 %alu_7776.i, 0
  br i1 %cmp_eq_7791.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_7795.i

ite_else_7795.i:                                  ; preds = %ite_else_7097.i
  %93 = trunc nuw i64 %alu_7776.i to i16
  %call_tr_7802.i = xor i16 %93, -1
  %rst_tr8_14.i.i = trunc i16 %call_tr_7802.i to i8
  store i8 %rst_tr8_14.i.i, ptr %rld_gep_10.i1257.i, align 1
  %94 = lshr i16 %call_tr_7802.i, 8
  %rst_tr8_34.i.i = trunc nuw i16 %94 to i8
  store i8 %rst_tr8_34.i.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_7805.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_7810.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_7814.i = or disjoint i64 %alu_7810.i, %alu_7805.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_7824.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_7832.i = icmp eq i64 %alu_5858.i, 3
  %alu_78431049.i = and i1 %cmp_eq_7034.i, %cmp_eq_7832.i
  %95 = and i64 %56, %call_zx_5836.i
  %.lobit1051.i = lshr exact i64 %58, 8
  %.lobit1052.i = lshr exact i64 %59, 8
  %alu_7900.i = and i64 %.lobit1051.i, %74
  %alu_79191053.i = or i64 %75, %.lobit1051.i
  %96 = and i64 %alu_79191053.i, %.lobit1052.i
  %alu_7959.i = or i64 %96, %alu_7900.i
  %alu_8022.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_8040.i = shl nuw nsw i64 %alu_6919.i, 3
  %alu_8047.i = or disjoint i64 %alu_8040.i, %alu_8022.i
  %alu_8058.i = shl nuw nsw i64 %alu_6959.i, 4
  %alu_8065.i = or disjoint i64 %alu_8047.i, %alu_8058.i
  %alu_8112.i = shl nuw nsw i64 %alu_6980.i, 7
  %alu_8130.i = shl nuw nsw i64 %alu_7959.i, 8
  %alu_79991058.i = shl nuw nsw i64 %alu_7001.i, 9
  %97 = and i64 %alu_79991058.i, %call_zx_5836.i
  %.lobit10541056.lobit1059.i = and i64 %97, %call_zx_5847.i
  %alu_8184.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_8202.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_8220.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_8238.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_8256.i = shl nuw nsw i64 %alu_6599.i, 15
  %alu_8275.i = select i1 %alu_78431049.i, i64 65535, i64 0
  %alu_8083.masked.i = or disjoint i64 %alu_8065.i, %95
  %98 = or disjoint i64 %alu_8112.i, %alu_8184.i
  %99 = or disjoint i64 %98, %alu_8202.i
  %100 = or disjoint i64 %99, %alu_8220.i
  %.masked1065.i = or disjoint i64 %100, %77
  %.masked1064.i = or disjoint i64 %alu_8130.i, %alu_8238.i
  %.masked1063.i = or disjoint i64 %.masked1064.i, %.lobit10541056.lobit1059.i
  %.masked1062.i = or i64 %.masked1063.i, %alu_8256.i
  %.masked1061.i = or i64 %.masked1062.i, %alu_8083.masked.i
  %101 = or i64 %.masked1061.i, %.masked1065.i
  %alu_8280.i = xor i64 %101, 65471
  %alu_8286.i = and i64 %alu_8280.i, %alu_8275.i
  %cmp_eq_8301.i = icmp eq i64 %alu_8286.i, 0
  br i1 %cmp_eq_8301.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_8305.i

ite_else_8305.i:                                  ; preds = %ite_then_7824.i
  %102 = trunc nuw i64 %alu_8286.i to i16
  %call_tr_8312.i = xor i16 %102, -1
  %rst_tr8_14.i1277.i = trunc i16 %call_tr_8312.i to i8
  store i8 %rst_tr8_14.i1277.i, ptr %rld_gep_10.i1257.i, align 1
  %103 = lshr i16 %call_tr_8312.i, 8
  %rst_tr8_34.i1279.i = trunc nuw i16 %103 to i8
  store i8 %rst_tr8_34.i1279.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_8315.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_8320.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_8324.i = or disjoint i64 %alu_8320.i, %alu_8315.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_8334.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_8342.i = icmp eq i64 %alu_5858.i, 0
  %cmp_eq_8360.not1036.i = icmp ne i64 %alu_7064.i, 0
  %cmp_eq_8360.not.not.i = select i1 %cmp_eq_8342.i, i1 %cmp_eq_8360.not1036.i, i1 false
  %.lobit1037.i = lshr exact i64 %59, 8
  %alu_8372.i = or i64 %.lobit1037.i, %.lobit996.i
  %alu_8416.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_8434.i = shl nuw nsw i64 %alu_6900.i, 3
  %alu_8441.i = or disjoint i64 %alu_8416.i, %alu_8434.i
  %alu_8506.i = shl nuw nsw i64 %alu_6980.i, 7
  %104 = or disjoint i64 %alu_8441.i, %alu_8506.i
  %alu_8542.i = shl nuw nsw i64 %alu_8372.i, 9
  %105 = or disjoint i64 %104, %alu_8542.i
  %106 = shl nuw nsw i64 %call_zx_5836.i, 1
  %alu_83931041.i = and i64 %106, 1024
  %.lobit10381042.i = and i64 %alu_83931041.i, %76
  %alu_8578.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_8596.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_8614.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_8632.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_8650.i = shl nuw nsw i64 %alu_6599.i, 15
  %alu_8669.i = select i1 %cmp_eq_8360.not.not.i, i64 65535, i64 0
  %.masked1048.i = or disjoint i64 %105, %.lobit10381042.i
  %107 = or disjoint i64 %alu_8578.i, %alu_8596.i
  %108 = or disjoint i64 %107, %alu_8614.i
  %109 = or disjoint i64 %108, %alu_8632.i
  %110 = or disjoint i64 %109, %alu_8650.i
  %111 = or i64 %.masked1048.i, %110
  %112 = or i64 %111, %57
  %alu_8674.i = xor i64 %112, 65503
  %alu_8680.i = and i64 %alu_8674.i, %alu_8669.i
  %cmp_eq_8695.i = icmp eq i64 %alu_8680.i, 0
  br i1 %cmp_eq_8695.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_8699.i

ite_else_8699.i:                                  ; preds = %ite_then_8334.i
  %113 = trunc nuw i64 %alu_8680.i to i16
  %call_tr_8706.i = xor i16 %113, -1
  %rst_tr8_14.i1282.i = trunc i16 %call_tr_8706.i to i8
  store i8 %rst_tr8_14.i1282.i, ptr %rld_gep_10.i1257.i, align 1
  %114 = lshr i16 %call_tr_8706.i, 8
  %rst_tr8_34.i1284.i = trunc nuw i16 %114 to i8
  store i8 %rst_tr8_34.i1284.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_8709.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_8714.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_8718.i = or disjoint i64 %alu_8714.i, %alu_8709.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_8728.i:                                  ; preds = %ite_else_5813.i
  %alu_8741.i = and i64 %78, %sel_7056.i
  %115 = and i64 %call_zx_5847.i, 35
  %cmp_eq_8773.not.not.i = icmp eq i64 %115, 35
  %cmp_eq_8792.not1026.i = icmp ne i64 %alu_8741.i, 0
  %cmp_eq_8792.not.not.i = select i1 %cmp_eq_8773.not.not.i, i1 %cmp_eq_8792.not1026.i, i1 false
  %.lobit10271029.i = and i64 %76, 512
  %.lobit1030.i = lshr i64 %76, 10
  %.lobit10271029.lobit.i = lshr i64 %76, 9
  %alu_8823.i = and i64 %.lobit10271029.lobit.i, %.lobit1030.i
  %alu_8842.i = and i64 %alu_8823.i, %alu_6980.i
  %alu_8865.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_8883.i = shl nuw nsw i64 %alu_6919.i, 3
  %alu_8890.i = or disjoint i64 %alu_8883.i, %alu_8865.i
  %alu_8955.i = shl nuw nsw i64 %alu_7001.i, 7
  %alu_8944.i = or disjoint i64 %alu_8890.i, %alu_8955.i
  %alu_9009.i = shl nuw nsw i64 %alu_8842.i, 10
  %alu_9027.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_9045.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_9063.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_9081.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_9099.i = shl nuw nsw i64 %sel_6591.i, 15
  %alu_9118.i = select i1 %cmp_eq_8792.not.not.i, i64 65535, i64 0
  %.masked1035.i = or disjoint i64 %alu_8944.i, %alu_9009.i
  %116 = or disjoint i64 %alu_9027.i, %alu_9099.i
  %117 = or disjoint i64 %116, %alu_9045.i
  %118 = or disjoint i64 %117, %alu_9063.i
  %119 = or disjoint i64 %118, %alu_9081.i
  %120 = or i64 %.masked1035.i, %.lobit10271029.i
  %121 = or i64 %120, %119
  %alu_9123.i = xor i64 %121, 65439
  %alu_9129.i = and i64 %alu_9123.i, %alu_9118.i
  %cmp_eq_9144.i = icmp eq i64 %alu_9129.i, 0
  br i1 %cmp_eq_9144.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_9148.i

ite_else_9148.i:                                  ; preds = %ite_then_8728.i
  %122 = trunc nuw i64 %alu_9129.i to i16
  %call_tr_9155.i = xor i16 %122, -1
  %rst_tr8_14.i1287.i = trunc i16 %call_tr_9155.i to i8
  store i8 %rst_tr8_14.i1287.i, ptr %rld_gep_10.i1257.i, align 1
  %123 = lshr i16 %call_tr_9155.i, 8
  %rst_tr8_34.i1289.i = trunc nuw i16 %123 to i8
  store i8 %rst_tr8_34.i1289.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_9158.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_9163.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_9167.i = or disjoint i64 %alu_9163.i, %alu_9158.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_9177.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_9185.i = icmp eq i64 %alu_5858.i, 1
  %cmp_eq_9203.not1021.i = icmp ne i64 %alu_7064.i, 0
  %cmp_eq_9203.not.not.i = select i1 %cmp_eq_9185.i, i1 %cmp_eq_9203.not1021.i, i1 false
  %.lobit1022.i = lshr i64 %76, 10
  %.lobit1023.i = lshr i64 %call_zx_5836.i, 9
  %alu_9215.i = and i64 %.lobit1022.i, %.lobit1023.i
  %alu_9234.i = and i64 %alu_9215.i, %alu_6980.i
  %alu_9257.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_9275.i = shl nuw nsw i64 %alu_6900.i, 3
  %alu_9264.i = or disjoint i64 %alu_9257.i, %alu_9275.i
  %alu_9347.i = shl nuw nsw i64 %alu_7001.i, 7
  %alu_9282.i = or disjoint i64 %alu_9264.i, %alu_9347.i
  %alu_9401.i = shl nuw nsw i64 %alu_9234.i, 10
  %alu_9372.i = or disjoint i64 %alu_9282.i, %alu_9401.i
  %alu_9419.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_9437.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_9455.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_9473.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_9491.i = shl nuw nsw i64 %sel_6591.i, 15
  %alu_9510.i = select i1 %cmp_eq_9203.not.not.i, i64 65535, i64 0
  %alu_9408.masked.i = or disjoint i64 %alu_9372.i, %alu_9419.i
  %alu_9426.masked.i = or disjoint i64 %alu_9437.i, %alu_9491.i
  %alu_9444.masked.i = or disjoint i64 %alu_9426.masked.i, %alu_9455.i
  %alu_9462.masked.i = or disjoint i64 %alu_9444.masked.i, %alu_9473.i
  %124 = or i64 %alu_9408.masked.i, %alu_9462.masked.i
  %alu_9515.i = xor i64 %124, 65278
  %alu_9521.i = and i64 %alu_9515.i, %alu_9510.i
  %cmp_eq_9536.i = icmp eq i64 %alu_9521.i, 0
  br i1 %cmp_eq_9536.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_9540.i

ite_else_9540.i:                                  ; preds = %ite_then_9177.i
  %125 = trunc nuw i64 %alu_9521.i to i16
  %call_tr_9547.i = xor i16 %125, -1
  %rst_tr8_14.i1292.i = trunc i16 %call_tr_9547.i to i8
  store i8 %rst_tr8_14.i1292.i, ptr %rld_gep_10.i1257.i, align 1
  %126 = lshr i16 %call_tr_9547.i, 8
  %rst_tr8_34.i1294.i = trunc nuw i16 %126 to i8
  store i8 %rst_tr8_34.i1294.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_9550.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_9555.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_9559.i = or disjoint i64 %alu_9555.i, %alu_9550.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_9569.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_9577.i = icmp eq i64 %alu_5858.i, 0
  %cmp_eq_9595.not1014.i = icmp ne i64 %alu_7064.i, 0
  %cmp_eq_9595.not.not.i = select i1 %cmp_eq_9577.i, i1 %cmp_eq_9595.not1014.i, i1 false
  %.lobit1015.i = lshr i64 %76, 10
  %.lobit1016.i = lshr i64 %call_zx_5836.i, 9
  %alu_9607.i = and i64 %.lobit1015.i, %.lobit1016.i
  %alu_9626.i = and i64 %alu_9607.i, %alu_6980.i
  %alu_9649.i = shl nuw nsw i64 %alu_6862.i, 2
  %alu_9667.i = shl nuw nsw i64 %alu_6900.i, 3
  %alu_9674.i = or disjoint i64 %alu_9649.i, %alu_9667.i
  %alu_9739.i = shl nuw nsw i64 %alu_7001.i, 7
  %127 = or disjoint i64 %alu_9674.i, %alu_9739.i
  %alu_9793.i = shl nuw nsw i64 %alu_9626.i, 10
  %128 = or disjoint i64 %127, %alu_9793.i
  %alu_9811.i = shl nuw nsw i64 %alu_6658.i, 11
  %129 = or disjoint i64 %128, %alu_9811.i
  %alu_9829.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_9847.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_9865.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_9883.i = shl nuw nsw i64 %sel_6591.i, 15
  %130 = and i64 %call_zx_5847.i, 864
  %131 = or disjoint i64 %alu_9883.i, %130
  %132 = or disjoint i64 %alu_9829.i, %131
  %133 = or disjoint i64 %132, %alu_9847.i
  %134 = or disjoint i64 %133, %alu_9865.i
  %alu_9890.i = or i64 %134, %129
  %alu_9902.i = select i1 %cmp_eq_9595.not.not.i, i64 65535, i64 0
  %alu_9907.i = xor i64 %alu_9890.i, -1
  %alu_9913.i = and i64 %alu_9902.i, %alu_9907.i
  %cmp_eq_9928.i = icmp eq i64 %alu_9913.i, 0
  br i1 %cmp_eq_9928.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_9932.i

ite_else_9932.i:                                  ; preds = %ite_then_9569.i
  %135 = trunc nuw i64 %alu_9913.i to i16
  %call_tr_9939.i = xor i16 %135, -1
  %rst_tr8_14.i1297.i = trunc i16 %call_tr_9939.i to i8
  store i8 %rst_tr8_14.i1297.i, ptr %rld_gep_10.i1257.i, align 1
  %136 = lshr i16 %call_tr_9939.i, 8
  %rst_tr8_34.i1299.i = trunc nuw i16 %136 to i8
  store i8 %rst_tr8_34.i1299.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_9942.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_9947.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_9951.i = or disjoint i64 %alu_9947.i, %alu_9942.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_9961.i:                                  ; preds = %ite_else_5813.i
  %cmp_eq_9969.i = icmp eq i64 %alu_5852.i, 3
  br i1 %cmp_eq_9969.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_9972.i

ite_else_9972.i:                                  ; preds = %ite_then_9961.i
  %cmp_eq_10460.i = icmp eq i64 %alu_5852.i, %alu_5858.i
  %.lobit1004.i = lshr exact i64 %58, 8
  %.lobit1005.i = lshr exact i64 %59, 8
  %alu_10530.i = and i64 %.lobit1005.i, %.lobit1004.i
  %.lobit1006.i = lshr i64 %call_zx_5836.i, 9
  %alu_10549.i = and i64 %.lobit1005.i, %.lobit1006.i
  %.lobit1007.i = lshr i64 %call_zx_5847.i, 9
  %alu_10568.i = and i64 %.lobit1007.i, %.lobit1004.i
  %alu_10587.i = or i64 %alu_10549.i, %alu_10568.i
  %alu_10649.i = shl nuw nsw i64 %alu_6862.i, 3
  %137 = or disjoint i64 %57, 32
  %138 = and i64 %137, %call_zx_5836.i
  %139 = or disjoint i64 %alu_10649.i, %138
  %alu_10721.i = shl nuw nsw i64 %alu_7001.i, 7
  %140 = or disjoint i64 %139, %alu_10721.i
  %alu_10739.i = shl nuw nsw i64 %alu_10530.i, 8
  %141 = or disjoint i64 %140, %alu_10739.i
  %alu_10757.i = shl nuw nsw i64 %alu_10587.i, 9
  %142 = or disjoint i64 %141, %alu_10757.i
  %alu_106081012.i = shl nuw nsw i64 %alu_6980.i, 10
  %.lobit10081013.i = and i64 %alu_106081012.i, %76
  %alu_10793.i = shl nuw nsw i64 %alu_6658.i, 11
  %alu_10811.i = shl nuw nsw i64 %alu_6719.i, 12
  %alu_10829.i = shl nuw nsw i64 %alu_6780.i, 13
  %alu_10847.i = shl nuw nsw i64 %alu_6841.i, 14
  %alu_10865.i = shl nuw nsw i64 %sel_6591.i, 15
  %143 = or disjoint i64 %alu_10865.i, %alu_10793.i
  %144 = or disjoint i64 %143, %alu_10811.i
  %145 = or disjoint i64 %144, %alu_10829.i
  %146 = or disjoint i64 %145, %alu_5852.i
  %147 = or disjoint i64 %146, %56
  %148 = add nuw nsw i64 %147, %alu_10847.i
  %149 = or i64 %142, %.lobit10081013.i
  %alu_10872.i = or i64 %149, %148
  %alu_10884.i = select i1 %cmp_eq_10460.i, i64 65535, i64 0
  %alu_10889.i = xor i64 %alu_10872.i, -1
  %alu_10895.i = and i64 %alu_10884.i, %alu_10889.i
  %cmp_eq_10910.i = icmp eq i64 %alu_10895.i, 0
  br i1 %cmp_eq_10910.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_10914.i

ite_else_10914.i:                                 ; preds = %ite_else_9972.i
  %150 = trunc nuw i64 %alu_10895.i to i16
  %call_tr_10921.i = xor i16 %150, -1
  %rst_tr8_14.i1302.i = trunc i16 %call_tr_10921.i to i8
  store i8 %rst_tr8_14.i1302.i, ptr %rld_gep_10.i1257.i, align 1
  %151 = lshr i16 %call_tr_10921.i, 8
  %rst_tr8_34.i1304.i = trunc nuw i16 %151 to i8
  store i8 %rst_tr8_34.i1304.i, ptr %rld_gep_21.i1260.i, align 1
  %alu_10924.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_10929.i = shl nuw nsw i64 %alu_5841.i, 56
  %alu_10933.i = or disjoint i64 %alu_10929.i, %alu_10924.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_5797.i:                                  ; preds = %ite_else_2157.i
  %cmp_eq_10973.i = icmp eq i8 %rld_i8_15.i, 39
  br i1 %cmp_eq_10973.i, label %ite_then_10975.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_10975.i:                                 ; preds = %ite_else_5797.i
  %cmp_lt_10988.i = icmp samesign ult i64 %slot_v1869.0, 216172782113783808
  br i1 %cmp_lt_10988.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_10992.i

ite_else_10992.i:                                 ; preds = %ite_then_10975.i
  %alu_10980.i = lshr i64 %slot_v1869.0, 56
  %152 = trunc nuw nsw i64 %alu_10980.i to i32
  %call_tr_11013.i = shl nuw nsw i32 %152, 1
  %153 = getelementptr i8, ptr %arg_v4, i32 %call_tr_11013.i
  %rld_gep_10.i1306.i = getelementptr i8, ptr %153, i32 -6
  %rld_gep_21.i1309.i = getelementptr i8, ptr %153, i32 -5
  %alu_11020.i = add nsw i64 %alu_10980.i, -2
  %call_tr_11024.i = trunc nuw nsw i64 %alu_11020.i to i32
  %alu_5.i1314.i = shl nuw nsw i32 %call_tr_11024.i, 1
  %rld_gep_10.i1315.i = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %alu_5.i1314.i
  %rld_i8_11.i1316.i = load i8, ptr %rld_gep_10.i1315.i, align 1
  %rld_val_12.i1317.i = zext i8 %rld_i8_11.i1316.i to i16
  %rld_gep_21.i1318.i = getelementptr inbounds nuw i8, ptr %rld_gep_10.i1315.i, i32 1
  %rld_i8_22.i1319.i = load i8, ptr %rld_gep_21.i1318.i, align 1
  %rld_val_23.i1320.i = zext i8 %rld_i8_22.i1319.i to i16
  %alu_33.i1321.i = shl nuw i16 %rld_val_23.i1320.i, 8
  %alu_40.i1322.i = or disjoint i16 %alu_33.i1321.i, %rld_val_12.i1317.i
  %call_zx_11026.i = zext i16 %alu_40.i1322.i to i64
  %alu_11048.i = and i64 %call_zx_11026.i, 3
  %cmp_eq_11918.i = icmp eq i64 %alu_11048.i, 3
  br i1 %cmp_eq_11918.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_11921.i

ite_else_11921.i:                                 ; preds = %ite_else_10992.i
  %rld_gep_21.i1327.i = getelementptr i8, ptr %153, i32 -1
  %rld_i8_22.i1328.i = load i8, ptr %rld_gep_21.i1327.i, align 1
  %rld_val_23.i1329.i = zext i8 %rld_i8_22.i1328.i to i16
  %alu_33.i1330.i = shl nuw i16 %rld_val_23.i1329.i, 8
  %rld_gep_10.i1324.i = getelementptr i8, ptr %153, i32 -2
  %rld_i8_11.i1325.i = load i8, ptr %rld_gep_10.i1324.i, align 1
  %rld_val_12.i1326.i = zext i8 %rld_i8_11.i1325.i to i16
  %alu_40.i1331.i = or disjoint i16 %alu_33.i1330.i, %rld_val_12.i1326.i
  %rld_i8_22.i1310.i = load i8, ptr %rld_gep_21.i1309.i, align 1
  %rld_val_23.i1311.i = zext i8 %rld_i8_22.i1310.i to i16
  %alu_33.i1312.i = shl nuw i16 %rld_val_23.i1311.i, 8
  %rld_i8_11.i1307.i = load i8, ptr %rld_gep_10.i1306.i, align 1
  %rld_val_12.i1308.i = zext i8 %rld_i8_11.i1307.i to i16
  %alu_40.i1313.i = or disjoint i16 %alu_33.i1312.i, %rld_val_12.i1308.i
  %call_zx_11037.i = zext i16 %alu_40.i1331.i to i64
  %alu_11054.i = and i64 %call_zx_11037.i, 3
  %cmp_eq_11912.i = icmp eq i64 %alu_11048.i, %alu_11054.i
  %call_zx_11015.i = zext i16 %alu_40.i1313.i to i64
  %154 = and i64 %call_zx_11015.i, 99
  %cmp_eq_11905.not.not.i = icmp eq i64 %154, 96
  %155 = lshr i64 %call_zx_11015.i, 11
  %156 = lshr i64 %call_zx_11026.i, 12
  %alu_11584.i = and i64 %155, %156
  %157 = lshr i64 %call_zx_11015.i, 12
  %158 = lshr i64 %call_zx_11026.i, 11
  %alu_11643.i = and i64 %157, %158
  %159 = lshr i64 %call_zx_11015.i, 13
  %160 = lshr i64 %call_zx_11026.i, 14
  %alu_11723.i = and i64 %159, %160
  %161 = lshr i64 %call_zx_11015.i, 14
  %162 = lshr i64 %call_zx_11026.i, 13
  %alu_11782.i = and i64 %161, %162
  %alu_11801.i = or i64 %alu_11584.i, %alu_11643.i
  %alu_11662.i = or i64 %alu_11801.i, %alu_11782.i
  %alu_11822.i = or i64 %alu_11662.i, %alu_11723.i
  %sel_11849.i = xor i64 %alu_11822.i, -1
  %call_11025.lobit904.i = and i16 %alu_33.i1330.i, %alu_33.i1321.i
  %call_11014.lobit906.i = and i16 %call_11025.lobit904.i, %alu_33.i1312.i
  %call_11014.lobit906.lobit.i = lshr i16 %call_11014.lobit906.i, 15
  %sel_11846.i = zext nneg i16 %call_11014.lobit906.lobit.i to i64
  %alu_11854.i = and i64 %sel_11849.i, %sel_11846.i
  %alu_13088917.i = and i1 %cmp_eq_11912.i, %cmp_eq_11905.not.not.i
  %163 = lshr i64 %call_zx_11015.i, 7
  %164 = or i64 %call_zx_11015.i, %call_zx_11026.i
  %165 = and i64 %call_zx_11037.i, %call_zx_11026.i
  %166 = lshr i64 %call_zx_11015.i, 2
  %167 = lshr i64 %165, 2
  %.lobit925.i = and i64 %167, 1
  %alu_13147.i = and i64 %166, %.lobit925.i
  %168 = lshr i64 %165, 3
  %.lobit928.i = and i64 %168, 1
  %alu_13185.i = and i64 %.lobit928.i, %166
  %169 = lshr i64 %call_zx_11015.i, 3
  %alu_13204.i = and i64 %169, %.lobit925.i
  %alu_13223.i = or i64 %alu_13185.i, %alu_13204.i
  %170 = lshr i64 %call_zx_11037.i, 7
  %171 = lshr i64 %164, 7
  %.lobit933.i = and i64 %170, 1
  %alu_13283.i = and i64 %.lobit933.i, %171
  %172 = lshr i64 %call_zx_11026.i, 8
  %.lobit918935.i = or i64 %163, %172
  %.lobit933942.i = or i64 %171, %170
  %173 = lshr i64 %call_zx_11015.i, 9
  %alu_13419.i = and i64 %173, 1
  %alu_13440.i = and i64 %alu_13419.i, %.lobit933942.i
  %174 = or i64 %164, %call_zx_11037.i
  %alu_13890.i = shl nuw nsw i64 %alu_13147.i, 2
  %alu_13908.i = shl nuw nsw i64 %alu_13223.i, 3
  %175 = or disjoint i64 %alu_13908.i, %alu_13890.i
  %.lobit968.i = and i64 %call_zx_11037.i, 32
  %176 = or disjoint i64 %175, %.lobit968.i
  %.lobit969.i = and i64 %165, 64
  %177 = or disjoint i64 %176, %.lobit969.i
  %alu_13980.i = shl nuw nsw i64 %alu_13283.i, 7
  %178 = trunc i64 %.lobit918935.i to i1
  %179 = select i1 %178, i64 768, i64 0
  %180 = and i64 %179, %call_zx_11037.i
  %alu_13459972.i = shl nuw nsw i64 %alu_13440.i, 10
  %181 = and i64 %alu_13459972.i, %call_zx_11026.i
  %182 = and i64 %181, %call_zx_11037.i
  %183 = and i64 %182, %call_zx_11015.i
  %184 = and i64 %174, 30720
  %alu_14124.i = shl nuw nsw i64 %alu_11854.i, 15
  %185 = or disjoint i64 %alu_13980.i, %184
  %186 = or disjoint i64 %185, %180
  %187 = or disjoint i64 %alu_14124.i, %186
  %188 = or disjoint i64 %187, %alu_11048.i
  %189 = or i64 %183, %177
  %alu_14131.i = or i64 %189, %188
  %alu_14143.i = select i1 %alu_13088917.i, i64 65535, i64 0
  %alu_14148.i = xor i64 %alu_14131.i, -1
  %alu_14154.i = and i64 %alu_14143.i, %alu_14148.i
  %cmp_eq_14169.i = icmp eq i64 %alu_14154.i, 0
  br i1 %cmp_eq_14169.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_14173.i

ite_else_14173.i:                                 ; preds = %ite_else_11921.i
  %190 = trunc nuw i64 %alu_14154.i to i16
  %call_tr_14180.i = xor i16 %190, -1
  %rst_tr8_14.i1334.i = trunc i16 %call_tr_14180.i to i8
  store i8 %rst_tr8_14.i1334.i, ptr %rld_gep_10.i1306.i, align 1
  %191 = lshr i16 %call_tr_14180.i, 8
  %rst_tr8_34.i1336.i = trunc nuw i16 %191 to i8
  store i8 %rst_tr8_34.i1336.i, ptr %rld_gep_21.i1309.i, align 1
  %alu_14183.i = and i64 %slot_v1869.0, 1125899906842623
  %alu_14188.i = shl nuw nsw i64 %alu_11020.i, 56
  %alu_14192.i = or disjoint i64 %alu_14188.i, %alu_14183.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_37.i:                                    ; preds = %ite_then_9.i
  %alu_26.i = lshr i64 %slot_v1869.0, 47
  %alu_30.i = and i64 %alu_26.i, 7
  %alu_14203.i = and i64 %slot_v1869.0, 9222386874436288256
  %alu_14206.i = or disjoint i64 %alu_14203.i, %rld_val_16.i
  %alu_14209.i = and i64 %slot_v1869.0, 9222386874436223231
  %alu_14212.i = shl nuw nsw i64 %rld_val_16.i, 8
  %alu_14216.i = or disjoint i64 %alu_14212.i, %alu_14209.i
  %alu_14219.i = and i64 %slot_v1869.0, 9222386874419576831
  %alu_14222.i = shl nuw nsw i64 %rld_val_16.i, 16
  %alu_14226.i = or disjoint i64 %alu_14222.i, %alu_14219.i
  %alu_14229.i = and i64 %slot_v1869.0, 9222386870158098431
  %alu_14232.i = shl nuw nsw i64 %rld_val_16.i, 24
  %alu_14236.i = or disjoint i64 %alu_14232.i, %alu_14229.i
  %cmp_eq_14240.i = icmp eq i64 %alu_30.i, 0
  %cmp_eq_14244.i = icmp eq i64 %alu_30.i, 1
  %cmp_eq_14248.i = icmp eq i64 %alu_30.i, 2
  %alu_14263.i = select i1 %cmp_eq_14248.i, i64 %alu_14226.i, i64 %alu_14236.i
  %alu_14279.i = select i1 %cmp_eq_14244.i, i64 %alu_14216.i, i64 %alu_14263.i
  %alu_14295.i = select i1 %cmp_eq_14240.i, i64 %alu_14206.i, i64 %alu_14279.i
  %alu_14299.i = shl nuw nsw i64 %alu_30.i, 47
  %alu_14302.i = add nuw nsw i64 %alu_14299.i, 140737488355328
  %alu_14306.i = or i64 %alu_14295.i, %alu_14302.i
  %cmp_le_14314.i = icmp samesign ugt i64 %alu_30.i, 2
  br i1 %cmp_le_14314.i, label %ite_then_14316.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_then_14316.i:                                 ; preds = %ite_else_37.i
  %alu_2.i.i = lshr i64 %alu_14306.i, 50
  %alu_6.i.i = and i64 %alu_2.i.i, 63
  %alu_11.i.i = and i64 %alu_14236.i, 4294967295
  %alu_14.i.i = and i64 %slot_v1869.0, 65535
  %alu_19.i.i = lshr i64 %alu_11.i.i, 16
  %alu_28.i.i = and i64 %slot_v1869.0, 9151314442816847872
  %192 = and i64 %slot_v1869.0, 69805794224242688
  %alu_51257.not.i.i = icmp eq i64 %192, 6755399441055744
  br i1 %alu_51257.not.i.i, label %ite_then_63.i.i, label %ite_else_64.i.i

ite_then_63.i.i:                                  ; preds = %ite_then_14316.i
  %cmp_eq_34.i.i = icmp eq i64 %alu_6.i.i, 6
  %alu_72.i.i = and i64 %alu_14236.i, 4290707456
  %cmp_eq_79.i.i = icmp eq i64 %alu_72.i.i, 0
  %cmp_le_91.not.i.i = icmp ne i64 %alu_14.i.i, 0
  %alu_102275.i.i = and i1 %cmp_eq_79.i.i, %cmp_le_91.not.i.i
  %193 = add nsw i64 %alu_11.i.i, -1
  %alu_137276.i.i = icmp ult i64 %193, 2147483647
  %sel_149.i.i = zext i1 %alu_137276.i.i to i64
  %alu_158.i.i = select i1 %cmp_eq_34.i.i, i64 65535, i64 0
  %alu_163277.i.i = xor i1 %alu_102275.i.i, %alu_137276.i.i
  %194 = and i64 %alu_158.i.i, 1
  %alu_169.i.i = select i1 %alu_163277.i.i, i64 %194, i64 0
  %cmp_eq_183.i.i = icmp eq i64 %alu_169.i.i, %sel_149.i.i
  br i1 %cmp_eq_183.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_186.i.i

ite_else_186.i.i:                                 ; preds = %ite_then_63.i.i
  %alu_191.i.i = and i64 %slot_v1869.0, 4194304
  %cmp_eq_195.i.i = icmp eq i64 %alu_191.i.i, 0
  br i1 %cmp_eq_195.i.i, label %ite_then_197.i.i, label %ite_else_198.i.i

ite_then_197.i.i:                                 ; preds = %ite_else_186.i.i
  %cmp_le_206.i.i = icmp samesign ult i64 %alu_11.i.i, 500000000
  %cmp_eq_243279.i.i = icmp ne i64 %194, 0
  %cmp_eq_243.i.i = or i1 %cmp_le_206.i.i, %cmp_eq_243279.i.i
  %195 = trunc nuw i64 %alu_158.i.i to i16
  br i1 %cmp_eq_243.i.i, label %ite_then_245.i.i, label %ite_else_246.i.i

ite_then_245.i.i:                                 ; preds = %ite_then_197.i.i
  %196 = and i16 %195, 20480
  %call_tr_797.i.i = xor i16 %196, -15100
  %call_798.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext %call_tr_797.i.i)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_246.i.i:                                 ; preds = %ite_then_197.i.i
  %197 = and i16 %195, 10240
  %call_tr_1349.i.i = xor i16 %197, -23292
  %call_1350.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext %call_tr_1349.i.i)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_198.i.i:                                 ; preds = %ite_else_186.i.i
  %cmp_le_1358.i.i = icmp samesign ugt i64 %alu_11.i.i, 499999999
  %sel_1361.i.i = zext i1 %cmp_le_1358.i.i to i64
  %alu_1375.i.i = xor i64 %sel_1361.i.i, 1
  %alu_1381.i.i = and i64 %alu_158.i.i, %alu_1375.i.i
  %cmp_eq_1395.i.i = icmp eq i64 %alu_1381.i.i, %sel_1361.i.i
  %198 = trunc nuw i64 %alu_158.i.i to i16
  br i1 %cmp_eq_1395.i.i, label %ite_then_1397.i.i, label %ite_else_1398.i.i

ite_then_1397.i.i:                                ; preds = %ite_else_198.i.i
  %199 = and i16 %198, 20480
  %call_tr_1949.i.i = xor i16 %199, -15100
  %call_1950.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext %call_tr_1949.i.i)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_1398.i.i:                                ; preds = %ite_else_198.i.i
  %200 = and i16 %198, 10240
  %call_tr_2501.i.i = xor i16 %200, -23292
  %call_2502.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext %call_tr_2501.i.i)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_64.i.i:                                  ; preds = %ite_then_14316.i
  %cmp_eq_2509.i.i = icmp eq i64 %alu_6.i.i, 12
  %alu_2526258.not.i.i = icmp eq i64 %192, 13510798882111488
  %201 = add nsw i64 %alu_14.i.i, -1
  br i1 %alu_2526258.not.i.i, label %ite_then_2538.i.i, label %ite_else_2539.i.i

ite_then_2538.i.i:                                ; preds = %ite_else_64.i.i
  %alu_2613.i.i = select i1 %cmp_eq_2509.i.i, i64 20, i64 999
  br i1 %cmp_eq_2546.i.i, label %ite_then_2548.i.i, label %ite_else_2549.i.i

ite_then_2548.i.i:                                ; preds = %ite_then_2538.i.i
  %cmp_le_2652.not.i.i = icmp samesign ule i64 %alu_19.i.i, %alu_2613.i.i
  %202 = icmp ult i64 %201, %alu_19.i.i
  %203 = and i1 %202, %cmp_le_2652.not.i.i
  %alu_2682274.i.i = and i1 %cmp_eq_2509.i.i, %203
  br i1 %alu_2682274.i.i, label %ite_else_2703.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_2703.i.i:                                ; preds = %ite_then_2548.i.i
  %call_2969.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext -30992)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_2549.i.i:                                ; preds = %ite_then_2538.i.i
  %cmp_le_3072.not.i.i = icmp samesign ugt i64 %alu_19.i.i, %alu_2613.i.i
  %204 = icmp uge i64 %201, %alu_19.i.i
  %205 = or i1 %204, %cmp_le_3072.not.i.i
  %alu_3102270.not.i.i = or i1 %cmp_eq_2509.i.i, %205
  br i1 %alu_3102270.not.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3123.i.i

ite_else_3123.i.i:                                ; preds = %ite_else_2549.i.i
  %call_3389.i.i = tail call fastcc i64 @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msPush(ptr %arg_v4, i64 %alu_28.i.i, i16 zeroext -31008)
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

ite_else_2539.i.i:                                ; preds = %ite_else_64.i.i
  %alu_3393.i.i = lshr i64 %slot_v1869.0, 56
  %alu_3423259.i.i = icmp uge i64 %201, %alu_19.i.i
  %cmp_le_3437.not.i.i = icmp samesign ugt i64 %alu_19.i.i, %alu_3393.i.i
  %cmp_le_3443.i.i = icmp samesign ugt i64 %alu_11.i.i, 4259839
  %alu_3454260.not262.i.i = or i1 %cmp_le_3443.i.i, %cmp_le_3437.not.i.i
  %alu_3473261.not.i.i = or i1 %alu_3423259.i.i, %alu_3454260.not262.i.i
  br i1 %alu_3473261.not.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3494.i.i

ite_else_3494.i.i:                                ; preds = %ite_else_2539.i.i
  %alu_3501.i.i = sub nuw nsw i64 %alu_3393.i.i, %alu_19.i.i
  %call_tr_3518.i.i = trunc nuw nsw i64 %alu_3501.i.i to i32
  %206 = and i64 %slot_v1869.0, 65534
  %cmp_le_484.i.i.i = icmp ne i64 %206, 0
  br label %loop_hdr_3507.i.i

loop_hdr_3507.i.i:                                ; preds = %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i, %ite_else_3494.i.i
  %slot_v2721.0.i.i = phi i64 [ 0, %ite_else_3494.i.i ], [ %common.ret.op.i.i.i, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i ]
  %loop_idx_3511.i.i = phi i64 [ 0, %ite_else_3494.i.i ], [ %loop_next_3512.i.i, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i ]
  %loop_cmp_3513.i.i = icmp samesign ult i64 %loop_idx_3511.i.i, %alu_19.i.i
  br i1 %loop_cmp_3513.i.i, label %loop_body_3508.i.i, label %loop_exit_3510.i.i

loop_body_3508.i.i:                               ; preds = %loop_hdr_3507.i.i
  %cmp_eq_10.i.i.i = icmp samesign ult i64 %slot_v2721.0.i.i, 1099511627776
  br i1 %cmp_eq_10.i.i.i, label %ite_then_12.i.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i

ite_then_12.i.i.i:                                ; preds = %loop_body_3508.i.i
  %call_tr_3522.i.i = trunc nuw nsw i64 %loop_idx_3511.i.i to i32
  %alu_19.narrow.i.i.i = add i32 %call_tr_3522.i.i, %call_tr_3518.i.i
  %alu_5.i.i.i.i = shl i32 %alu_19.narrow.i.i.i, 1
  %rld_gep_10.i.i.i.i = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %alu_5.i.i.i.i
  %rld_i8_11.i.i.i.i = load i8, ptr %rld_gep_10.i.i.i.i, align 1
  %rld_val_12.i.i.i.i = zext i8 %rld_i8_11.i.i.i.i to i16
  %rld_gep_21.i.i.i.i = getelementptr inbounds nuw i8, ptr %rld_gep_10.i.i.i.i, i32 1
  %rld_i8_22.i.i.i.i = load i8, ptr %rld_gep_21.i.i.i.i, align 1
  %rld_val_23.i.i.i.i = zext i8 %rld_i8_22.i.i.i.i to i16
  %alu_33.i.i.i.i = shl nuw i16 %rld_val_23.i.i.i.i, 8
  %alu_40.i.i.i.i = or disjoint i16 %alu_33.i.i.i.i, %rld_val_12.i.i.i.i
  %call_zx_25.i.i.i = zext i16 %alu_40.i.i.i.i to i64
  %cmp_eq_46.i.i.i = icmp eq i32 %call_tr_3522.i.i, 0
  %alu_72.i.i.i = select i1 %cmp_eq_46.i.i.i, i64 0, i64 3
  %alu_79.i.i.i = and i64 %call_zx_25.i.i.i, 3
  %cmp_eq_86.i.i.i = icmp ne i64 %alu_79.i.i.i, %alu_72.i.i.i
  %207 = and i64 %call_zx_25.i.i.i, 96
  %208 = icmp ne i64 %207, 96
  %cmp_eq_163.not.not.not.i.i.i = or i1 %cmp_eq_86.i.i.i, %208
  br i1 %cmp_eq_163.not.not.not.i.i.i, label %ite_then_176.i.i.i, label %ite_else_177.i.i.i

ite_then_176.i.i.i:                               ; preds = %ite_then_12.i.i.i
  %alu_181.i.i.i = or disjoint i64 %slot_v2721.0.i.i, 1099511627776
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i

ite_else_177.i.i.i:                               ; preds = %ite_then_12.i.i.i
  %alu_186.i.i.i = and i64 %slot_v2721.0.i.i, 127
  %209 = lshr i64 %call_zx_25.i.i.i, 2
  %.lobit.i.i.i = and i64 %209, 1
  %alu_212.i.i.i = add nuw nsw i64 %.lobit.i.i.i, %alu_186.i.i.i
  %210 = lshr i64 %call_zx_25.i.i.i, 11
  %211 = lshr i64 %slot_v2721.0.i.i, 36
  %alu_495.i.i.i = and i64 %210, %211
  %212 = lshr i64 %call_zx_25.i.i.i, 12
  %213 = lshr i64 %slot_v2721.0.i.i, 35
  %alu_514.i.i.i = and i64 %212, %213
  %214 = lshr i64 %call_zx_25.i.i.i, 13
  %215 = lshr i64 %slot_v2721.0.i.i, 38
  %alu_554.i.i.i = and i64 %214, %215
  %216 = lshr i64 %call_zx_25.i.i.i, 14
  %217 = lshr i64 %slot_v2721.0.i.i, 37
  %alu_573.i.i.i = and i64 %216, %217
  %alu_592.i.i.i = or i64 %alu_495.i.i.i, %alu_514.i.i.i
  %alu_533.i.i.i = or i64 %alu_592.i.i.i, %alu_573.i.i.i
  %alu_613.i.i.i = or i64 %alu_533.i.i.i, %alu_554.i.i.i
  %218 = and i64 %alu_613.i.i.i, 1
  %cmp_eq_641.not88.i.i.i = icmp ne i64 %218, 0
  %cmp_eq_641.not.not.not94.not95.not98.not100.i.i.i = and i1 %cmp_le_484.i.i.i, %cmp_eq_641.not88.i.i.i
  %.lobit8089.i.i.i = or i64 %210, %213
  %.lobit8290.i.i.i = or i64 %212, %211
  %.lobit8491.i.i.i = or i64 %214, %217
  %.lobit8692.i.i.i = or i64 %216, %215
  %cmp_eq_767.i.i.i = icmp sgt i16 %alu_33.i.i.i.i, -1
  %cmp_eq_779.not.i.i.i = icmp samesign ugt i64 %slot_v2721.0.i.i, 549755813887
  %alu_79093.not.not.not97.not99.i.i.i = or i1 %cmp_eq_779.not.i.i.i, %cmp_eq_641.not.not.not94.not95.not98.not100.i.i.i
  %alu_81196.not.not.i.i.i = or i1 %cmp_eq_767.i.i.i, %alu_79093.not.not.not97.not99.i.i.i
  %219 = shl nuw nsw i64 %call_zx_25.i.i.i, 4
  %alu_245101.i.i.i = and i64 %219, 128
  %arg_v4.mask.i.i.i = and i64 %slot_v2721.0.i.i, 16256
  %alu_827.i.i.i = add nuw nsw i64 %alu_245101.i.i.i, %arg_v4.mask.i.i.i
  %alu_831.i.i.i = or i64 %alu_212.i.i.i, %alu_827.i.i.i
  %220 = shl nuw nsw i64 %call_zx_25.i.i.i, 7
  %sel_285.i.i.i = and i64 %220, 16384
  %alu_288102.i.i.i = xor i64 %sel_285.i.i.i, 16384
  %arg_v4.mask103.i.i.i = and i64 %slot_v2721.0.i.i, 2080768
  %alu_834.i.i.i = add nuw nsw i64 %alu_288102.i.i.i, %arg_v4.mask103.i.i.i
  %221 = shl nuw nsw i64 %call_zx_25.i.i.i, 12
  %alu_321104.i.i.i = and i64 %221, 2097152
  %arg_v4.mask105.i.i.i = and i64 %slot_v2721.0.i.i, 266338304
  %alu_841.i.i.i = add nuw nsw i64 %alu_321104.i.i.i, %arg_v4.mask105.i.i.i
  %222 = shl nuw nsw i64 %call_zx_25.i.i.i, 18
  %alu_354106.i.i.i = and i64 %222, 268435456
  %arg_v4.mask107.i.i.i = and i64 %slot_v2721.0.i.i, 34091302912
  %alu_848.i.i.i = add nuw nsw i64 %alu_354106.i.i.i, %arg_v4.mask107.i.i.i
  %alu_653.i.i.i = shl nuw nsw i64 %.lobit8089.i.i.i, 35
  %alu_855.i.i.i = and i64 %alu_653.i.i.i, 34359738368
  %alu_677.i.i.i = shl nuw nsw i64 %.lobit8290.i.i.i, 36
  %alu_862.i.i.i = and i64 %alu_677.i.i.i, 68719476736
  %alu_701.i.i.i = shl nuw nsw i64 %.lobit8491.i.i.i, 37
  %alu_869.i.i.i = and i64 %alu_701.i.i.i, 137438953472
  %alu_725.i.i.i = shl nuw nsw i64 %.lobit8692.i.i.i, 38
  %alu_876.i.i.i = and i64 %alu_725.i.i.i, 274877906944
  %alu_883.i.i.i = select i1 %alu_81196.not.not.i.i.i, i64 549755813888, i64 0
  %alu_838.i.i.i = or disjoint i64 %alu_831.i.i.i, %alu_841.i.i.i
  %alu_845.i.i.i = or disjoint i64 %alu_834.i.i.i, %alu_848.i.i.i
  %alu_852.i.i.i = or disjoint i64 %alu_862.i.i.i, %alu_855.i.i.i
  %alu_859.i.i.i = or disjoint i64 %alu_852.i.i.i, %alu_869.i.i.i
  %alu_866.i.i.i = or disjoint i64 %alu_859.i.i.i, %alu_876.i.i.i
  %alu_873.i.i.i = or i64 %alu_866.i.i.i, %alu_845.i.i.i
  %alu_880.i.i.i = or i64 %alu_873.i.i.i, %alu_838.i.i.i
  %alu_887.i.i.i = or i64 %alu_880.i.i.i, %alu_883.i.i.i
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msThreshChild.exit.i.i: ; preds = %ite_else_177.i.i.i, %ite_then_176.i.i.i, %loop_body_3508.i.i
  %common.ret.op.i.i.i = phi i64 [ %alu_181.i.i.i, %ite_then_176.i.i.i ], [ %alu_887.i.i.i, %ite_else_177.i.i.i ], [ %slot_v2721.0.i.i, %loop_body_3508.i.i ]
  %loop_next_3512.i.i = add nuw nsw i64 %loop_idx_3511.i.i, 1
  br label %loop_hdr_3507.i.i

loop_exit_3510.i.i:                               ; preds = %loop_hdr_3507.i.i
  %cmp_eq_3532.i.i = icmp samesign ugt i64 %slot_v2721.0.i.i, 1099511627775
  br i1 %cmp_eq_3532.i.i, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit, label %ite_else_3948.i.i

ite_else_3948.i.i:                                ; preds = %loop_exit_3510.i.i
  %alu_3550.i.i = lshr i64 %slot_v2721.0.i.i, 21
  %alu_3552.i.i = and i64 %alu_3550.i.i, 127
  %cmp_eq_3616.i.i = icmp eq i64 %alu_3552.i.i, %alu_19.i.i
  %alu_3544.i.i = lshr i64 %slot_v2721.0.i.i, 14
  %alu_3546.i.i = and i64 %alu_3544.i.i, 127
  %cmp_eq_3621.i.i = icmp eq i64 %alu_3546.i.i, 0
  %alu_3632264.i.i = and i1 %cmp_eq_3616.i.i, %cmp_eq_3621.i.i
  %alu_3829.i.i = select i1 %alu_3632264.i.i, i64 2, i64 0
  %223 = lshr i64 %slot_v2721.0.i.i, 32
  %224 = and i64 %223, 248
  %alu_3836.i.i = or disjoint i64 %alu_3829.i.i, %224
  %alu_3556.i.i = lshr i64 %slot_v2721.0.i.i, 28
  %alu_3558.i.i = and i64 %alu_3556.i.i, 127
  %cmp_eq_3644.i.i = icmp eq i64 %alu_3558.i.i, %alu_19.i.i
  %cmp_le_3664.not.i.i = icmp samesign ule i64 %alu_3546.i.i, %alu_14.i.i
  %225 = and i1 %cmp_eq_3644.i.i, %cmp_le_3664.not.i.i
  %alu_3675266.i.i = and i1 %cmp_eq_3616.i.i, %225
  %alu_3845.i.i = select i1 %alu_3675266.i.i, i64 4, i64 0
  %226 = or disjoint i64 %alu_3836.i.i, %alu_3845.i.i
  %alu_3534.i.i = and i64 %slot_v2721.0.i.i, 127
  %cmp_eq_3566.i.i = icmp eq i64 %alu_3534.i.i, %alu_19.i.i
  %alu_3779.i.i = select i1 %cmp_eq_3566.i.i, i8 100, i8 96
  %alu_3570.i.i = add nuw nsw i64 %alu_19.i.i, 4294967295
  %alu_3571.i.i = and i64 %alu_3570.i.i, 4294967295
  %cmp_eq_3577.i.i = icmp eq i64 %alu_3534.i.i, %alu_3571.i.i
  %227 = and i64 %slot_v2721.0.i.i, 16256
  %cmp_eq_3582.i.i = icmp eq i64 %227, 128
  %alu_3593263.i.i = and i1 %cmp_eq_3577.i.i, %cmp_eq_3582.i.i
  %alu_3744.i.i = select i1 %alu_3593263.i.i, i8 8, i8 0
  %alu_3792.i.i = or disjoint i8 %alu_3744.i.i, %alu_3779.i.i
  %alu_3603.i.i = add nuw nsw i64 %alu_14.i.i, 4294967295
  %alu_3604.i.i = and i64 %alu_3603.i.i, 4294967295
  %cmp_le_3610.not.not.i.i = icmp samesign ugt i64 %alu_3546.i.i, %alu_3604.i.i
  %alu_3801.i.i = select i1 %cmp_le_3610.not.not.i.i, i8 0, i8 -128
  %alu_3808.i.i = or disjoint i8 %alu_3792.i.i, %alu_3801.i.i
  %alu_5.i.i.i = shl nuw nsw i32 %call_tr_3518.i.i, 1
  %rst_gep_13.i.i1337.i = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %alu_5.i.i.i
  store i8 %alu_3808.i.i, ptr %rst_gep_13.i.i1337.i, align 1
  %rst_gep_33.i.i1338.i = getelementptr inbounds nuw i8, ptr %rst_gep_13.i.i1337.i, i32 1
  %228 = trunc nuw i64 %226 to i8
  %rst_tr8_34.i.i1339.i = xor i8 %228, -128
  store i8 %rst_tr8_34.i.i1339.i, ptr %rst_gep_33.i.i1338.i, align 1
  %alu_3960.i.i = shl nuw nsw i64 %alu_3501.i.i, 56
  %alu_3969.i.i = add nuw i64 %alu_3960.i.i, 72057594037927936
  br label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_msStep.exit: ; preds = %loop_body_45, %ite_then_46.i, %ite_then_322.i, %ite_then_598.i, %ite_then_873.i, %ite_then_1148.i, %ite_then_1423.i, %ite_then_1723.i, %ite_then_2107.i, %ite_then_2156.i, %ite_then_2508.i, %ite_else_2808.i, %ite_then_2824.i, %ite_else_3143.i, %ite_then_3159.i, %ite_else_3459.i, %ite_then_3475.i, %ite_else_3775.i, %ite_then_3820.i, %ite_else_4120.i, %ite_else_3821.i, %ite_else_4426.i, %ite_then_4442.i, %ite_else_4742.i, %ite_then_4758.i, %ite_else_5077.i, %ite_then_5093.i, %ite_else_5393.i, %ite_else_5094.i, %ite_else_5736.i, %ite_then_5796.i, %ite_then_7080.i, %ite_else_7097.i, %ite_else_7795.i, %ite_then_7824.i, %ite_else_8305.i, %ite_then_8334.i, %ite_else_8699.i, %ite_then_8728.i, %ite_else_9148.i, %ite_then_9177.i, %ite_else_9540.i, %ite_then_9569.i, %ite_else_9932.i, %ite_then_9961.i, %ite_else_9972.i, %ite_else_10914.i, %ite_else_5797.i, %ite_then_10975.i, %ite_else_10992.i, %ite_else_11921.i, %ite_else_14173.i, %ite_else_37.i, %ite_then_63.i.i, %ite_then_245.i.i, %ite_else_246.i.i, %ite_then_1397.i.i, %ite_else_1398.i.i, %ite_then_2548.i.i, %ite_else_2703.i.i, %ite_else_2549.i.i, %ite_else_3123.i.i, %ite_else_2539.i.i, %loop_exit_3510.i.i, %ite_else_3948.i.i
  %common.ret.op.i = phi i64 [ %call_313.i, %ite_then_46.i ], [ %call_589.i, %ite_then_322.i ], [ %call_864.i, %ite_then_598.i ], [ %call_1139.i, %ite_then_873.i ], [ %call_1414.i, %ite_then_1148.i ], [ %call_1689.i, %ite_then_1423.i ], [ %call_1990.i, %ite_then_1723.i ], [ %alu_2121.i, %ite_then_2107.i ], [ %slot_v1869.0, %ite_else_2808.i ], [ %slot_v1869.0, %ite_else_3143.i ], [ %slot_v1869.0, %ite_else_3459.i ], [ %slot_v1869.0, %ite_else_3775.i ], [ %slot_v1869.0, %ite_else_4120.i ], [ %slot_v1869.0, %ite_else_4426.i ], [ %slot_v1869.0, %ite_else_4742.i ], [ %slot_v1869.0, %ite_else_5077.i ], [ %slot_v1869.0, %ite_else_5393.i ], [ %slot_v1869.0, %ite_else_5736.i ], [ %alu_7814.i, %ite_else_7795.i ], [ %alu_8324.i, %ite_else_8305.i ], [ %alu_8718.i, %ite_else_8699.i ], [ %alu_9167.i, %ite_else_9148.i ], [ %alu_9559.i, %ite_else_9540.i ], [ %alu_9951.i, %ite_else_9932.i ], [ %alu_10933.i, %ite_else_10914.i ], [ %alu_14192.i, %ite_else_14173.i ], [ -9223372036854775808, %ite_then_2156.i ], [ -9223372036854775808, %ite_then_2508.i ], [ -9223372036854775808, %ite_then_2824.i ], [ -9223372036854775808, %ite_then_3159.i ], [ -9223372036854775808, %ite_then_3475.i ], [ -9223372036854775808, %ite_then_3820.i ], [ -9223372036854775808, %ite_else_3821.i ], [ -9223372036854775808, %ite_then_4442.i ], [ -9223372036854775808, %ite_then_4758.i ], [ -9223372036854775808, %ite_then_5093.i ], [ -9223372036854775808, %ite_else_5094.i ], [ -9223372036854775808, %ite_then_5796.i ], [ -9223372036854775808, %ite_then_7080.i ], [ -9223372036854775808, %ite_else_7097.i ], [ -9223372036854775808, %ite_then_7824.i ], [ -9223372036854775808, %ite_then_8334.i ], [ -9223372036854775808, %ite_then_8728.i ], [ -9223372036854775808, %ite_then_9177.i ], [ -9223372036854775808, %ite_then_9569.i ], [ -9223372036854775808, %ite_then_9961.i ], [ -9223372036854775808, %ite_else_9972.i ], [ -9223372036854775808, %ite_then_10975.i ], [ -9223372036854775808, %ite_else_10992.i ], [ -9223372036854775808, %ite_else_11921.i ], [ -9223372036854775808, %ite_else_5797.i ], [ %alu_14306.i, %ite_else_37.i ], [ %slot_v1869.0, %loop_body_45 ], [ %call_798.i.i, %ite_then_245.i.i ], [ %call_1350.i.i, %ite_else_246.i.i ], [ %call_1950.i.i, %ite_then_1397.i.i ], [ %call_2502.i.i, %ite_else_1398.i.i ], [ %call_2969.i.i, %ite_else_2703.i.i ], [ %call_3389.i.i, %ite_else_3123.i.i ], [ %alu_3969.i.i, %ite_else_3948.i.i ], [ -9223372036854775808, %ite_then_63.i.i ], [ -9223372036854775808, %ite_then_2548.i.i ], [ -9223372036854775808, %ite_else_2549.i.i ], [ -9223372036854775808, %ite_else_2539.i.i ], [ -9223372036854775808, %loop_exit_3510.i.i ]
  %loop_next_49 = add nuw nsw i64 %loop_idx_48, 1
  br label %loop_hdr_44

loop_exit_47:                                     ; preds = %loop_hdr_44
  %229 = and i64 %slot_v1869.0, -1125899906842624
  %alu_12622.not = icmp eq i64 %229, 72057594037927936
  br i1 %alu_12622.not, label %ite_else_147, label %common.ret

ite_else_147:                                     ; preds = %loop_exit_47
  %rld_i8_11.i = load i8, ptr %arg_v4, align 1
  %rld_val_12.i = zext i8 %rld_i8_11.i to i16
  %rld_gep_21.i = getelementptr inbounds nuw i8, ptr %arg_v4, i32 1
  %rld_i8_22.i = load i8, ptr %rld_gep_21.i, align 1
  %rld_val_23.i = zext i8 %rld_i8_22.i to i16
  %alu_33.i = shl nuw i16 %rld_val_23.i, 8
  %alu_40.i = or disjoint i16 %alu_33.i, %rld_val_12.i
  %call_zx_156 = zext i16 %alu_40.i to i64
  %sel_191 = xor i64 %arg_ext_v3, -1
  %230 = lshr i64 %call_zx_156, 10
  %alu_199 = or i64 %230, %sel_191
  %alu_214 = lshr i64 %arg_ext_v3, 1
  %sel_244 = xor i64 %alu_214, -1
  %231 = lshr i64 %call_zx_156, 7
  %alu_252 = or i64 %231, %sel_244
  %alu_267 = and i64 %call_zx_156, 3
  %cmp_eq_274 = icmp eq i64 %alu_267, 0
  %232 = icmp slt i16 %alu_33.i, 0
  %233 = and i1 %232, %cmp_eq_274
  %alu_324 = and i64 %alu_252, 1
  %234 = and i64 %alu_324, %alu_199
  %cmp_eq_35025 = icmp ne i64 %234, 0
  %cmp_eq_350 = select i1 %233, i1 %cmp_eq_35025, i1 false
  %ret_tr_354 = zext i1 %cmp_eq_350 to i8
  br label %common.ret
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef range(i32 -2147483648, 0) i32 @llb_bip32_harden(i32 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %0 = or i32 %arg_v0, -2147483648
  ret i32 %0
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_merkle_depth_index_ok(i32 noundef %arg_v0, i32 noundef %arg_v1, i8 noundef zeroext %arg_v2) local_unnamed_addr #4 {
entry:
  %cmp_lt_9 = icmp ult i32 %arg_v1, %arg_v0
  %cmp_le_13 = icmp sgt i32 %arg_v1, -1
  %cmp_le_17 = icmp ult i8 %arg_v2, 33
  %narrow = and i1 %cmp_le_13, %cmp_le_17
  %narrow6 = and i1 %cmp_lt_9, %narrow
  %ret_tr_35 = zext i1 %narrow6 to i8
  ret i8 %ret_tr_35
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden range(i32 0, 1073741824) i32 @llb_bech32_polymod_step(i32 noundef %arg_v0, i8 noundef zeroext %arg_v1) local_unnamed_addr #4 {
entry:
  %arg_ext_v0 = zext i32 %arg_v0 to i64
  %arg_ext_v1 = zext i8 %arg_v1 to i32
  %alu_5 = shl i32 %arg_v0, 5
  %alu_9 = and i32 %alu_5, 1073741792
  %alu_17 = xor i32 %alu_9, %arg_ext_v1
  %0 = and i64 %arg_ext_v0, 33554432
  %cmp_eq_26 = icmp eq i64 %0, 0
  %1 = and i64 %arg_ext_v0, 67108864
  %cmp_eq_34 = icmp eq i64 %1, 0
  %2 = and i64 %arg_ext_v0, 134217728
  %cmp_eq_42 = icmp eq i64 %2, 0
  %3 = and i64 %arg_ext_v0, 268435456
  %cmp_eq_50 = icmp eq i64 %3, 0
  %4 = and i64 %arg_ext_v0, 536870912
  %cmp_eq_58 = icmp eq i64 %4, 0
  %sel_86.v = select i1 %cmp_eq_58, i32 1054471160, i32 349016395
  %sel_101.v = select i1 %cmp_eq_58, i32 60538917, i32 697279126
  %sel_106.v = select i1 %cmp_eq_50, i32 %sel_101.v, i32 %sel_86.v
  %sel_125.v = select i1 %cmp_eq_58, i32 544795138, i32 174885041
  %sel_140.v = select i1 %cmp_eq_58, i32 490396127, i32 925809516
  %sel_145.v = select i1 %cmp_eq_50, i32 %sel_140.v, i32 %sel_125.v
  %sel_150.v = select i1 %cmp_eq_42, i32 %sel_145.v, i32 %sel_106.v
  %sel_173.v = select i1 %cmp_eq_58, i32 411663765, i32 849157926
  %sel_188.v = select i1 %cmp_eq_58, i32 634080840, i32 266284283
  %sel_193.v = select i1 %cmp_eq_50, i32 %sel_188.v, i32 %sel_173.v
  %sel_212.v = select i1 %cmp_eq_58, i32 103310447, i32 742131420
  %sel_227.v = select i1 %cmp_eq_58, i32 996825010, i32 293483777
  %sel_232.v = select i1 %cmp_eq_50, i32 %sel_227.v, i32 %sel_212.v
  %sel_237.v = select i1 %cmp_eq_42, i32 %sel_232.v, i32 %sel_193.v
  %sel_242.v = select i1 %cmp_eq_34, i32 %sel_237.v, i32 %sel_150.v
  %sel_242 = xor i32 %sel_242.v, %alu_17
  %sel_269.v = select i1 %cmp_eq_58, i32 95659082, i32 799524601
  %sel_284.v = select i1 %cmp_eq_58, i32 955357079, i32 317060388
  %sel_289.v = select i1 %cmp_eq_50, i32 %sel_284.v, i32 %sel_269.v
  %sel_308.v = select i1 %cmp_eq_58, i32 454213040, i32 822533891
  %sel_323.v = select i1 %cmp_eq_58, i32 642813549, i32 205843678
  %sel_328.v = select i1 %cmp_eq_50, i32 %sel_323.v, i32 %sel_308.v
  %sel_333.v = select i1 %cmp_eq_42, i32 %sel_328.v, i32 %sel_289.v
  %sel_333 = xor i32 %sel_333.v, %alu_17
  %sel_356.v = select i1 %cmp_eq_58, i32 602090023, i32 167200916
  %sel_371.v = select i1 %cmp_eq_58, i32 513874426, i32 884308809
  %sel_376.v = select i1 %cmp_eq_50, i32 %sel_371.v, i32 %sel_356.v
  %sel_376 = xor i32 %sel_376.v, %alu_17
  %sel_395.v = select i1 %cmp_eq_58, i32 1027748829, i32 391532910
  %sel_395 = xor i32 %sel_395.v, %alu_17
  %alu_401 = xor i32 %alu_17, 705979059
  %sel_410 = select i1 %cmp_eq_58, i32 %alu_17, i32 %alu_401
  %sel_415 = select i1 %cmp_eq_50, i32 %sel_410, i32 %sel_395
  %sel_420 = select i1 %cmp_eq_42, i32 %sel_415, i32 %sel_376
  %sel_425 = select i1 %cmp_eq_34, i32 %sel_420, i32 %sel_333
  %sel_430 = select i1 %cmp_eq_26, i32 %sel_425, i32 %sel_242
  ret i32 %sel_430
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_check_export_path(ptr noundef readonly captures(none) %arg_v0, i8 noundef zeroext %arg_v1, i32 noundef %arg_v2) local_unnamed_addr #1 {
entry:
  %cmp_le_5 = icmp ult i8 %arg_v1, 11
  br i1 %cmp_le_5, label %ite_then_8, label %common.ret

ite_then_8:                                       ; preds = %entry
  %cmp_lt_18.not = icmp eq i8 %arg_v1, 0
  br i1 %cmp_lt_18.not, label %llb_bip32_pubkey_export_prefix_ok.exit531, label %ite_then_20

ite_then_20:                                      ; preds = %ite_then_8
  %rld_i32_26 = load i32, ptr %arg_v0, align 4
  %rld_val_27 = zext i32 %rld_i32_26 to i64
  %cmp_lt_33.not = icmp eq i8 %arg_v1, 1
  br i1 %cmp_lt_33.not, label %ite_else_960, label %ite_then_35

ite_then_35:                                      ; preds = %ite_then_20
  %rld_gep_40 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 4
  %rld_i32_41 = load i32, ptr %rld_gep_40, align 4
  %cmp_lt_48 = icmp samesign ugt i8 %arg_v1, 2
  br i1 %cmp_lt_48, label %ite_then_50, label %ite_else_359

ite_then_50:                                      ; preds = %ite_then_35
  %rld_gep_55 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 8
  %rld_i32_56 = load i32, ptr %rld_gep_55, align 4
  %cmp_lt_63.not = icmp eq i8 %arg_v1, 3
  br i1 %cmp_lt_63.not, label %ite_else_66, label %ite_then_65

ite_then_65:                                      ; preds = %ite_then_50
  %rld_gep_70 = getelementptr inbounds nuw i8, ptr %arg_v0, i32 12
  %rld_i32_71 = load i32, ptr %rld_gep_70, align 4
  %alu_77 = and i64 %rld_val_27, 2147483647
  %cmp_eq_85 = icmp eq i64 %alu_77, 48
  %call_tr_104 = zext nneg i8 %arg_v1 to i32
  br i1 %cmp_eq_85, label %ite_then_97, label %ite_else_156

common.ret:                                       ; preds = %ite_else_359, %ite_else_960, %entry, %llb_bip32_pubkey_export_prefix_ok.exit531, %ite_else_295, %ite_then_236, %ite_else_156, %ite_then_97
  %common.ret.op = phi i8 [ %call_122, %ite_then_97 ], [ %call_207, %ite_else_156 ], [ %call_261, %ite_then_236 ], [ %call_346, %ite_else_295 ], [ 0, %llb_bip32_pubkey_export_prefix_ok.exit531 ], [ 0, %entry ], [ 0, %ite_else_960 ], [ %call_581, %ite_else_359 ]
  ret i8 %common.ret.op

ite_then_97:                                      ; preds = %ite_then_65
  %call_105 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 4, i32 %call_tr_104)
  %call_122 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 %rld_i32_26, i32 %rld_i32_41, i32 %rld_i32_56, i32 %rld_i32_71, i8 zeroext %arg_v1, i32 %arg_v2, i8 zeroext %call_105)
  br label %common.ret

ite_else_156:                                     ; preds = %ite_then_65
  %call_190 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 3, i32 %call_tr_104)
  %call_207 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 %rld_i32_26, i32 %rld_i32_41, i32 %rld_i32_56, i32 %rld_i32_71, i8 zeroext %arg_v1, i32 %arg_v2, i8 zeroext %call_190)
  br label %common.ret

ite_else_66:                                      ; preds = %ite_then_50
  %alu_216 = and i64 %rld_val_27, 2147483647
  %cmp_eq_224 = icmp eq i64 %alu_216, 48
  br i1 %cmp_eq_224, label %ite_then_236, label %ite_else_295

ite_then_236:                                     ; preds = %ite_else_66
  %call_244 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 4, i32 3)
  %call_261 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 %rld_i32_26, i32 %rld_i32_41, i32 %rld_i32_56, i32 0, i8 zeroext 3, i32 %arg_v2, i8 zeroext %call_244)
  br label %common.ret

ite_else_295:                                     ; preds = %ite_else_66
  %call_329 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 3, i32 3)
  %call_346 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 %rld_i32_26, i32 %rld_i32_41, i32 %rld_i32_56, i32 0, i8 zeroext 3, i32 %arg_v2, i8 zeroext %call_329)
  br label %common.ret

ite_else_359:                                     ; preds = %ite_then_35
  %call_564 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 3, i32 2)
  %call_581 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 %rld_i32_26, i32 %rld_i32_41, i32 0, i32 0, i8 zeroext %arg_v1, i32 %arg_v2, i8 zeroext %call_564)
  br label %common.ret

ite_else_960:                                     ; preds = %ite_then_20
  %call_1165 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr nonnull %arg_v0, i32 3, i32 1)
  br label %common.ret

llb_bip32_pubkey_export_prefix_ok.exit531:        ; preds = %ite_then_8
  %call_2440 = tail call fastcc zeroext i8 @l_BitcoinLedger_FreestandingKernels_bip32TailClear(ptr %arg_v0, i32 3, i32 0)
  br label %common.ret
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_bolos_depth_ok(i8 noundef zeroext %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_le_3 = icmp ult i8 %arg_v0, 11
  %ret_tr_6 = zext i1 %cmp_le_3 to i8
  ret i8 %ret_tr_6
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_pubkey_export_prefix_ok(i32 noundef %arg_v0, i32 noundef %arg_v1, i32 noundef %arg_v2, i32 noundef %arg_v3, i8 noundef zeroext %arg_v4, i32 noundef %arg_v5, i8 noundef zeroext %arg_v6) local_unnamed_addr #4 {
entry:
  %0 = and i8 %arg_v6, 1
  %cmp_eq_3 = icmp eq i8 %arg_v4, 2
  br i1 %cmp_eq_3, label %ite_then_5, label %ite_else_6

ite_then_5:                                       ; preds = %entry
  %cmp_eq_11 = icmp eq i32 %arg_v0, -2142942139
  br i1 %cmp_eq_11, label %ite_then_13, label %common.ret

common.ret:                                       ; preds = %ite_else_32, %ite_else_43, %ite_then_61, %ite_then_77, %ite_then_93, %ite_then_1370, %ite_then_1378, %ite_then_1394, %ite_then_145, %ite_then_145, %ite_then_145, %ite_then_145, %ite_then_145, %ite_then_145, %ite_then_118, %ite_else_6, %ite_then_5, %ite_else_1371, %ite_else_1408, %ite_then_13
  %common.ret.op.shrunk = phi i1 [ %cmp_eq_19, %ite_then_13 ], [ %cmp_eq_1416, %ite_else_1408 ], [ false, %ite_else_1371 ], [ false, %ite_then_5 ], [ false, %ite_else_6 ], [ false, %ite_then_118 ], [ true, %ite_then_145 ], [ true, %ite_then_145 ], [ true, %ite_then_145 ], [ true, %ite_then_145 ], [ true, %ite_then_145 ], [ true, %ite_then_145 ], [ true, %ite_then_1394 ], [ false, %ite_then_1378 ], [ false, %ite_then_1370 ], [ false, %ite_then_93 ], [ false, %ite_then_77 ], [ false, %ite_then_61 ], [ false, %ite_else_43 ], [ false, %ite_else_32 ]
  %common.ret.op = zext i1 %common.ret.op.shrunk to i8
  ret i8 %common.ret.op

ite_then_13:                                      ; preds = %ite_then_5
  %cmp_eq_19 = icmp eq i32 %arg_v1, -1035385550
  br label %common.ret

ite_else_6:                                       ; preds = %entry
  %cmp_lt_29 = icmp ult i8 %arg_v4, 3
  br i1 %cmp_lt_29, label %common.ret, label %ite_else_32

ite_else_32:                                      ; preds = %ite_else_6
  %ite_cond_37.not = icmp eq i8 %0, 0
  br i1 %ite_cond_37.not, label %common.ret, label %ite_else_43

ite_else_43:                                      ; preds = %ite_else_32
  %ite_cond_60.not = icmp sgt i32 %arg_v0, -1
  br i1 %ite_cond_60.not, label %common.ret, label %ite_then_61

ite_then_61:                                      ; preds = %ite_else_43
  %ite_cond_76.not = icmp sgt i32 %arg_v1, -1
  br i1 %ite_cond_76.not, label %common.ret, label %ite_then_77

ite_then_77:                                      ; preds = %ite_then_61
  %ite_cond_92.not = icmp sgt i32 %arg_v2, -1
  br i1 %ite_cond_92.not, label %common.ret, label %ite_then_93

ite_then_93:                                      ; preds = %ite_then_77
  %1 = and i32 %arg_v0, 2147483647
  %2 = and i32 %arg_v1, 2147483647
  %cmp_eq_116 = icmp eq i32 %2, %arg_v5
  br i1 %cmp_eq_116, label %ite_then_118, label %common.ret

ite_then_118:                                     ; preds = %ite_then_93
  %3 = and i32 %arg_v2, 2147483647
  %cmp_lt_124 = icmp samesign ugt i32 %3, 100
  br i1 %cmp_lt_124, label %common.ret, label %ite_then_145

ite_then_145:                                     ; preds = %ite_then_118
  switch i32 %1, label %ite_else_1371 [
    i32 44, label %common.ret
    i32 49, label %common.ret
    i32 84, label %common.ret
    i32 86, label %common.ret
    i32 87, label %common.ret
    i32 45, label %common.ret
    i32 48, label %ite_then_1370
  ]

ite_then_1370:                                    ; preds = %ite_then_145
  %cmp_le_1376.not = icmp eq i8 %arg_v4, 3
  br i1 %cmp_le_1376.not, label %common.ret, label %ite_then_1378

ite_then_1378:                                    ; preds = %ite_then_1370
  %ite_cond_1393.not = icmp sgt i32 %arg_v3, -1
  br i1 %ite_cond_1393.not, label %common.ret, label %ite_then_1394

ite_then_1394:                                    ; preds = %ite_then_1378
  %4 = and i32 %arg_v3, 2147483647
  %cmp_eq_1405 = icmp eq i32 %4, 1
  br i1 %cmp_eq_1405, label %common.ret, label %ite_else_1408

ite_else_1408:                                    ; preds = %ite_then_1394
  %cmp_eq_1416 = icmp eq i32 %4, 2
  br label %common.ret

ite_else_1371:                                    ; preds = %ite_then_145
  br label %common.ret
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_sighash_type_valid(i32 noundef %arg_v0) local_unnamed_addr #2 {
entry:
  %cmp_le_3 = icmp ult i32 %arg_v0, 256
  %0 = and i32 %arg_v0, 127
  %1 = add nsw i32 %0, -1
  %narrow = icmp ult i32 %1, 3
  %narrow5 = select i1 %cmp_le_3, i1 %narrow, i1 false
  %ret_tr_28 = zext i1 %narrow5 to i8
  ret i8 %ret_tr_28
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i64 @llb_psbt_locktime_init() local_unnamed_addr #4 {
entry:
  ret i64 -9223372036854775808
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden range(i32 0, -1) i32 @llb_format_sats_ascii(i64 noundef %arg_v0, ptr noundef readonly captures(none) %arg_v1, i32 noundef %arg_v2, i8 noundef zeroext %arg_v3, ptr noundef writeonly captures(none) %arg_v4, i32 noundef %arg_v5) local_unnamed_addr #0 {
entry:
  %arg_ext_v2 = zext i32 %arg_v2 to i64
  %arg_ext_v5 = zext i32 %arg_v5 to i64
  %cmp_lt_5 = icmp ugt i32 %arg_v2, 256
  br i1 %cmp_lt_5, label %common.ret, label %ite_else_8

common.ret.sink.split:                            ; preds = %ite_else_585, %ite_else_780, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit368, %loop_exit_1309, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit378, %ite_else_1702, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit388, %ite_else_2158
  %.sink = phi i32 [ %4, %ite_else_2158 ], [ %call_tr_2097, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit388 ], [ %3, %ite_else_1702 ], [ %call_tr_1641, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit378 ], [ %2, %loop_exit_1309 ], [ %call_tr_1175, %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit368 ], [ %1, %ite_else_780 ], [ %call_tr_729, %ite_else_585 ]
  %rst_gep_2314 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %.sink
  store i8 0, ptr %rst_gep_2314, align 1
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %ite_else_1926, %ite_then_1925, %ite_else_1470, %ite_then_1469, %ite_else_1004, %ite_then_1003, %ite_else_548, %ite_then_547, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ 0, %ite_then_547 ], [ 0, %ite_else_548 ], [ 0, %ite_then_1003 ], [ 0, %ite_else_1004 ], [ 0, %ite_then_1469 ], [ 0, %ite_else_1470 ], [ 0, %ite_then_1925 ], [ 0, %ite_else_1926 ], [ %.sink, %common.ret.sink.split ]
  ret i32 %common.ret.op

ite_else_8:                                       ; preds = %entry
  %alu_13 = and i64 %arg_v0, 4294967295
  %alu_16 = lshr i64 %arg_v0, 32
  %alu_26 = mul nuw i64 %alu_13, 2221002493
  %alu_34 = mul nuw i64 %alu_13, 2882303761
  %alu_42 = mul nuw i64 %alu_16, 2221002493
  %alu_50 = mul nuw i64 %alu_16, 2882303761
  %alu_54 = lshr i64 %alu_26, 32
  %alu_57 = and i64 %alu_34, 4294967295
  %alu_62 = add nuw nsw i64 %alu_54, %alu_57
  %alu_64 = and i64 %alu_42, 4294967295
  %alu_69 = add nuw nsw i64 %alu_62, %alu_64
  %alu_72 = lshr i64 %alu_34, 32
  %alu_76 = add nuw i64 %alu_72, %alu_50
  %alu_79 = lshr i64 %alu_42, 32
  %alu_83 = add nuw i64 %alu_76, %alu_79
  %alu_86 = lshr i64 %alu_69, 32
  %alu_90 = add nuw i64 %alu_83, %alu_86
  %alu_94 = lshr i64 %alu_90, 26
  %alu_185 = and i64 %alu_94, 4294967295
  %alu_190.neg = mul i64 %alu_94, 4194967296
  %alu_196 = add i64 %alu_190.neg, %arg_v0
  %alu_197 = and i64 %alu_196, 4294967295
  %alu_203 = lshr i64 %alu_90, 58
  %alu_213 = mul nuw i64 %alu_185, 2221002493
  %alu_221 = mul nuw i64 %alu_185, 2882303761
  %alu_229 = mul nuw nsw i64 %alu_203, 2221002493
  %alu_237 = mul nuw nsw i64 %alu_203, 2882303761
  %alu_241 = lshr i64 %alu_213, 32
  %alu_244 = and i64 %alu_221, 4294967295
  %alu_251 = and i64 %alu_229, 4294967295
  %alu_249 = add nuw nsw i64 %alu_244, %alu_251
  %alu_256 = add nuw nsw i64 %alu_249, %alu_241
  %alu_259 = lshr i64 %alu_221, 32
  %alu_266 = lshr i64 %alu_229, 32
  %alu_273 = lshr i64 %alu_256, 32
  %alu_263 = add nuw nsw i64 %alu_266, %alu_237
  %alu_270 = add nuw nsw i64 %alu_263, %alu_259
  %alu_277 = add nuw nsw i64 %alu_270, %alu_273
  %alu_281 = lshr i64 %alu_277, 26
  %alu_379.neg = mul nuw nsw i64 %alu_281, 4194967296
  %alu_385 = add nuw nsw i64 %alu_379.neg, %alu_94
  %cmp_eq_393 = icmp samesign ult i64 %alu_277, 67108864
  %call_tr_395 = trunc nuw nsw i64 %alu_281 to i32
  %call_396 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_decLenU32(i32 %call_tr_395)
  %call_zx_397 = zext i32 %call_396 to i64
  %alu_406 = select i1 %cmp_eq_393, i64 4294967295, i64 0
  %alu_417360 = xor i64 %alu_406, -1
  %alu_423 = and i64 %call_zx_397, %alu_417360
  %call_tr_427 = trunc i64 %alu_385 to i32
  %call_428 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_decLenU32(i32 %call_tr_427)
  %0 = xor i32 %call_428, 8
  %alu_443 = zext i32 %0 to i64
  %alu_449 = and i64 %alu_406, %alu_443
  %alu_455 = xor i64 %alu_449, 8
  %alu_462 = add nuw nsw i64 %alu_455, %alu_423
  %cmp_eq_469 = icmp eq i8 %arg_v3, 0
  %cmp_eq_479 = icmp eq i64 %alu_197, 0
  br i1 %cmp_eq_469, label %ite_then_471, label %ite_else_472

ite_then_471:                                     ; preds = %ite_else_8
  br i1 %cmp_eq_479, label %ite_then_481, label %ite_else_482

ite_then_481:                                     ; preds = %ite_then_471
  %call_507 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_fracSigLen(i32 0)
  %call_zx_508 = zext i32 %call_507 to i64
  %cmp_eq_545 = icmp eq i32 %arg_v2, 0
  %alu_563 = add nuw nsw i64 %alu_462, %call_zx_508
  br i1 %cmp_eq_545, label %ite_then_547, label %ite_else_548

ite_then_547:                                     ; preds = %ite_then_481
  %alu_564 = and i64 %alu_563, 4294967295
  %cmp_le_582.not = icmp samesign ult i64 %alu_564, %arg_ext_v5
  br i1 %cmp_le_582.not, label %ite_else_585, label %common.ret

ite_else_585:                                     ; preds = %ite_then_547
  %call_tr_591 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_591, i32 %call_tr_395, i32 %call_tr_591)
  %call_tr_604 = trunc i64 %alu_462 to i32
  %call_tr_608 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_604, i32 %call_tr_427, i32 %call_tr_608)
  %call_tr_719 = add i32 %call_tr_604, 1
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_719, i32 0, i32 0)
  %call_tr_729 = trunc i64 %alu_563 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 0, ptr %arg_v4, i32 %call_tr_729)
  br label %common.ret.sink.split

ite_else_548:                                     ; preds = %ite_then_481
  %alu_764 = add nuw nsw i64 %alu_563, 1
  %alu_770 = add nuw nsw i64 %alu_764, %arg_ext_v2
  %alu_771 = and i64 %alu_770, 4294967295
  %cmp_le_777.not = icmp samesign ult i64 %alu_771, %arg_ext_v5
  br i1 %cmp_le_777.not, label %ite_else_780, label %common.ret

ite_else_780:                                     ; preds = %ite_else_548
  %call_tr_786 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_786, i32 %call_tr_395, i32 %call_tr_786)
  %call_tr_799 = trunc i64 %alu_462 to i32
  %call_tr_803 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_799, i32 %call_tr_427, i32 %call_tr_803)
  %call_tr_914 = add i32 %call_tr_799, 1
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_914, i32 0, i32 0)
  %call_tr_924 = trunc i64 %alu_563 to i32
  %rst_gep_7.i362 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_924
  store i8 32, ptr %rst_gep_7.i362, align 1
  %call_tr_932 = trunc i64 %alu_764 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 %arg_v2, ptr %arg_v4, i32 %call_tr_932)
  %1 = trunc i64 %alu_770 to i32
  br label %common.ret.sink.split

ite_else_482:                                     ; preds = %ite_then_471
  %call_tr_962 = trunc i64 %alu_196 to i32
  %call_963 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_fracSigLen(i32 %call_tr_962)
  %call_zx_964 = zext i32 %call_963 to i64
  %cmp_eq_1001 = icmp eq i32 %arg_v2, 0
  %alu_1013 = add nuw nsw i64 %alu_462, 1
  %alu_1019 = add nuw nsw i64 %alu_1013, %call_zx_964
  br i1 %cmp_eq_1001, label %ite_then_1003, label %ite_else_1004

ite_then_1003:                                    ; preds = %ite_else_482
  %alu_1020 = and i64 %alu_1019, 4294967295
  %cmp_le_1038.not = icmp samesign ult i64 %alu_1020, %arg_ext_v5
  br i1 %cmp_le_1038.not, label %ite_else_1041, label %common.ret

ite_else_1041:                                    ; preds = %ite_then_1003
  %call_tr_1047 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1047, i32 %call_tr_395, i32 %call_tr_1047)
  %call_tr_1060 = trunc i64 %alu_462 to i32
  %call_tr_1064 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1060, i32 %call_tr_427, i32 %call_tr_1064)
  %rst_gep_7.i364 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1060
  store i8 46, ptr %rst_gep_7.i364, align 1
  %alu_1077 = sub nsw i64 8, %call_zx_964
  %alu_1078 = and i64 %alu_1077, 4294967295
  br label %loop_hdr_1111

loop_hdr_1111:                                    ; preds = %loop_body_1112, %ite_else_1041
  %slot_v18810.0 = phi i64 [ %alu_197, %ite_else_1041 ], [ %alu_1127, %loop_body_1112 ]
  %loop_idx_1115 = phi i64 [ 0, %ite_else_1041 ], [ %loop_next_1116, %loop_body_1112 ]
  %loop_cmp_1117 = icmp samesign ult i64 %loop_idx_1115, %alu_1078
  br i1 %loop_cmp_1117, label %loop_body_1112, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit368

loop_body_1112:                                   ; preds = %loop_hdr_1111
  %alu_1124 = mul nuw i64 %slot_v18810.0, 3435973837
  %alu_1127 = lshr i64 %alu_1124, 35
  %loop_next_1116 = add nuw nsw i64 %loop_idx_1115, 1
  br label %loop_hdr_1111

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit368: ; preds = %loop_hdr_1111
  %call_tr_1175 = trunc i64 %alu_1019 to i32
  %call_tr_1177 = trunc nuw i64 %slot_v18810.0 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1175, i32 %call_tr_1177, i32 %call_963)
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 0, ptr %arg_v4, i32 %call_tr_1175)
  br label %common.ret.sink.split

ite_else_1004:                                    ; preds = %ite_else_482
  %alu_1220 = add nuw nsw i64 %alu_1019, 1
  %alu_1226 = add nuw nsw i64 %alu_1220, %arg_ext_v2
  %alu_1227 = and i64 %alu_1226, 4294967295
  %cmp_le_1233.not = icmp samesign ult i64 %alu_1227, %arg_ext_v5
  br i1 %cmp_le_1233.not, label %ite_else_1236, label %common.ret

ite_else_1236:                                    ; preds = %ite_else_1004
  %call_tr_1242 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1242, i32 %call_tr_395, i32 %call_tr_1242)
  %call_tr_1255 = trunc i64 %alu_462 to i32
  %call_tr_1259 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1255, i32 %call_tr_427, i32 %call_tr_1259)
  %rst_gep_7.i370 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1255
  store i8 46, ptr %rst_gep_7.i370, align 1
  %alu_1272 = sub nsw i64 8, %call_zx_964
  %alu_1273 = and i64 %alu_1272, 4294967295
  br label %loop_hdr_1306

loop_hdr_1306:                                    ; preds = %loop_body_1307, %ite_else_1236
  %slot_v18855.0 = phi i64 [ %alu_197, %ite_else_1236 ], [ %alu_1322, %loop_body_1307 ]
  %loop_idx_1310 = phi i64 [ 0, %ite_else_1236 ], [ %loop_next_1311, %loop_body_1307 ]
  %loop_cmp_1312 = icmp samesign ult i64 %loop_idx_1310, %alu_1273
  br i1 %loop_cmp_1312, label %loop_body_1307, label %loop_exit_1309

loop_body_1307:                                   ; preds = %loop_hdr_1306
  %alu_1319 = mul nuw i64 %slot_v18855.0, 3435973837
  %alu_1322 = lshr i64 %alu_1319, 35
  %loop_next_1311 = add nuw nsw i64 %loop_idx_1310, 1
  br label %loop_hdr_1306

loop_exit_1309:                                   ; preds = %loop_hdr_1306
  %call_tr_1370 = trunc i64 %alu_1019 to i32
  %call_tr_1372 = trunc nuw i64 %slot_v18855.0 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1370, i32 %call_tr_1372, i32 %call_963)
  %rst_gep_7.i372 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1370
  store i8 32, ptr %rst_gep_7.i372, align 1
  %call_tr_1388 = trunc i64 %alu_1220 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 %arg_v2, ptr %arg_v4, i32 %call_tr_1388)
  %2 = trunc i64 %alu_1226 to i32
  br label %common.ret.sink.split

ite_else_472:                                     ; preds = %ite_else_8
  br i1 %cmp_eq_479, label %ite_then_1403, label %ite_else_1404

ite_then_1403:                                    ; preds = %ite_else_472
  %call_1429 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_fracSigLen(i32 0)
  %cmp_eq_1467 = icmp eq i32 %arg_v2, 0
  br i1 %cmp_eq_1467, label %ite_then_1469, label %ite_else_1470

ite_then_1469:                                    ; preds = %ite_then_1403
  %alu_1485 = add nuw nsw i64 %alu_462, 9
  %alu_1486 = and i64 %alu_1485, 4294967295
  %cmp_le_1504.not = icmp samesign ult i64 %alu_1486, %arg_ext_v5
  br i1 %cmp_le_1504.not, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit378, label %common.ret

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit378: ; preds = %ite_then_1469
  %call_tr_1513 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1513, i32 %call_tr_395, i32 %call_tr_1513)
  %call_tr_1526 = trunc i64 %alu_462 to i32
  %call_tr_1530 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1526, i32 %call_tr_427, i32 %call_tr_1530)
  %rst_gep_7.i374 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1526
  store i8 46, ptr %rst_gep_7.i374, align 1
  %call_tr_1641 = trunc i64 %alu_1485 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1641, i32 0, i32 8)
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 0, ptr %arg_v4, i32 %call_tr_1641)
  br label %common.ret.sink.split

ite_else_1470:                                    ; preds = %ite_then_1403
  %alu_1686 = add nuw nsw i64 %alu_462, 10
  %alu_1692 = add nuw nsw i64 %alu_1686, %arg_ext_v2
  %alu_1693 = and i64 %alu_1692, 4294967295
  %cmp_le_1699.not = icmp samesign ult i64 %alu_1693, %arg_ext_v5
  br i1 %cmp_le_1699.not, label %ite_else_1702, label %common.ret

ite_else_1702:                                    ; preds = %ite_else_1470
  %call_tr_1708 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1708, i32 %call_tr_395, i32 %call_tr_1708)
  %call_tr_1721 = trunc i64 %alu_462 to i32
  %call_tr_1725 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1721, i32 %call_tr_427, i32 %call_tr_1725)
  %rst_gep_7.i380 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1721
  store i8 46, ptr %rst_gep_7.i380, align 1
  %call_tr_1836 = add i32 %call_tr_1721, 9
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1836, i32 0, i32 8)
  %rst_gep_7.i382 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1836
  store i8 32, ptr %rst_gep_7.i382, align 1
  %call_tr_1854 = trunc i64 %alu_1686 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 %arg_v2, ptr %arg_v4, i32 %call_tr_1854)
  %3 = trunc i64 %alu_1692 to i32
  br label %common.ret.sink.split

ite_else_1404:                                    ; preds = %ite_else_472
  %call_tr_1884 = trunc i64 %alu_196 to i32
  %call_1885 = tail call fastcc i32 @l_BitcoinLedger_FreestandingKernels_fracSigLen(i32 %call_tr_1884)
  %cmp_eq_1923 = icmp eq i32 %arg_v2, 0
  br i1 %cmp_eq_1923, label %ite_then_1925, label %ite_else_1926

ite_then_1925:                                    ; preds = %ite_else_1404
  %alu_1941 = add nuw nsw i64 %alu_462, 9
  %alu_1942 = and i64 %alu_1941, 4294967295
  %cmp_le_1960.not = icmp samesign ult i64 %alu_1942, %arg_ext_v5
  br i1 %cmp_le_1960.not, label %l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit388, label %common.ret

l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_maybeWriteByte.exit388: ; preds = %ite_then_1925
  %call_tr_1969 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1969, i32 %call_tr_395, i32 %call_tr_1969)
  %call_tr_1982 = trunc i64 %alu_462 to i32
  %call_tr_1986 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_1982, i32 %call_tr_427, i32 %call_tr_1986)
  %rst_gep_7.i384 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_1982
  store i8 46, ptr %rst_gep_7.i384, align 1
  %call_tr_2097 = trunc i64 %alu_1941 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_2097, i32 %call_tr_1884, i32 8)
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 0, ptr %arg_v4, i32 %call_tr_2097)
  br label %common.ret.sink.split

ite_else_1926:                                    ; preds = %ite_else_1404
  %alu_2142 = add nuw nsw i64 %alu_462, 10
  %alu_2148 = add nuw nsw i64 %alu_2142, %arg_ext_v2
  %alu_2149 = and i64 %alu_2148, 4294967295
  %cmp_le_2155.not = icmp samesign ult i64 %alu_2149, %arg_ext_v5
  br i1 %cmp_le_2155.not, label %ite_else_2158, label %common.ret

ite_else_2158:                                    ; preds = %ite_else_1926
  %call_tr_2164 = trunc nuw i64 %alu_423 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_2164, i32 %call_tr_395, i32 %call_tr_2164)
  %call_tr_2177 = trunc i64 %alu_462 to i32
  %call_tr_2181 = trunc nuw i64 %alu_455 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_2177, i32 %call_tr_427, i32 %call_tr_2181)
  %rst_gep_7.i390 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_2177
  store i8 46, ptr %rst_gep_7.i390, align 1
  %call_tr_2292 = add i32 %call_tr_2177, 9
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_emitDec(ptr %arg_v4, i32 %call_tr_2292, i32 %call_tr_1884, i32 8)
  %rst_gep_7.i392 = getelementptr inbounds nuw i8, ptr %arg_v4, i32 %call_tr_2292
  store i8 32, ptr %rst_gep_7.i392, align 1
  %call_tr_2310 = trunc i64 %alu_2142 to i32
  tail call fastcc void @l___private_LeanNativeInput_0__BitcoinLedger_FreestandingKernels_copyTicker(ptr %arg_v1, i32 %arg_v2, ptr %arg_v4, i32 %call_tr_2310)
  %4 = trunc i64 %alu_2148 to i32
  br label %common.ret.sink.split
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(none)
define internal fastcc range(i32 1, 0) i32 @l_BitcoinLedger_FreestandingKernels_decLenU32(i32 noundef %arg_v0) unnamed_addr #7 {
entry:
  %arg_ext_v0 = zext i32 %arg_v0 to i64
  br label %loop_hdr_6

loop_hdr_6:                                       ; preds = %loop_latch_8, %entry
  %slot_v20.0 = phi i64 [ %arg_ext_v0, %entry ], [ %slot_v20.1, %loop_latch_8 ]
  %loop_idx_10 = phi i64 [ 0, %entry ], [ %loop_next_11, %loop_latch_8 ]
  %loop_cmp_12 = icmp samesign ult i64 %loop_idx_10, 10
  br i1 %loop_cmp_12, label %loop_body_7, label %loop_exit_9

loop_body_7:                                      ; preds = %loop_hdr_6
  %alu_16 = and i64 %slot_v20.0, 4294967295
  %cmp_eq_24 = icmp eq i64 %alu_16, 0
  br i1 %cmp_eq_24, label %loop_latch_8, label %ite_else_27

ite_else_27:                                      ; preds = %loop_body_7
  %0 = and i64 %slot_v20.0, -4294967296
  %alu_37 = add i64 %0, 4294967296
  %alu_41 = mul nuw i64 %alu_16, 3435973837
  %alu_43 = lshr i64 %alu_41, 35
  %alu_51 = or disjoint i64 %alu_43, %alu_37
  br label %loop_latch_8

loop_latch_8:                                     ; preds = %loop_body_7, %ite_else_27
  %slot_v20.1 = phi i64 [ %alu_51, %ite_else_27 ], [ %slot_v20.0, %loop_body_7 ]
  %loop_next_11 = add nuw nsw i64 %loop_idx_10, 1
  br label %loop_hdr_6

loop_exit_9:                                      ; preds = %loop_hdr_6
  %cmp_eq_60 = icmp ult i64 %slot_v20.0, 4294967296
  %alu_54 = lshr i64 %slot_v20.0, 32
  %ret_tr_68 = trunc nuw i64 %alu_54 to i32
  %common.ret.op = select i1 %cmp_eq_60, i32 1, i32 %ret_tr_68
  ret i32 %common.ret.op
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_bip32_vanadium_depth_ok(i8 noundef zeroext %arg_v0) local_unnamed_addr #4 {
entry:
  %cmp_le_3 = icmp ult i8 %arg_v0, 17
  %ret_tr_6 = zext i1 %cmp_le_3 to i8
  ret i8 %ret_tr_6
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i16 26368, -20471) i16 @llb_bolos_sw_for_error(i8 noundef zeroext %arg_v0) local_unnamed_addr #4 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 0
  %cmp_eq_7 = icmp eq i8 %arg_v0, 1
  %cmp_eq_11 = icmp eq i8 %arg_v0, 2
  %cmp_eq_15 = icmp eq i8 %arg_v0, 3
  %cmp_eq_19 = icmp eq i8 %arg_v0, 4
  %cmp_eq_23 = icmp eq i8 %arg_v0, 5
  %cmp_eq_27 = icmp eq i8 %arg_v0, 6
  %cmp_eq_31 = icmp eq i8 %arg_v0, 7
  %cmp_eq_71 = icmp eq i8 %arg_v0, 17
  %cmp_eq_75 = icmp eq i8 %arg_v0, 18
  %0 = and i8 %arg_v0, -2
  %1 = and i8 %arg_v0, -4
  %2 = icmp eq i8 %1, 12
  %3 = icmp eq i8 %0, 10
  %4 = icmp eq i8 %0, 8
  %5 = select i1 %cmp_eq_75, i16 -20472, i16 -20473
  %6 = select i1 %cmp_eq_71, i16 -20480, i16 %5
  %7 = select i1 %2, i16 27264, i16 %6
  %8 = select i1 %3, i16 27266, i16 %7
  %9 = select i1 %4, i16 27264, i16 %8
  %10 = select i1 %cmp_eq_31, i16 27392, i16 %9
  %11 = select i1 %cmp_eq_27, i16 27010, i16 %10
  %12 = select i1 %cmp_eq_23, i16 27013, i16 %11
  %13 = select i1 %cmp_eq_19, i16 27270, i16 %12
  %14 = select i1 %cmp_eq_15, i16 28160, i16 %13
  %15 = select i1 %cmp_eq_11, i16 27904, i16 %14
  %16 = select i1 %cmp_eq_7, i16 27271, i16 %15
  %ret_tr_152 = select i1 %cmp_eq_3, i16 26368, i16 %16
  ret i16 %ret_tr_152
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i64 @llb_checked_add_sats_val(i64 noundef %arg_v0, i64 noundef %arg_v1) local_unnamed_addr #2 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 2100000000000001
  %alu_4 = sub i64 2100000000000000, %arg_v0
  %cmp_le_8 = icmp ule i64 %arg_v1, %alu_4
  %narrow = and i1 %cmp_le_2, %cmp_le_8
  %alu_21 = add i64 %arg_v1, %arg_v0
  %common.ret.op = select i1 %narrow, i64 %alu_21, i64 0
  ret i64 %common.ret.op
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden range(i64 -9223372036854775808, 1) i64 @llb_sum_amounts_le64(ptr noundef readonly captures(none) %arg_v0, i32 noundef %arg_v1) local_unnamed_addr #1 {
entry:
  %arg_ext_v1 = zext i32 %arg_v1 to i64
  br label %loop_hdr_4

loop_hdr_4:                                       ; preds = %loop_latch_6, %entry
  %slot_v20.0 = phi i64 [ -9223372036854775808, %entry ], [ %slot_v20.1, %loop_latch_6 ]
  %loop_idx_8 = phi i64 [ 0, %entry ], [ %loop_next_9, %loop_latch_6 ]
  %loop_cmp_10 = icmp samesign ult i64 %loop_idx_8, %arg_ext_v1
  br i1 %loop_cmp_10, label %loop_body_5, label %loop_exit_7

loop_body_5:                                      ; preds = %loop_hdr_4
  %cmp_eq_16 = icmp eq i64 %slot_v20.0, 0
  br i1 %cmp_eq_16, label %loop_latch_6, label %ite_else_19

ite_else_19:                                      ; preds = %loop_body_5
  %loop_idx_8.tr = trunc i64 %loop_idx_8 to i32
  %call_tr_32 = shl i32 %loop_idx_8.tr, 3
  %rld_gep_2.i = getelementptr inbounds nuw i8, ptr %arg_v0, i32 %call_tr_32
  %rld_i8_3.i = load i32, ptr %rld_gep_2.i, align 1
  %0 = zext i32 %rld_i8_3.i to i64
  %rld_gep_75.i = getelementptr i8, ptr %rld_gep_2.i, i32 4
  %rld_i8_76.i = load i8, ptr %rld_gep_75.i, align 1
  %rld_val_77.i = zext i8 %rld_i8_76.i to i64
  %alu_82.i = shl nuw nsw i64 %rld_val_77.i, 32
  %alu_86.i = or disjoint i64 %alu_82.i, %0
  %rld_gep_95.i = getelementptr i8, ptr %rld_gep_2.i, i32 5
  %rld_i8_96.i = load i8, ptr %rld_gep_95.i, align 1
  %rld_val_97.i = zext i8 %rld_i8_96.i to i64
  %alu_102.i = shl nuw nsw i64 %rld_val_97.i, 40
  %alu_106.i = or disjoint i64 %alu_86.i, %alu_102.i
  %rld_gep_115.i = getelementptr i8, ptr %rld_gep_2.i, i32 6
  %rld_i8_116.i = load i8, ptr %rld_gep_115.i, align 1
  %rld_val_117.i = zext i8 %rld_i8_116.i to i64
  %alu_122.i = shl nuw nsw i64 %rld_val_117.i, 48
  %alu_126.i = or disjoint i64 %alu_106.i, %alu_122.i
  %rld_gep_135.i = getelementptr i8, ptr %rld_gep_2.i, i32 7
  %rld_i8_136.i = load i8, ptr %rld_gep_135.i, align 1
  %rld_val_137.i = zext i8 %rld_i8_136.i to i64
  %alu_142.i = shl nuw i64 %rld_val_137.i, 56
  %alu_146.i = or disjoint i64 %alu_126.i, %alu_142.i
  %alu_36 = and i64 %slot_v20.0, 9223372036854775807
  %cmp_le_39 = icmp samesign ult i64 %alu_36, 2100000000000001
  %alu_41 = sub nsw i64 2100000000000000, %alu_36
  %cmp_le_45 = icmp ule i64 %alu_146.i, %alu_41
  %narrow = select i1 %cmp_le_39, i1 %cmp_le_45, i1 false
  br i1 %narrow, label %ite_then_53, label %loop_latch_6

ite_then_53:                                      ; preds = %ite_else_19
  %alu_58 = add i64 %alu_146.i, %slot_v20.0
  %alu_61 = or i64 %alu_58, -9223372036854775808
  br label %loop_latch_6

loop_latch_6:                                     ; preds = %ite_else_19, %loop_body_5, %ite_then_53
  %slot_v20.1 = phi i64 [ %alu_61, %ite_then_53 ], [ 0, %loop_body_5 ], [ 0, %ite_else_19 ]
  %loop_next_9 = add nuw nsw i64 %loop_idx_8, 1
  br label %loop_hdr_4

loop_exit_7:                                      ; preds = %loop_hdr_4
  ret i64 %slot_v20.0
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_segwit_program_valid(i8 noundef zeroext %arg_v0, i8 noundef zeroext %arg_v1) local_unnamed_addr #2 {
entry:
  %cmp_eq_3 = icmp eq i8 %arg_v0, 0
  %alu_2 = zext i1 %cmp_eq_3 to i8
  %cmp_eq_7 = icmp eq i8 %arg_v1, 20
  %cmp_eq_11 = icmp eq i8 %arg_v1, 32
  %alu_10 = zext i1 %cmp_eq_11 to i8
  %sel_16 = select i1 %cmp_eq_7, i8 %alu_2, i8 %alu_10
  %cmp_le_20 = icmp ult i8 %arg_v0, 17
  %cmp_le_24 = icmp ugt i8 %arg_v1, 1
  %cmp_le_28 = icmp ult i8 %arg_v1, 41
  %alu_27 = zext i1 %cmp_le_28 to i8
  %sel_33 = select i1 %cmp_le_24, i8 %alu_27, i8 %alu_2
  %sel_38 = select i1 %cmp_le_20, i8 %sel_33, i8 0
  %sel_43 = select i1 %cmp_eq_3, i8 %sel_16, i8 %sel_38
  ret i8 %sel_43
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext range(i8 1, 10) i8 @llb_varint_encoded_len(i64 noundef %arg_v0) local_unnamed_addr #4 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 253
  %cmp_le_5 = icmp ult i64 %arg_v0, 65536
  %cmp_le_8 = icmp ult i64 %arg_v0, 4294967296
  %0 = select i1 %cmp_le_8, i8 5, i8 9
  %1 = select i1 %cmp_le_5, i8 3, i8 %0
  %ret_tr_21 = select i1 %cmp_le_2, i8 1, i8 %1
  ret i8 %ret_tr_21
}

; Function Attrs: alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_wallet_name_char_ok(i8 noundef zeroext %arg_v0, i8 noundef zeroext %arg_v1) local_unnamed_addr #2 {
entry:
  %0 = and i8 %arg_v1, 1
  %ite_cond_0.not = icmp eq i8 %0, 0
  br i1 %ite_cond_0.not, label %ite_else_2, label %ite_then_1

ite_then_1:                                       ; preds = %entry
  %cmp_le_7 = icmp ugt i8 %arg_v0, 32
  br i1 %cmp_le_7, label %ite_then_9, label %common.ret

common.ret:                                       ; preds = %ite_else_2, %ite_then_1, %ite_then_27, %ite_then_9
  %common.ret.op.shrunk = phi i1 [ %cmp_le_15, %ite_then_9 ], [ %cmp_le_33, %ite_then_27 ], [ false, %ite_then_1 ], [ false, %ite_else_2 ]
  %common.ret.op = zext i1 %common.ret.op.shrunk to i8
  ret i8 %common.ret.op

ite_then_9:                                       ; preds = %ite_then_1
  %cmp_le_15 = icmp ult i8 %arg_v0, 127
  br label %common.ret

ite_else_2:                                       ; preds = %entry
  %cmp_le_25 = icmp ugt i8 %arg_v0, 31
  br i1 %cmp_le_25, label %ite_then_27, label %common.ret

ite_then_27:                                      ; preds = %ite_else_2
  %cmp_le_33 = icmp ult i8 %arg_v0, 127
  br label %common.ret
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i32 @llb_version_packed() local_unnamed_addr #4 {
entry:
  ret i32 132097
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext range(i8 0, 2) i8 @llb_checked_sub_sats_ok(i64 noundef %arg_v0, i64 noundef %arg_v1) local_unnamed_addr #4 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 2100000000000001
  %cmp_le_6 = icmp ule i64 %arg_v1, %arg_v0
  %narrow = and i1 %cmp_le_2, %cmp_le_6
  %ret_tr_14 = zext i1 %narrow to i8
  ret i8 %ret_tr_14
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_checked_sub_sats_val(i64 noundef %arg_v0, i64 noundef %arg_v1) local_unnamed_addr #4 {
entry:
  %cmp_le_2 = icmp ult i64 %arg_v0, 2100000000000001
  %cmp_le_6 = icmp ule i64 %arg_v1, %arg_v0
  %narrow = and i1 %cmp_le_2, %cmp_le_6
  %alu_19 = sub nuw i64 %arg_v0, %arg_v1
  %common.ret.op = select i1 %narrow, i64 %alu_19, i64 0
  ret i64 %common.ret.op
}

attributes #0 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) }
attributes #1 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: read) }
attributes #2 = { alwaysinline minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) }
attributes #3 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: write) }
attributes #4 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) }
attributes #5 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: read) }
attributes #6 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: write) }
attributes #7 = { minsize nofree norecurse nosync nounwind optsize memory(none) }
