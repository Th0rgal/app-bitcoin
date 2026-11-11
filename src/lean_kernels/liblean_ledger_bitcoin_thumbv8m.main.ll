; ModuleID = '/var/lib/sandboxed-node/.scratch/e42fdc4f-ce56-40b8-9b3e-c267ef038ce3/opencode/worktrees/lean-ledger-bitcoin/ffi/bolos/build/lto/liblean_ledger_bitcoin_thumbv8m.main.ll.pre.ll'
source_filename = "/var/lib/sandboxed-node/.scratch/e42fdc4f-ce56-40b8-9b3e-c267ef038ce3/opencode/worktrees/lean-ledger-bitcoin/ffi/bolos/src/lean_kernels.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv8m.main-none-unknown-eabi"

@switch.table.llb_bolos_sw_for_error = private unnamed_addr constant [19 x i16] [i16 26368, i16 27271, i16 27904, i16 28160, i16 27270, i16 27013, i16 27010, i16 27392, i16 27264, i16 27264, i16 27266, i16 27266, i16 27264, i16 27264, i16 27264, i16 27264, i16 -20473, i16 -20480, i16 -20472], align 2
@switch.table.llb_miniscript_check_postfix = private unnamed_addr constant [5 x i8] c"dD\FA\F2\F8", align 1
@switch.table.llb_miniscript_check_postfix.1 = private unnamed_addr constant [5 x i8] c"\87\85\86\86\86", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i32 @llb_version_packed() local_unnamed_addr #0 {
  ret i32 132097
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_valid_amount(i64 noundef %0) local_unnamed_addr #1 {
  %2 = icmp ult i64 %0, 2100000000000001
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_checked_add_sats_ok(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = icmp ult i64 %0, 2100000000000001
  %4 = sub nuw nsw i64 2100000000000000, %0
  %5 = icmp uge i64 %4, %1
  %6 = select i1 %3, i1 %5, i1 false
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_checked_add_sats_val(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = icmp ugt i64 %0, 2100000000000000
  %4 = sub nuw nsw i64 2100000000000000, %0
  %5 = icmp ult i64 %4, %1
  %6 = select i1 %3, i1 true, i1 %5
  %7 = add i64 %1, %0
  %8 = select i1 %6, i64 0, i64 %7
  ret i64 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_checked_sub_sats_ok(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i64 %0, 2100000000000001
  %4 = icmp ule i64 %1, %0
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i8
  ret i8 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i64 @llb_checked_sub_sats_val(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i64 %0, 2100000000000000
  %4 = icmp ugt i64 %1, %0
  %5 = or i1 %3, %4
  %6 = sub i64 %0, %1
  %7 = select i1 %5, i64 0, i64 %6
  ret i64 %7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_varint_encoded_len(i64 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i64 %0, 253
  br i1 %2, label %8, label %3

3:                                                ; preds = %1
  %4 = icmp ult i64 %0, 65536
  br i1 %4, label %8, label %5

5:                                                ; preds = %3
  %6 = icmp ult i64 %0, 4294967296
  %7 = select i1 %6, i8 5, i8 9
  br label %8

8:                                                ; preds = %5, %3, %1
  %9 = phi i8 [ 1, %1 ], [ 3, %3 ], [ %7, %5 ]
  ret i8 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_varint_prefix_is_canonical(i8 noundef zeroext %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i8 %0, -3
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = zext i8 %0 to i64
  %6 = icmp eq i64 %5, %1
  br label %16

7:                                                ; preds = %2
  switch i8 %0, label %14 [
    i8 -3, label %8
    i8 -2, label %11
  ]

8:                                                ; preds = %7
  %9 = add i64 %1, -253
  %10 = icmp ult i64 %9, 65283
  br label %16

11:                                               ; preds = %7
  %12 = add i64 %1, -65536
  %13 = icmp ult i64 %12, 4294901760
  br label %16

14:                                               ; preds = %7
  %15 = icmp ugt i64 %1, 4294967295
  br label %16

16:                                               ; preds = %14, %11, %8, %4
  %17 = phi i1 [ %6, %4 ], [ %10, %8 ], [ %13, %11 ], [ %15, %14 ]
  %18 = zext i1 %17 to i8
  ret i8 %18
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_is_hardened(i32 noundef %0) local_unnamed_addr #1 {
  %2 = lshr i32 %0, 31
  %3 = trunc i32 %2 to i8
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i32 @llb_bip32_harden(i32 noundef %0) local_unnamed_addr #0 {
  %2 = or i32 %0, -2147483648
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i32 @llb_bip32_unharden(i32 noundef %0) local_unnamed_addr #1 {
  %2 = and i32 %0, 2147483647
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_bolos_depth_ok(i8 noundef zeroext %0) local_unnamed_addr #1 {
  %2 = icmp ult i8 %0, 11
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_vanadium_depth_ok(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp ult i8 %0, 17
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_standard_purpose_ok(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, -1
  br i1 %2, label %9, label %3

3:                                                ; preds = %1
  %4 = and i32 %0, 2147483647
  switch i32 %4, label %5 [
    i32 44, label %6
    i32 49, label %6
    i32 84, label %6
    i32 86, label %6
    i32 87, label %6
    i32 45, label %6
  ]

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %5, %3, %3, %3, %3, %3, %3
  %7 = phi i1 [ true, %3 ], [ false, %5 ], [ true, %3 ], [ true, %3 ], [ true, %3 ], [ true, %3 ], [ true, %3 ]
  %8 = zext i1 %7 to i8
  br label %9

9:                                                ; preds = %6, %1
  %10 = phi i8 [ %8, %6 ], [ 0, %1 ]
  ret i8 %10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_witness_opcode_to_version(i8 noundef zeroext %0) local_unnamed_addr #1 {
  %2 = icmp eq i8 %0, 0
  %3 = add i8 %0, -81
  %4 = icmp ult i8 %3, 16
  %5 = add nsw i8 %0, -80
  %6 = select i1 %4, i8 %5, i8 -1
  %7 = select i1 %2, i8 0, i8 %6
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_segwit_program_valid(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #1 {
  %3 = icmp eq i8 %0, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = icmp eq i8 %1, 20
  %6 = icmp eq i8 %1, 32
  %7 = or i1 %5, %6
  br label %13

8:                                                ; preds = %2
  %9 = icmp ult i8 %0, 17
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = add i8 %1, -2
  %12 = icmp ult i8 %11, 39
  br label %13

13:                                               ; preds = %10, %8, %4
  %14 = phi i1 [ %7, %4 ], [ %12, %10 ], [ false, %8 ]
  %15 = zext i1 %14 to i8
  ret i8 %15
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i32 @llb_bech32_polymod_step(i32 noundef %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = shl i32 %0, 5
  %4 = and i32 %3, 1073741792
  %5 = zext i8 %1 to i32
  %6 = xor i32 %4, %5
  %7 = and i32 %0, 33554432
  %8 = icmp eq i32 %7, 0
  %9 = xor i32 %6, 996825010
  %10 = select i1 %8, i32 %6, i32 %9
  %11 = and i32 %0, 67108864
  %12 = icmp eq i32 %11, 0
  %13 = xor i32 %10, 642813549
  %14 = select i1 %12, i32 %10, i32 %13
  %15 = and i32 %0, 134217728
  %16 = icmp eq i32 %15, 0
  %17 = xor i32 %14, 513874426
  %18 = select i1 %16, i32 %14, i32 %17
  %19 = and i32 %0, 268435456
  %20 = icmp eq i32 %19, 0
  %21 = xor i32 %18, 1027748829
  %22 = select i1 %20, i32 %18, i32 %21
  %23 = and i32 %0, 536870912
  %24 = icmp eq i32 %23, 0
  %25 = xor i32 %22, 705979059
  %26 = select i1 %24, i32 %22, i32 %25
  ret i32 %26
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_minimal_push_opcode_ok(i8 noundef zeroext %0, i8 noundef zeroext %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = zext i8 %0 to i32
  switch i8 %0, label %11 [
    i8 0, label %5
    i8 79, label %7
  ]

5:                                                ; preds = %3
  %6 = icmp eq i32 %2, 0
  br label %41

7:                                                ; preds = %3
  %8 = icmp eq i32 %2, 1
  %9 = icmp eq i8 %1, -127
  %10 = and i1 %9, %8
  br label %41

11:                                               ; preds = %3
  %12 = add i8 %0, -81
  %13 = icmp ult i8 %12, 16
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = icmp eq i32 %2, 1
  %16 = add nsw i8 %0, -80
  %17 = icmp eq i8 %16, %1
  %18 = select i1 %15, i1 %17, i1 false
  br label %41

19:                                               ; preds = %11
  %20 = icmp eq i8 %0, 1
  br i1 %20, label %21, label %28

21:                                               ; preds = %19
  %22 = icmp eq i32 %2, 1
  br i1 %22, label %23, label %41

23:                                               ; preds = %21
  %24 = add i8 %1, -17
  %25 = icmp ult i8 %24, -16
  %26 = icmp ne i8 %1, -127
  %27 = and i1 %26, %25
  br label %41

28:                                               ; preds = %19
  %29 = icmp ult i8 %0, 76
  br i1 %29, label %30, label %32

30:                                               ; preds = %28
  %31 = icmp eq i32 %4, %2
  br label %41

32:                                               ; preds = %28
  switch i8 %0, label %41 [
    i8 76, label %33
    i8 77, label %36
    i8 78, label %39
  ]

33:                                               ; preds = %32
  %34 = add i32 %2, -76
  %35 = icmp ult i32 %34, 180
  br label %41

36:                                               ; preds = %32
  %37 = add i32 %2, -256
  %38 = icmp ult i32 %37, 65280
  br label %41

39:                                               ; preds = %32
  %40 = icmp ugt i32 %2, 65535
  br label %41

41:                                               ; preds = %39, %36, %33, %32, %30, %23, %21, %14, %7, %5
  %42 = phi i1 [ %6, %5 ], [ %10, %7 ], [ %18, %14 ], [ %31, %30 ], [ %35, %33 ], [ %38, %36 ], [ %40, %39 ], [ false, %21 ], [ %27, %23 ], [ false, %32 ]
  %43 = zext i1 %42 to i8
  ret i8 %43
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_sighash_type_valid(i32 noundef %0) local_unnamed_addr #1 {
  %2 = and i32 %0, 127
  %3 = icmp ult i32 %0, 256
  %4 = add nsw i32 %2, -1
  %5 = icmp ult i32 %4, 3
  %spec.select = and i1 %3, %5
  %6 = zext i1 %spec.select to i8
  ret i8 %6
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_taproot_sighash_valid(i8 noundef zeroext %0) local_unnamed_addr #1 {
  %2 = icmp eq i8 %0, 0
  %3 = and i8 %0, 127
  %4 = add nsw i8 %3, -1
  %5 = icmp ult i8 %4, 3
  %6 = select i1 %2, i1 true, i1 %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_merkle_depth_index_ok(i32 noundef %0, i32 noundef %1, i8 noundef zeroext %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %0, 0
  br i1 %4, label %10, label %5

5:                                                ; preds = %3
  %6 = icmp ult i32 %1, %0
  %7 = icmp sgt i32 %1, -1
  %8 = and i1 %6, %7
  %9 = icmp ult i8 %2, 33
  %spec.select = and i1 %8, %9
  br label %10

10:                                               ; preds = %5, %3
  %11 = phi i1 [ false, %3 ], [ %spec.select, %5 ]
  %12 = zext i1 %11 to i8
  ret i8 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i16 @llb_bolos_sw_for_error(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp ult i8 %0, 19
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = zext nneg i8 %0 to i32
  %5 = getelementptr inbounds [19 x i16], ptr @switch.table.llb_bolos_sw_for_error, i32 0, i32 %4
  %6 = load i16, ptr %5, align 2
  br label %7

7:                                                ; preds = %3, %1
  %8 = phi i16 [ %6, %3 ], [ -20473, %1 ]
  ret i16 %8
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_merkle_advance_state(i64 noundef %0) local_unnamed_addr #1 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %0 to i32
  %5 = icmp ult i32 %3, 2
  br i1 %5, label %33, label %6

6:                                                ; preds = %1
  %7 = add i32 %3, -1
  %8 = lshr i32 %7, 1
  %9 = or i32 %8, %7
  %10 = lshr i32 %9, 2
  %11 = or i32 %10, %9
  %12 = lshr i32 %11, 4
  %13 = or i32 %12, %11
  %14 = lshr i32 %13, 8
  %15 = or i32 %14, %13
  %16 = lshr i32 %15, 17
  %17 = lshr i32 %15, 1
  %18 = or i32 %16, %17
  %19 = add nuw i32 %18, 1
  %20 = icmp ult i32 %18, %4
  br i1 %20, label %26, label %21

21:                                               ; preds = %6
  %22 = zext i32 %19 to i64
  %23 = shl nuw i64 %22, 32
  %24 = and i64 %0, 4294967295
  %25 = or disjoint i64 %23, %24
  br label %33

26:                                               ; preds = %6
  %27 = sub i32 %3, %19
  %28 = zext i32 %27 to i64
  %29 = shl nuw i64 %28, 32
  %30 = sub i32 %4, %19
  %31 = zext i32 %30 to i64
  %32 = or disjoint i64 %29, %31
  br label %33

33:                                               ; preds = %26, %21, %1
  %34 = phi i64 [ %25, %21 ], [ %32, %26 ], [ %0, %1 ]
  ret i64 %34
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_merkle_state_dir(i64 noundef %0) local_unnamed_addr #0 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %0 to i32
  %5 = icmp ugt i32 %3, 1
  %6 = icmp ult i32 %4, %3
  %7 = and i1 %5, %6
  br i1 %7, label %8, label %23

8:                                                ; preds = %1
  %9 = add i32 %3, -1
  %10 = lshr i32 %9, 1
  %11 = or i32 %10, %9
  %12 = lshr i32 %11, 2
  %13 = or i32 %12, %11
  %14 = lshr i32 %13, 4
  %15 = or i32 %14, %13
  %16 = lshr i32 %15, 8
  %17 = or i32 %16, %15
  %18 = lshr i32 %17, 17
  %19 = lshr i32 %17, 1
  %20 = or i32 %18, %19
  %21 = icmp ult i32 %20, %4
  %22 = zext i1 %21 to i8
  br label %23

23:                                               ; preds = %8, %1
  %24 = phi i8 [ %22, %8 ], [ -1, %1 ]
  ret i8 %24
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i8 noundef zeroext %4, i32 noundef %5, i8 noundef zeroext %6) local_unnamed_addr #0 {
  %8 = icmp eq i8 %4, 2
  br i1 %8, label %9, label %13

9:                                                ; preds = %7
  %10 = icmp eq i32 %0, -2142942139
  %11 = icmp eq i32 %1, -1035385550
  %12 = and i1 %10, %11
  br label %36

13:                                               ; preds = %7
  %14 = icmp ult i8 %4, 3
  %15 = icmp eq i8 %6, 0
  %or.cond = or i1 %14, %15
  %16 = and i32 %1, %0
  %17 = and i32 %16, %2
  %18 = icmp sgt i32 %17, -1
  %or.cond3 = or i1 %18, %or.cond
  br i1 %or.cond3, label %36, label %19

19:                                               ; preds = %13
  %20 = and i32 %0, 2147483647
  %21 = and i32 %1, 2147483647
  %22 = icmp ne i32 %21, %5
  %23 = and i32 %2, 2147483647
  %24 = icmp ugt i32 %23, 100
  %or.cond5 = or i1 %24, %22
  br i1 %or.cond5, label %36, label %25

25:                                               ; preds = %19
  %26 = tail call zeroext i8 @llb_bip32_standard_purpose_ok(i32 noundef %0) #8, !range !3
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %36

28:                                               ; preds = %25
  %29 = icmp ne i32 %20, 48
  %30 = icmp eq i8 %4, 3
  %or.cond6 = or i1 %29, %30
  %31 = icmp sgt i32 %3, -1
  %or.cond7 = or i1 %31, %or.cond6
  br i1 %or.cond7, label %36, label %32

32:                                               ; preds = %28
  %33 = and i32 %3, 2147483647
  %34 = add nsw i32 %33, -1
  %35 = icmp ult i32 %34, 2
  br label %36

36:                                               ; preds = %32, %28, %25, %19, %13, %9
  %37 = phi i1 [ %12, %9 ], [ %35, %32 ], [ false, %13 ], [ false, %19 ], [ true, %25 ], [ false, %28 ]
  %38 = zext i1 %37 to i8
  ret i8 %38
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i32 @llb_bech32_final_constant(i8 noundef zeroext %0) local_unnamed_addr #1 {
  %2 = icmp eq i8 %0, 2
  %3 = select i1 %2, i32 734539939, i32 0
  %4 = icmp eq i8 %0, 1
  %5 = select i1 %4, i32 1, i32 %3
  ret i32 %5
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_wallet_name_char_ok(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #1 {
  %3 = icmp eq i8 %1, 0
  %4 = select i1 %3, i32 32, i32 33
  %5 = zext i8 %0 to i32
  %6 = icmp ule i32 %4, %5
  %7 = icmp ult i8 %0, 127
  %8 = and i1 %7, %6
  %9 = zext i1 %8 to i8
  ret i8 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_sats_div_1e8(i64 noundef %0) local_unnamed_addr #0 {
  %2 = trunc i64 %0 to i32
  %3 = lshr i64 %0, 32
  %4 = trunc i64 %3 to i32
  %5 = and i32 %2, 65535
  %6 = lshr i32 %2, 16
  %7 = mul nuw i32 %5, 52989
  %8 = zext i32 %7 to i64
  %9 = mul nuw i32 %5, 33889
  %10 = zext i32 %9 to i64
  %11 = mul nuw i32 %6, 52989
  %12 = zext i32 %11 to i64
  %13 = mul nuw i32 %6, 33889
  %14 = add nuw nsw i64 %10, %12
  %15 = shl nuw nsw i64 %14, 16
  %16 = add nuw nsw i64 %15, %8
  %17 = mul nuw nsw i32 %5, 30481
  %18 = zext nneg i32 %17 to i64
  %19 = mul nuw i32 %5, 43980
  %20 = zext i32 %19 to i64
  %21 = mul nuw nsw i32 %6, 30481
  %22 = zext nneg i32 %21 to i64
  %23 = mul nuw i32 %6, 43980
  %24 = add nuw nsw i64 %20, %22
  %25 = shl nuw nsw i64 %24, 16
  %26 = add nuw nsw i64 %25, %18
  %27 = and i32 %4, 65535
  %28 = lshr i32 %4, 16
  %29 = mul nuw i32 %27, 52989
  %30 = zext i32 %29 to i64
  %31 = mul nuw i32 %27, 33889
  %32 = zext i32 %31 to i64
  %33 = mul nuw i32 %28, 52989
  %34 = zext i32 %33 to i64
  %35 = mul nuw i32 %28, 33889
  %36 = add nuw nsw i64 %32, %34
  %37 = shl nuw nsw i64 %36, 16
  %38 = add nuw nsw i64 %37, %30
  %39 = mul nuw nsw i32 %27, 30481
  %40 = zext nneg i32 %39 to i64
  %41 = mul nuw i32 %27, 43980
  %42 = zext i32 %41 to i64
  %43 = mul nuw nsw i32 %28, 30481
  %44 = zext nneg i32 %43 to i64
  %45 = mul nuw i32 %28, 43980
  %46 = zext i32 %45 to i64
  %47 = add nuw nsw i64 %42, %44
  %48 = shl nuw nsw i64 %47, 16
  %49 = shl nuw i64 %46, 32
  %50 = lshr i64 %16, 32
  %51 = trunc i64 %50 to i32
  %52 = add nuw i32 %13, %51
  %53 = zext i32 %52 to i64
  %54 = and i64 %26, 4294967295
  %55 = and i64 %38, 4294967295
  %56 = add nuw nsw i64 %55, %54
  %57 = add nuw nsw i64 %56, %53
  %58 = lshr i64 %26, 32
  %59 = trunc i64 %58 to i32
  %60 = add nuw i32 %23, %59
  %61 = zext i32 %60 to i64
  %62 = lshr i64 %38, 32
  %63 = trunc i64 %62 to i32
  %64 = add nuw i32 %35, %63
  %65 = zext i32 %64 to i64
  %66 = lshr i64 %57, 32
  %67 = or disjoint i64 %49, %40
  %68 = add nuw i64 %67, %48
  %69 = add nuw i64 %68, %61
  %70 = add nuw i64 %69, %65
  %71 = add nuw i64 %70, %66
  %72 = lshr i64 %71, 26
  ret i64 %72
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i32 @llb_sats_mod_1e8(i64 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @llb_sats_div_1e8(i64 noundef %0) #8, !range !4
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %0 to i32
  %5 = mul i32 %3, -100000000
  %6 = add i32 %5, %4
  ret i32 %6
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_older_ok(i32 noundef %0) local_unnamed_addr #1 {
  %2 = and i32 %0, -4259840
  %3 = icmp eq i32 %2, 0
  %4 = and i32 %0, 65535
  %5 = icmp ne i32 %4, 0
  %6 = and i1 %3, %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_after_ok(i32 noundef %0) local_unnamed_addr #1 {
  %2 = icmp sgt i32 %0, 0
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_andor_branches_valid(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) local_unnamed_addr #1 {
  %4 = icmp eq i8 %0, 100
  %5 = icmp eq i8 %1, 103
  %6 = and i1 %4, %5
  %7 = icmp eq i8 %2, 104
  %spec.select = and i1 %6, %7
  %8 = zext i1 %spec.select to i8
  ret i8 %8
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden noundef zeroext i8 @llb_miniscript_check_postfix(ptr noundef readonly %0, i32 noundef %1, i8 noundef zeroext %2, i8 noundef zeroext %3, ptr noundef %4) local_unnamed_addr #3 {
  %6 = icmp eq ptr %0, null
  %7 = icmp eq ptr %4, null
  %or.cond = or i1 %6, %7
  %8 = add i32 %1, -513
  %9 = icmp ult i32 %8, -512
  %or.cond2 = or i1 %9, %or.cond
  br i1 %or.cond2, label %.loopexit, label %10

10:                                               ; preds = %5
  %11 = icmp eq i8 %2, 0
  %12 = select i1 %11, i16 56, i16 120
  %.not = xor i1 %11, true
  br label %13

13:                                               ; preds = %.backedge, %10
  %14 = phi i32 [ 0, %10 ], [ %.be, %.backedge ]
  %15 = phi i32 [ 0, %10 ], [ %.be166, %.backedge ]
  %16 = phi i8 [ 0, %10 ], [ %.be167, %.backedge ]
  %17 = phi i32 [ 0, %10 ], [ %.be168, %.backedge ]
  %18 = phi i32 [ 0, %10 ], [ %22, %.backedge ]
  %19 = phi i32 [ 0, %10 ], [ %.be170, %.backedge ]
  %20 = icmp eq i32 %18, %1
  br i1 %20, label %1078, label %21

21:                                               ; preds = %13
  %22 = add nuw nsw i32 %18, 1
  %23 = getelementptr inbounds i8, ptr %0, i32 %18
  %24 = load i8, ptr %23, align 1, !tbaa !5
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %230, label %26

26:                                               ; preds = %21
  %27 = zext i8 %24 to i32
  %28 = shl i32 %14, 3
  %29 = shl i32 %27, %28
  %30 = or i32 %29, %15
  %31 = add i32 %14, 1
  %32 = add nsw i32 %17, -1
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %.backedge

34:                                               ; preds = %26
  switch i8 %16, label %63 [
    i8 6, label %35
    i8 7, label %52
  ]

35:                                               ; preds = %34
  %36 = and i32 %30, -4259840
  %37 = icmp ne i32 %36, 0
  %38 = and i32 %30, 65535
  %39 = icmp eq i32 %38, 0
  %40 = or i1 %37, %39
  %41 = icmp ugt i32 %19, 63
  %or.cond3 = select i1 %40, i1 true, i1 %41
  br i1 %or.cond3, label %.loopexit, label %42

42:                                               ; preds = %35
  %43 = lshr i32 %30, 22
  %44 = trunc i32 %43 to i8
  %45 = add nuw nsw i32 %19, 1
  %46 = mul nuw nsw i8 %44, 24
  %47 = shl nuw nsw i32 %19, 1
  %48 = getelementptr inbounds i8, ptr %4, i32 %47
  store i8 4, ptr %48, align 1, !tbaa !5
  %49 = xor i8 %46, -107
  %50 = or disjoint i32 %47, 1
  %51 = getelementptr inbounds i8, ptr %4, i32 %50
  store i8 %49, ptr %51, align 1, !tbaa !5
  br label %.backedge

52:                                               ; preds = %34
  %53 = icmp slt i32 %30, 1
  %54 = icmp ugt i32 %19, 63
  %or.cond4 = select i1 %53, i1 true, i1 %54
  br i1 %or.cond4, label %.loopexit, label %55

55:                                               ; preds = %52
  %56 = icmp ult i32 %30, 500000000
  %57 = add nuw nsw i32 %19, 1
  %58 = shl nuw nsw i32 %19, 1
  %59 = getelementptr inbounds i8, ptr %4, i32 %58
  store i8 4, ptr %59, align 1, !tbaa !5
  %60 = select i1 %56, i8 -59, i8 -91
  %61 = or disjoint i32 %58, 1
  %62 = getelementptr inbounds i8, ptr %4, i32 %61
  store i8 %60, ptr %62, align 1, !tbaa !5
  br label %.backedge

63:                                               ; preds = %34
  %64 = and i32 %30, 65535
  %65 = lshr i32 %30, 16
  switch i8 %16, label %88 [
    i8 12, label %66
    i8 13, label %77
  ]

66:                                               ; preds = %63
  %67 = icmp eq i32 %64, 0
  %or.cond5 = select i1 %.not, i1 true, i1 %67
  %68 = icmp ugt i32 %64, %65
  %or.cond6 = select i1 %or.cond5, i1 true, i1 %68
  %69 = icmp ugt i32 %30, 1376255
  %or.cond7 = select i1 %or.cond6, i1 true, i1 %69
  %70 = icmp ugt i32 %19, 63
  %or.cond8 = select i1 %or.cond7, i1 true, i1 %70
  br i1 %or.cond8, label %.loopexit, label %71

71:                                               ; preds = %66
  %72 = add nuw nsw i32 %19, 1
  %73 = shl nuw nsw i32 %19, 1
  %74 = getelementptr inbounds i8, ptr %4, i32 %73
  store i8 -16, ptr %74, align 1, !tbaa !5
  %75 = or disjoint i32 %73, 1
  %76 = getelementptr inbounds i8, ptr %4, i32 %75
  store i8 -122, ptr %76, align 1, !tbaa !5
  br label %.backedge

77:                                               ; preds = %63
  %78 = icmp eq i32 %64, 0
  %or.cond9 = select i1 %11, i1 true, i1 %78
  %79 = icmp ugt i32 %64, %65
  %or.cond10 = select i1 %or.cond9, i1 true, i1 %79
  %80 = icmp ugt i32 %30, 65535999
  %or.cond11 = select i1 %or.cond10, i1 true, i1 %80
  %81 = icmp ugt i32 %19, 63
  %or.cond12 = select i1 %or.cond11, i1 true, i1 %81
  br i1 %or.cond12, label %.loopexit, label %82

82:                                               ; preds = %77
  %83 = add nuw nsw i32 %19, 1
  %84 = shl nuw nsw i32 %19, 1
  %85 = getelementptr inbounds i8, ptr %4, i32 %84
  store i8 -32, ptr %85, align 1, !tbaa !5
  %86 = or disjoint i32 %84, 1
  %87 = getelementptr inbounds i8, ptr %4, i32 %86
  store i8 -122, ptr %87, align 1, !tbaa !5
  br label %.backedge

88:                                               ; preds = %63
  %89 = add nsw i32 %64, -1
  %or.cond13 = icmp uge i32 %89, %65
  %90 = icmp ugt i32 %30, 4259839
  %or.cond14 = or i1 %90, %or.cond13
  %91 = icmp ult i32 %19, %65
  %or.cond15 = select i1 %or.cond14, i1 true, i1 %91
  br i1 %or.cond15, label %.loopexit, label %92

92:                                               ; preds = %88
  %93 = sub i32 %19, %65
  %94 = icmp eq i32 %64, 1
  br label %95

95:                                               ; preds = %166, %92
  %96 = phi i32 [ 0, %92 ], [ %133, %166 ]
  %97 = phi i32 [ 0, %92 ], [ %136, %166 ]
  %98 = phi i32 [ 0, %92 ], [ %140, %166 ]
  %99 = phi i32 [ 0, %92 ], [ %144, %166 ]
  %100 = phi i16 [ 0, %92 ], [ %172, %166 ]
  %101 = phi i16 [ 0, %92 ], [ %175, %166 ]
  %102 = phi i16 [ 0, %92 ], [ %178, %166 ]
  %103 = phi i16 [ 0, %92 ], [ %181, %166 ]
  %104 = phi i16 [ 0, %92 ], [ %169, %166 ]
  %105 = phi i32 [ 0, %92 ], [ %182, %166 ]
  %106 = phi i32 [ 0, %92 ], [ %129, %166 ]
  %107 = icmp eq i32 %105, %65
  br i1 %107, label %183, label %108

108:                                              ; preds = %95
  %109 = add i32 %105, %93
  %110 = shl i32 %109, 1
  %111 = getelementptr inbounds i8, ptr %4, i32 %110
  %112 = load i8, ptr %111, align 1, !tbaa !5
  %113 = zext i8 %112 to i16
  %114 = icmp eq i32 %105, 0
  %115 = and i16 %113, 3
  %116 = zext nneg i16 %115 to i32
  %117 = select i1 %114, i32 0, i32 3
  %118 = icmp eq i32 %117, %116
  br i1 %118, label %119, label %.loopexit

119:                                              ; preds = %108
  %120 = or disjoint i32 %110, 1
  %121 = getelementptr inbounds i8, ptr %4, i32 %120
  %122 = load i8, ptr %121, align 1, !tbaa !5
  %123 = zext i8 %122 to i16
  %124 = and i16 %113, 96
  %or.cond17.not = icmp eq i16 %124, 96
  br i1 %or.cond17.not, label %125, label %.loopexit

125:                                              ; preds = %119
  %126 = lshr i16 %113, 2
  %127 = and i16 %126, 1
  %128 = zext nneg i16 %127 to i32
  %129 = add i32 %106, %128
  %130 = lshr i16 %113, 3
  %131 = and i16 %130, 1
  %132 = zext nneg i16 %131 to i32
  %133 = add i32 %96, %132
  %134 = icmp sgt i8 %112, -1
  %135 = zext i1 %134 to i32
  %136 = add i32 %97, %135
  %137 = lshr i16 %123, 1
  %138 = and i16 %137, 1
  %139 = zext nneg i16 %138 to i32
  %140 = add i32 %98, %139
  %141 = lshr i16 %123, 2
  %142 = and i16 %141, 1
  %143 = zext nneg i16 %142 to i32
  %144 = add i32 %99, %143
  br i1 %94, label %166, label %145

145:                                              ; preds = %125
  %146 = and i16 %123, 8
  %147 = icmp ne i16 %146, 0
  %148 = icmp ne i16 %101, 0
  %149 = select i1 %147, i1 %148, i1 false
  br i1 %149, label %165, label %150

150:                                              ; preds = %145
  %151 = and i16 %123, 16
  %152 = icmp ne i16 %151, 0
  %153 = icmp ne i16 %100, 0
  %154 = select i1 %152, i1 %153, i1 false
  br i1 %154, label %165, label %155

155:                                              ; preds = %150
  %156 = and i16 %123, 32
  %157 = icmp ne i16 %156, 0
  %158 = icmp ne i16 %103, 0
  %159 = select i1 %157, i1 %158, i1 false
  br i1 %159, label %165, label %160

160:                                              ; preds = %155
  %161 = and i16 %123, 64
  %162 = icmp ne i16 %161, 0
  %163 = icmp ne i16 %102, 0
  %164 = select i1 %162, i1 %163, i1 false
  br i1 %164, label %165, label %166

165:                                              ; preds = %160, %155, %150, %145
  br label %166

166:                                              ; preds = %165, %160, %125
  %167 = phi i16 [ 1, %165 ], [ %104, %160 ], [ %104, %125 ]
  %168 = icmp sgt i8 %122, -1
  %169 = select i1 %168, i16 1, i16 %167
  %170 = lshr i16 %123, 3
  %171 = and i16 %170, 1
  %172 = or i16 %171, %100
  %173 = lshr i16 %123, 4
  %174 = and i16 %173, 1
  %175 = or i16 %174, %101
  %176 = lshr i16 %123, 5
  %177 = and i16 %176, 1
  %178 = or i16 %177, %102
  %179 = lshr i16 %123, 6
  %180 = and i16 %179, 1
  %181 = or i16 %180, %103
  %182 = add nuw nsw i32 %105, 1
  br label %95

183:                                              ; preds = %95
  %184 = icmp eq i32 %106, %65
  %185 = add nsw i32 %65, -1
  %186 = icmp eq i32 %106, %185
  %187 = icmp eq i32 %96, 1
  %188 = select i1 %186, i1 %187, i1 false
  %189 = icmp ugt i32 %97, %89
  %190 = icmp eq i32 %98, %65
  %191 = icmp eq i32 %97, 0
  %192 = select i1 %190, i1 %191, i1 false
  %193 = icmp eq i32 %99, %65
  %194 = select i1 %190, i1 %193, i1 false
  %195 = icmp ugt i32 %97, %64
  %196 = select i1 %195, i16 0, i16 1024
  %197 = select i1 %194, i16 %196, i16 0
  %198 = icmp eq i16 %104, 0
  %199 = select i1 %184, i16 4, i16 0
  %200 = select i1 %188, i16 8, i16 0
  %201 = select i1 %192, i16 512, i16 0
  %202 = shl nuw nsw i16 %100, 11
  %203 = and i16 %202, 2048
  %204 = shl nuw nsw i16 %101, 12
  %205 = and i16 %204, 4096
  %206 = shl nuw nsw i16 %102, 13
  %207 = and i16 %206, 8192
  %208 = shl nuw nsw i16 %103, 14
  %209 = select i1 %198, i16 -32768, i16 0
  %210 = select i1 %189, i16 96, i16 224
  %211 = or disjoint i16 %201, %210
  %212 = or disjoint i16 %211, %197
  %213 = or disjoint i16 %212, %203
  %214 = or disjoint i16 %213, %205
  %215 = or disjoint i16 %214, %207
  %216 = or disjoint i16 %215, %208
  %217 = or i16 %216, %209
  %218 = or disjoint i16 %199, %200
  %219 = or i16 %218, %217
  %220 = icmp eq i16 %219, -1
  br i1 %220, label %.loopexit, label %221

221:                                              ; preds = %183
  %222 = add i32 %93, 1
  %223 = trunc i16 %219 to i8
  %224 = shl i32 %93, 1
  %225 = getelementptr inbounds i8, ptr %4, i32 %224
  store i8 %223, ptr %225, align 1, !tbaa !5
  %226 = lshr i16 %217, 8
  %227 = trunc i16 %226 to i8
  %228 = or disjoint i32 %224, 1
  %229 = getelementptr inbounds i8, ptr %4, i32 %228
  store i8 %227, ptr %229, align 1, !tbaa !5
  br label %.backedge

230:                                              ; preds = %21
  %231 = icmp ult i8 %24, 6
  br i1 %231, label %232, label %250

232:                                              ; preds = %230
  %233 = icmp ult i32 %19, 64
  br i1 %233, label %234, label %.loopexit

234:                                              ; preds = %232
  %235 = icmp eq i8 %24, 5
  br i1 %235, label %242, label %236

236:                                              ; preds = %234
  %237 = zext nneg i8 %24 to i32
  %238 = getelementptr inbounds [5 x i8], ptr @switch.table.llb_miniscript_check_postfix, i32 0, i32 %237
  %239 = load i8, ptr %238, align 1
  %240 = getelementptr inbounds [5 x i8], ptr @switch.table.llb_miniscript_check_postfix.1, i32 0, i32 %237
  %241 = load i8, ptr %240, align 1
  br label %242

242:                                              ; preds = %236, %234
  %243 = phi i8 [ %239, %236 ], [ -16, %234 ]
  %244 = phi i8 [ %241, %236 ], [ -122, %234 ]
  %245 = add nuw nsw i32 %19, 1
  %246 = shl nuw nsw i32 %19, 1
  %247 = getelementptr inbounds i8, ptr %4, i32 %246
  store i8 %243, ptr %247, align 1, !tbaa !5
  %248 = or disjoint i32 %246, 1
  %249 = getelementptr inbounds i8, ptr %4, i32 %248
  store i8 %244, ptr %249, align 1, !tbaa !5
  br label %.backedge

250:                                              ; preds = %230
  switch i8 %24, label %251 [
    i8 6, label %.backedge
    i8 7, label %.backedge
    i8 12, label %.backedge
    i8 13, label %.backedge
    i8 40, label %.backedge
  ]

251:                                              ; preds = %250
  %252 = icmp ult i8 %24, 12
  br i1 %252, label %253, label %261

253:                                              ; preds = %251
  %254 = icmp ugt i32 %19, 63
  br i1 %254, label %.loopexit, label %255

255:                                              ; preds = %253
  %256 = add nuw nsw i32 %19, 1
  %257 = shl nuw nsw i32 %19, 1
  %258 = getelementptr inbounds i8, ptr %4, i32 %257
  store i8 120, ptr %258, align 1, !tbaa !5
  %259 = or disjoint i32 %257, 1
  %260 = getelementptr inbounds i8, ptr %4, i32 %259
  store i8 -124, ptr %260, align 1, !tbaa !5
  br label %.backedge

261:                                              ; preds = %251
  %262 = add i8 %24, -16
  %263 = icmp ult i8 %262, 10
  br i1 %263, label %264, label %514

264:                                              ; preds = %261
  %265 = icmp eq i32 %19, 0
  br i1 %265, label %.loopexit, label %266

266:                                              ; preds = %264
  %267 = shl i32 %19, 1
  %268 = add i32 %267, -2
  %269 = getelementptr inbounds i8, ptr %4, i32 %268
  %270 = load i8, ptr %269, align 1, !tbaa !5
  %271 = zext i8 %270 to i16
  %272 = or disjoint i32 %268, 1
  %273 = getelementptr inbounds i8, ptr %4, i32 %272
  %274 = load i8, ptr %273, align 1, !tbaa !5
  %275 = zext i8 %274 to i16
  %276 = and i16 %271, 3
  %277 = lshr i16 %271, 2
  %278 = and i16 %277, 1
  %279 = lshr i16 %271, 3
  %280 = and i16 %279, 1
  %281 = lshr i16 %271, 4
  %282 = and i16 %281, 1
  %283 = lshr i16 %271, 5
  %284 = and i16 %283, 1
  %285 = lshr i16 %271, 6
  %286 = and i16 %285, 1
  %287 = and i16 %271, 128
  %288 = and i16 %275, 1
  %289 = lshr i16 %275, 1
  %290 = and i16 %289, 1
  %291 = lshr i16 %275, 2
  %292 = and i16 %291, 1
  %293 = lshr i16 %275, 3
  %294 = and i16 %293, 1
  %295 = lshr i16 %275, 4
  %296 = and i16 %295, 1
  %297 = lshr i16 %275, 5
  %298 = and i16 %297, 1
  %299 = lshr i16 %275, 6
  %300 = and i16 %299, 1
  %301 = sext i8 %274 to i16
  %302 = and i16 %301, -32768
  switch i8 %24, label %.loopexit [
    i8 16, label %303
    i8 17, label %326
    i8 18, label %351
    i8 19, label %375
    i8 20, label %396
    i8 21, label %415
    i8 22, label %436
    i8 23, label %459
    i8 24, label %486
    i8 25, label %486
  ]

303:                                              ; preds = %266
  %304 = icmp eq i16 %276, 0
  br i1 %304, label %305, label %.loopexit

305:                                              ; preds = %303
  %306 = shl nuw nsw i16 %284, 5
  %307 = shl nuw nsw i16 %286, 6
  %308 = or disjoint i16 %306, %307
  %309 = shl nuw nsw i16 %288, 8
  %310 = or disjoint i16 %308, %309
  %311 = shl nuw nsw i16 %290, 9
  %312 = or disjoint i16 %310, %311
  %313 = shl nuw nsw i16 %292, 10
  %314 = or disjoint i16 %312, %313
  %315 = or disjoint i16 %314, %287
  %316 = shl nuw nsw i16 %294, 11
  %317 = shl nuw nsw i16 %296, 12
  %318 = shl nuw nsw i16 %298, 13
  %319 = shl nuw nsw i16 %300, 14
  %320 = or disjoint i16 %316, %317
  %321 = or disjoint i16 %320, %318
  %322 = or disjoint i16 %321, %319
  %323 = or i16 %322, %315
  %324 = or i16 %323, %302
  %325 = or i16 %324, 3
  br label %507

326:                                              ; preds = %266
  %327 = icmp eq i16 %276, 0
  %328 = icmp ne i16 %280, 0
  %329 = and i1 %327, %328
  br i1 %329, label %330, label %.loopexit

330:                                              ; preds = %326
  %331 = shl nuw nsw i16 %284, 5
  %332 = shl nuw nsw i16 %286, 6
  %333 = or disjoint i16 %331, %332
  %334 = shl nuw nsw i16 %288, 8
  %335 = or disjoint i16 %333, %334
  %336 = shl nuw nsw i16 %290, 9
  %337 = or disjoint i16 %335, %336
  %338 = shl nuw nsw i16 %292, 10
  %339 = or disjoint i16 %337, %338
  %340 = or disjoint i16 %339, %287
  %341 = shl nuw nsw i16 %294, 11
  %342 = shl nuw nsw i16 %296, 12
  %343 = shl nuw nsw i16 %298, 13
  %344 = shl nuw nsw i16 %300, 14
  %345 = or disjoint i16 %341, %342
  %346 = or disjoint i16 %345, %343
  %347 = or disjoint i16 %346, %344
  %348 = or i16 %347, %340
  %349 = or i16 %348, %302
  %350 = or i16 %349, 3
  br label %507

351:                                              ; preds = %266
  %352 = icmp eq i16 %276, 2
  br i1 %352, label %353, label %.loopexit

353:                                              ; preds = %351
  %354 = shl nuw nsw i16 %280, 3
  %355 = shl nuw nsw i16 %282, 4
  %356 = or disjoint i16 %354, %355
  %357 = shl nuw nsw i16 %284, 5
  %358 = or disjoint i16 %356, %357
  %359 = shl nuw nsw i16 %288, 8
  %360 = or disjoint i16 %358, %359
  %361 = shl nuw nsw i16 %290, 9
  %362 = or disjoint i16 %360, %361
  %363 = shl nuw nsw i16 %292, 10
  %364 = or disjoint i16 %362, %363
  %365 = shl nuw nsw i16 %294, 11
  %366 = shl nuw nsw i16 %296, 12
  %367 = shl nuw nsw i16 %298, 13
  %368 = shl nuw nsw i16 %300, 14
  %369 = or disjoint i16 %365, %366
  %370 = or disjoint i16 %369, %367
  %371 = or disjoint i16 %370, %368
  %372 = or i16 %371, %364
  %373 = or i16 %372, %302
  %374 = or i16 %373, 192
  br label %507

375:                                              ; preds = %266
  %376 = icmp eq i16 %276, 1
  br i1 %376, label %377, label %.loopexit

377:                                              ; preds = %375
  %378 = shl nuw nsw i16 %278, 2
  %379 = shl nuw nsw i16 %280, 3
  %380 = or disjoint i16 %378, %379
  %381 = shl nuw nsw i16 %282, 4
  %382 = or disjoint i16 %380, %381
  %383 = shl nuw nsw i16 %292, 10
  %384 = or disjoint i16 %382, %383
  %385 = shl nuw nsw i16 %294, 11
  %386 = or disjoint i16 %384, %385
  %387 = or disjoint i16 %386, %287
  %388 = shl nuw nsw i16 %296, 12
  %389 = shl nuw nsw i16 %298, 13
  %390 = shl nuw nsw i16 %300, 14
  %391 = or disjoint i16 %388, %389
  %392 = or disjoint i16 %391, %390
  %393 = or i16 %392, %387
  %394 = or i16 %393, %302
  %395 = or i16 %394, 320
  br label %507

396:                                              ; preds = %266
  %397 = icmp eq i16 %276, 1
  %398 = icmp ne i16 %278, 0
  %399 = and i1 %397, %398
  br i1 %399, label %400, label %.loopexit

400:                                              ; preds = %396
  %401 = shl nuw nsw i16 %288, 9
  %402 = or disjoint i16 %401, %12
  %403 = shl nuw nsw i16 %292, 10
  %404 = or disjoint i16 %402, %403
  %405 = shl nuw nsw i16 %294, 11
  %406 = or disjoint i16 %404, %405
  %407 = shl nuw nsw i16 %296, 12
  %408 = or disjoint i16 %406, %407
  %409 = shl nuw nsw i16 %298, 13
  %410 = shl nuw nsw i16 %300, 14
  %411 = or disjoint i16 %409, %410
  %412 = or disjoint i16 %408, %411
  %413 = or disjoint i16 %412, %287
  %414 = or i16 %413, %302
  br label %507

415:                                              ; preds = %266
  %416 = icmp eq i16 %276, 0
  br i1 %416, label %417, label %.loopexit

417:                                              ; preds = %415
  %418 = shl nuw nsw i16 %278, 2
  %419 = shl nuw nsw i16 %280, 3
  %420 = or disjoint i16 %418, %419
  %421 = shl nuw nsw i16 %282, 4
  %422 = or disjoint i16 %420, %421
  %423 = shl nuw nsw i16 %292, 10
  %424 = or disjoint i16 %422, %423
  %425 = shl nuw nsw i16 %294, 11
  %426 = or disjoint i16 %424, %425
  %427 = or disjoint i16 %426, %287
  %428 = shl nuw nsw i16 %296, 12
  %429 = shl nuw nsw i16 %298, 13
  %430 = shl nuw nsw i16 %300, 14
  %431 = or disjoint i16 %428, %429
  %432 = or disjoint i16 %431, %430
  %433 = or i16 %432, %427
  %434 = or i16 %433, %302
  %435 = or i16 %434, 257
  br label %507

436:                                              ; preds = %266
  %437 = icmp eq i16 %276, 0
  %438 = icmp ne i16 %282, 0
  %439 = and i1 %437, %438
  br i1 %439, label %440, label %.loopexit

440:                                              ; preds = %436
  %441 = shl nuw nsw i16 %280, 3
  %442 = shl nuw nsw i16 %286, 6
  %443 = or disjoint i16 %441, %442
  %444 = shl nuw nsw i16 %288, 9
  %445 = or disjoint i16 %443, %444
  %446 = shl nuw nsw i16 %292, 10
  %447 = or disjoint i16 %445, %446
  %448 = shl nuw nsw i16 %294, 11
  %449 = or disjoint i16 %447, %448
  %450 = or disjoint i16 %449, %287
  %451 = shl nuw nsw i16 %296, 12
  %452 = shl nuw nsw i16 %298, 13
  %453 = shl nuw nsw i16 %300, 14
  %454 = or disjoint i16 %451, %452
  %455 = or disjoint i16 %454, %453
  %456 = or i16 %455, %450
  %457 = or i16 %456, %302
  %458 = or i16 %457, 48
  br label %507

459:                                              ; preds = %266
  %460 = icmp eq i16 %276, 0
  br i1 %460, label %461, label %.loopexit

461:                                              ; preds = %459
  %462 = shl nuw nsw i16 %278, 2
  %463 = shl nuw nsw i16 %280, 3
  %464 = or disjoint i16 %462, %463
  %465 = shl nuw nsw i16 %282, 4
  %466 = or disjoint i16 %464, %465
  %467 = shl nuw nsw i16 %284, 5
  %468 = or disjoint i16 %466, %467
  %469 = shl nuw nsw i16 %288, 8
  %470 = or disjoint i16 %468, %469
  %471 = shl nuw nsw i16 %290, 9
  %472 = shl nuw nsw i16 %292, 10
  %473 = shl nuw nsw i16 %294, 11
  %474 = shl nuw nsw i16 %296, 12
  %475 = shl nuw nsw i16 %298, 13
  %476 = shl nuw nsw i16 %300, 14
  %477 = or disjoint i16 %471, %472
  %478 = or disjoint i16 %477, %473
  %479 = or disjoint i16 %478, %474
  %480 = or disjoint i16 %479, %302
  %481 = or disjoint i16 %480, 64
  %482 = add nuw i16 %481, %475
  %483 = or disjoint i16 %470, %476
  %484 = or i16 %483, %482
  %485 = or i16 %484, %287
  br label %507

486:                                              ; preds = %266, %266
  %487 = icmp eq i16 %276, 0
  br i1 %487, label %488, label %.loopexit

488:                                              ; preds = %486
  %489 = shl nuw nsw i16 %278, 3
  %490 = shl nuw nsw i16 %286, 6
  %491 = or disjoint i16 %489, %490
  %492 = shl nuw nsw i16 %288, 9
  %493 = or disjoint i16 %491, %492
  %494 = shl nuw nsw i16 %292, 10
  %495 = or disjoint i16 %493, %494
  %496 = shl nuw nsw i16 %294, 11
  %497 = or disjoint i16 %495, %496
  %498 = or disjoint i16 %497, %287
  %499 = shl nuw nsw i16 %296, 12
  %500 = shl nuw nsw i16 %298, 13
  %501 = shl nuw nsw i16 %300, 14
  %502 = or disjoint i16 %499, %500
  %503 = or disjoint i16 %502, %501
  %504 = or i16 %503, %498
  %505 = or i16 %504, %302
  %506 = or i16 %505, 32
  br label %507

507:                                              ; preds = %488, %461, %440, %417, %400, %377, %353, %330, %305
  %508 = phi i16 [ %506, %488 ], [ %485, %461 ], [ %458, %440 ], [ %435, %417 ], [ %414, %400 ], [ %395, %377 ], [ %374, %353 ], [ %350, %330 ], [ %325, %305 ]
  %509 = icmp eq i16 %508, -1
  br i1 %509, label %.loopexit, label %510

510:                                              ; preds = %507
  %511 = trunc i16 %508 to i8
  store i8 %511, ptr %269, align 1, !tbaa !5
  %512 = lshr i16 %508, 8
  %513 = trunc i16 %512 to i8
  store i8 %513, ptr %273, align 1, !tbaa !5
  br label %.backedge

514:                                              ; preds = %261
  %515 = add i8 %24, -32
  %516 = icmp ult i8 %515, 7
  br i1 %516, label %517, label %935

517:                                              ; preds = %514
  %518 = icmp ult i32 %19, 2
  br i1 %518, label %.loopexit, label %519

519:                                              ; preds = %517
  %520 = shl i32 %19, 1
  %521 = add i32 %520, -4
  %522 = getelementptr inbounds i8, ptr %4, i32 %521
  %523 = load i8, ptr %522, align 1, !tbaa !5
  %524 = zext i8 %523 to i16
  %525 = or disjoint i32 %521, 1
  %526 = getelementptr inbounds i8, ptr %4, i32 %525
  %527 = load i8, ptr %526, align 1, !tbaa !5
  %528 = zext i8 %527 to i16
  %529 = shl nuw i16 %528, 8
  %530 = or disjoint i16 %529, %524
  %531 = add i32 %19, -1
  %532 = shl i32 %531, 1
  %533 = getelementptr inbounds i8, ptr %4, i32 %532
  %534 = load i8, ptr %533, align 1, !tbaa !5
  %535 = zext i8 %534 to i16
  %536 = or disjoint i32 %532, 1
  %537 = getelementptr inbounds i8, ptr %4, i32 %536
  %538 = load i8, ptr %537, align 1, !tbaa !5
  %539 = zext i8 %538 to i16
  %540 = shl nuw i16 %539, 8
  %541 = or disjoint i16 %540, %535
  %542 = and i16 %524, 3
  %543 = and i16 %535, 3
  %544 = lshr i16 %530, 2
  %545 = lshr i16 %541, 2
  %546 = lshr i16 %530, 3
  %547 = lshr i16 %541, 3
  %548 = lshr i16 %524, 4
  %549 = and i16 %548, 1
  %550 = lshr i16 %530, 5
  %551 = and i16 %550, 1
  %552 = lshr i16 %541, 5
  %553 = and i16 %552, 1
  %554 = lshr i16 %535, 6
  %555 = and i16 %554, 1
  %556 = lshr i16 %530, 7
  %557 = lshr i16 %541, 7
  %558 = lshr i16 %528, 1
  %559 = lshr i16 %539, 1
  %560 = lshr i16 %528, 2
  %561 = lshr i16 %539, 2
  %562 = lshr i16 %528, 3
  %563 = and i16 %562, 1
  %564 = lshr i16 %539, 3
  %565 = and i16 %564, 1
  %566 = or i16 %565, %563
  %567 = lshr i16 %528, 4
  %568 = and i16 %567, 1
  %569 = lshr i16 %539, 4
  %570 = and i16 %569, 1
  %571 = or i16 %570, %568
  %572 = or i16 %541, %530
  %573 = lshr i16 %572, 13
  %574 = and i16 %573, 1
  %575 = lshr i16 %528, 6
  %576 = and i16 %575, 1
  %577 = lshr i16 %539, 6
  %578 = and i16 %577, 1
  %579 = or i16 %578, %576
  %580 = and i16 %541, %530
  %581 = and i16 %580, -32768
  %582 = icmp sgt i16 %580, -1
  br i1 %582, label %599, label %583

583:                                              ; preds = %519
  %584 = icmp eq i16 %563, 0
  %585 = icmp eq i16 %570, 0
  %or.cond18 = select i1 %584, i1 true, i1 %585
  br i1 %or.cond18, label %586, label %599

586:                                              ; preds = %583
  %587 = icmp eq i16 %568, 0
  %588 = icmp eq i16 %565, 0
  %or.cond19 = select i1 %587, i1 true, i1 %588
  br i1 %or.cond19, label %589, label %599

589:                                              ; preds = %586
  %590 = and i16 %528, 32
  %591 = icmp eq i16 %590, 0
  %592 = icmp eq i16 %578, 0
  %or.cond20 = select i1 %591, i1 true, i1 %592
  br i1 %or.cond20, label %593, label %599

593:                                              ; preds = %589
  %594 = icmp eq i16 %576, 0
  br i1 %594, label %599, label %595

595:                                              ; preds = %593
  %596 = shl i16 %539, 10
  %597 = and i16 %596, -32768
  %598 = xor i16 %597, -32768
  br label %599

599:                                              ; preds = %589, %586, %583, %595, %593, %519
  %600 = phi i16 [ 0, %519 ], [ -32768, %593 ], [ %598, %595 ], [ 0, %583 ], [ 0, %586 ], [ 0, %589 ]
  switch i8 %24, label %.loopexit [
    i8 32, label %601
    i8 33, label %650
    i8 34, label %712
    i8 35, label %754
    i8 36, label %802
    i8 37, label %838
    i8 38, label %880
  ]

601:                                              ; preds = %599
  %602 = icmp ne i16 %542, 1
  %603 = icmp eq i16 %543, 3
  %or.cond21 = select i1 %602, i1 true, i1 %603
  br i1 %or.cond21, label %.loopexit, label %604

604:                                              ; preds = %601
  %605 = and i16 %524, 4
  %606 = icmp ne i16 %605, 0
  %607 = and i16 %580, 4
  %608 = and i16 %535, 8
  %609 = icmp ne i16 %608, 0
  %610 = and i1 %606, %609
  br i1 %610, label %618, label %611

611:                                              ; preds = %604
  %612 = and i16 %535, 4
  %613 = icmp ne i16 %612, 0
  %614 = and i16 %524, 8
  %615 = icmp ne i16 %614, 0
  %616 = and i1 %615, %613
  %617 = select i1 %616, i16 8, i16 0
  br label %618

618:                                              ; preds = %611, %604
  %619 = phi i16 [ %617, %611 ], [ 8, %604 ]
  %620 = icmp eq i16 %549, 0
  %621 = and i16 %535, 16
  %622 = icmp ne i16 %621, 0
  %623 = and i1 %606, %622
  %624 = select i1 %623, i16 16, i16 0
  %625 = select i1 %620, i16 %624, i16 16
  %626 = or i16 %557, %556
  %627 = or i16 %556, %539
  %628 = and i16 %580, 1024
  %629 = shl nuw nsw i16 %555, 6
  %630 = shl nuw i16 %626, 7
  %631 = and i16 %630, 128
  %632 = shl i16 %627, 8
  %633 = and i16 %632, 256
  %634 = or disjoint i16 %607, %629
  %635 = or disjoint i16 %631, %634
  %636 = or disjoint i16 %635, %633
  %637 = or disjoint i16 %636, %625
  %638 = or disjoint i16 %619, %637
  %639 = shl nuw nsw i16 %566, 11
  %640 = shl nuw nsw i16 %571, 12
  %641 = shl nuw nsw i16 %574, 13
  %642 = shl nuw nsw i16 %579, 14
  %643 = or disjoint i16 %628, %639
  %644 = or disjoint i16 %643, %640
  %645 = or disjoint i16 %644, %642
  %646 = or disjoint i16 %645, %543
  %647 = add nuw i16 %646, %641
  %648 = add nuw nsw i16 %647, %600
  %649 = or i16 %638, %648
  br label %928

650:                                              ; preds = %599
  %651 = icmp eq i16 %542, 0
  %652 = icmp eq i16 %543, 3
  %653 = and i1 %651, %652
  br i1 %653, label %654, label %.loopexit

654:                                              ; preds = %650
  %655 = and i16 %545, %544
  %656 = and i16 %544, 1
  %657 = and i16 %656, %547
  %658 = icmp eq i16 %657, 0
  %659 = and i16 %545, %546
  %660 = shl nuw i16 %659, 3
  %661 = and i16 %660, 8
  %662 = select i1 %658, i16 %661, i16 8
  %663 = icmp eq i16 %549, 0
  %664 = shl i16 %544, 4
  %665 = and i16 %535, 16
  %666 = and i16 %665, %664
  %667 = select i1 %663, i16 %666, i16 16
  %668 = and i16 %552, %550
  %669 = or i16 %557, %556
  %670 = and i16 %539, 1
  %671 = and i16 %670, %528
  %672 = icmp ne i16 %671, 0
  %673 = and i16 %530, 384
  %674 = icmp eq i16 %673, 384
  %or.cond23 = select i1 %672, i1 true, i1 %674
  %675 = and i16 %557, %539
  %676 = shl nuw i16 %675, 8
  %677 = and i16 %676, 256
  %678 = select i1 %or.cond23, i16 256, i16 %677
  %679 = and i16 %558, 1
  %680 = and i16 %679, %556
  %681 = and i16 %680, %559
  %682 = icmp eq i16 %681, 0
  %683 = shl i16 %557, 9
  %684 = and i16 %683, 512
  %685 = select i1 %682, i16 0, i16 %684
  %686 = and i16 %561, %560
  %687 = shl nuw i16 %655, 2
  %688 = and i16 %687, 4
  %689 = shl nuw i16 %668, 5
  %690 = and i16 %689, 32
  %691 = shl nuw i16 %669, 7
  %692 = and i16 %691, 128
  %693 = shl nuw i16 %686, 10
  %694 = and i16 %693, 1024
  %695 = shl nuw nsw i16 %566, 11
  %696 = shl nuw nsw i16 %571, 12
  %697 = shl nuw nsw i16 %574, 13
  %698 = shl nuw nsw i16 %579, 14
  %699 = or disjoint i16 %697, %698
  %700 = or disjoint i16 %699, %662
  %701 = or disjoint i16 %700, %667
  %702 = or disjoint i16 %701, %685
  %703 = or disjoint i16 %695, %694
  %704 = or disjoint i16 %703, %696
  %705 = or disjoint i16 %704, %690
  %706 = or disjoint i16 %705, %688
  %707 = or disjoint i16 %706, %692
  %708 = or i16 %707, 64
  %709 = add nuw nsw i16 %708, %678
  %710 = or i16 %709, %702
  %711 = or i16 %710, %600
  br label %928

712:                                              ; preds = %599
  %713 = icmp ne i16 %551, 0
  %714 = and i16 %524, 67
  %715 = icmp eq i16 %714, 64
  %716 = and i1 %715, %713
  %717 = icmp eq i16 %543, 0
  %718 = and i1 %717, %716
  br i1 %718, label %719, label %.loopexit

719:                                              ; preds = %712
  %720 = and i16 %545, %544
  %721 = and i16 %545, %546
  %722 = or i16 %557, %556
  %723 = or i16 %556, %539
  %724 = and i16 %561, %560
  %725 = and i16 %724, 1
  %726 = icmp eq i16 %725, 0
  %727 = shl i16 %558, 10
  %728 = and i16 %727, 1024
  %729 = select i1 %726, i16 0, i16 %728
  %730 = shl nuw i16 %720, 2
  %731 = and i16 %730, 4
  %732 = shl nuw i16 %721, 3
  %733 = and i16 %732, 8
  %734 = or disjoint i16 %731, %733
  %735 = shl nuw nsw i16 %555, 6
  %736 = or disjoint i16 %734, %735
  %737 = shl nuw i16 %722, 7
  %738 = and i16 %737, 128
  %739 = or disjoint i16 %736, %738
  %740 = shl i16 %723, 9
  %741 = and i16 %740, 512
  %742 = or disjoint i16 %739, %741
  %743 = or disjoint i16 %742, %729
  %744 = shl nuw nsw i16 %566, 11
  %745 = or disjoint i16 %743, %744
  %746 = shl nuw nsw i16 %571, 12
  %747 = shl nuw nsw i16 %574, 13
  %748 = shl nuw nsw i16 %579, 14
  %749 = or disjoint i16 %747, %746
  %750 = or disjoint i16 %749, %748
  %751 = or i16 %750, %745
  %752 = or i16 %751, %600
  %753 = or i16 %752, 32
  br label %928

754:                                              ; preds = %599
  %755 = icmp eq i16 %542, 0
  %756 = icmp ne i16 %551, 0
  %757 = and i1 %755, %756
  br i1 %757, label %758, label %.loopexit

758:                                              ; preds = %754
  %759 = icmp eq i16 %543, 3
  %760 = icmp ne i16 %553, 0
  %761 = and i1 %759, %760
  br i1 %761, label %762, label %.loopexit

762:                                              ; preds = %758
  %763 = and i16 %545, %544
  %764 = and i16 %544, 1
  %765 = and i16 %764, %547
  %766 = icmp eq i16 %765, 0
  %767 = and i16 %545, %546
  %768 = shl nuw i16 %767, 3
  %769 = and i16 %768, 8
  %770 = select i1 %766, i16 %769, i16 8
  %771 = and i16 %557, %556
  %772 = and i16 %559, %558
  %773 = and i16 %561, %560
  %774 = and i16 %773, 1
  %775 = and i16 %774, %558
  %776 = and i16 %775, %559
  %777 = icmp eq i16 %776, 0
  %778 = or i16 %557, %556
  %779 = shl i16 %778, 10
  %780 = and i16 %779, 1024
  %781 = select i1 %777, i16 0, i16 %780
  %782 = shl nuw i16 %763, 2
  %783 = and i16 %782, 4
  %784 = shl nuw i16 %771, 7
  %785 = and i16 %784, 128
  %786 = shl nuw i16 %772, 9
  %787 = and i16 %786, 512
  %788 = shl nuw nsw i16 %566, 11
  %789 = shl nuw nsw i16 %571, 12
  %790 = shl nuw nsw i16 %574, 13
  %791 = shl nuw nsw i16 %579, 14
  %792 = or disjoint i16 %791, %789
  %793 = or disjoint i16 %792, %787
  %794 = or disjoint i16 %793, %788
  %795 = or disjoint i16 %794, %790
  %796 = or disjoint i16 %795, %783
  %797 = or disjoint i16 %796, %785
  %798 = add nuw i16 %797, %770
  %799 = add nuw i16 %798, %781
  %800 = or i16 %581, %799
  %801 = or i16 %800, 96
  br label %928

802:                                              ; preds = %599
  %803 = and i16 %524, 99
  %804 = icmp eq i16 %803, 96
  %805 = icmp eq i16 %543, 1
  %806 = and i1 %804, %805
  br i1 %806, label %807, label %.loopexit

807:                                              ; preds = %802
  %808 = and i16 %545, %544
  %809 = and i16 %545, %546
  %810 = and i16 %557, %556
  %811 = and i16 %561, %560
  %812 = and i16 %811, 1
  %813 = and i16 %812, %558
  %814 = icmp eq i16 %813, 0
  %815 = or i16 %557, %556
  %816 = shl i16 %815, 10
  %817 = and i16 %816, 1024
  %818 = select i1 %814, i16 0, i16 %817
  %819 = shl nuw i16 %808, 2
  %820 = and i16 %819, 4
  %821 = shl nuw i16 %809, 3
  %822 = and i16 %821, 8
  %823 = shl nuw i16 %810, 7
  %824 = and i16 %823, 128
  %825 = shl nuw nsw i16 %566, 11
  %826 = shl nuw nsw i16 %571, 12
  %827 = shl nuw nsw i16 %574, 13
  %828 = or disjoint i16 %826, %825
  %829 = or disjoint i16 %828, %822
  %830 = or disjoint i16 %829, %820
  %831 = or disjoint i16 %830, %824
  %832 = add nuw nsw i16 %831, %827
  %833 = or disjoint i16 %832, %818
  %834 = shl nuw nsw i16 %579, 14
  %835 = or i16 %834, %833
  %836 = or i16 %835, %581
  %837 = or i16 %836, 257
  br label %928

838:                                              ; preds = %599
  %839 = and i16 %524, 96
  %840 = icmp eq i16 %839, 96
  %841 = and i16 %572, 3
  %842 = icmp eq i16 %841, 0
  %843 = and i1 %840, %842
  br i1 %843, label %844, label %.loopexit

844:                                              ; preds = %838
  %845 = and i16 %545, %544
  %846 = and i16 %545, %546
  %847 = and i16 %557, %556
  %848 = and i16 %561, %560
  %849 = and i16 %848, 1
  %850 = and i16 %849, %558
  %851 = icmp eq i16 %850, 0
  %852 = or i16 %557, %556
  %853 = shl i16 %852, 10
  %854 = and i16 %853, 1024
  %855 = select i1 %851, i16 0, i16 %854
  %856 = shl nuw i16 %845, 2
  %857 = and i16 %856, 4
  %858 = shl nuw i16 %846, 3
  %859 = and i16 %858, 8
  %860 = or disjoint i16 %857, %859
  %861 = shl nuw nsw i16 %553, 5
  %862 = or disjoint i16 %860, %861
  %863 = shl nuw nsw i16 %555, 6
  %864 = or disjoint i16 %862, %863
  %865 = shl nuw i16 %847, 7
  %866 = and i16 %865, 128
  %867 = or disjoint i16 %864, %866
  %868 = and i16 %540, 768
  %869 = or disjoint i16 %867, %868
  %870 = shl nuw nsw i16 %566, 11
  %871 = shl nuw nsw i16 %571, 12
  %872 = shl nuw nsw i16 %574, 13
  %873 = shl nuw nsw i16 %579, 14
  %874 = or disjoint i16 %870, %871
  %875 = or disjoint i16 %872, %874
  %876 = or disjoint i16 %875, %873
  %877 = or disjoint i16 %876, %855
  %878 = or disjoint i16 %869, %877
  %879 = or i16 %878, %581
  br label %928

880:                                              ; preds = %599
  %881 = icmp ne i16 %542, 3
  %882 = icmp eq i16 %542, %543
  %883 = and i1 %881, %882
  br i1 %883, label %884, label %.loopexit

884:                                              ; preds = %880
  %885 = and i16 %545, %544
  %886 = or i16 %552, %550
  %887 = and i16 %557, %556
  %888 = and i16 %539, %528
  %889 = and i16 %558, 1
  %890 = and i16 %889, %539
  %891 = icmp eq i16 %890, 0
  %892 = and i16 %559, %528
  %893 = shl nuw i16 %892, 9
  %894 = and i16 %893, 512
  %895 = select i1 %891, i16 %894, i16 512
  %896 = and i16 %561, %560
  %897 = and i16 %896, 1
  %898 = icmp eq i16 %897, 0
  %899 = or i16 %557, %556
  %900 = shl i16 %899, 10
  %901 = and i16 %900, 1024
  %902 = select i1 %898, i16 0, i16 %901
  %903 = shl i16 %885, 3
  %904 = and i16 %903, 8
  %905 = shl nuw i16 %886, 5
  %906 = and i16 %905, 32
  %907 = and i16 %580, 64
  %908 = shl nuw i16 %887, 7
  %909 = and i16 %908, 128
  %910 = shl nuw i16 %888, 8
  %911 = and i16 %910, 256
  %912 = shl nuw nsw i16 %566, 11
  %913 = shl nuw nsw i16 %571, 12
  %914 = shl nuw nsw i16 %574, 13
  %915 = shl nuw nsw i16 %579, 14
  %916 = or disjoint i16 %911, %907
  %917 = or disjoint i16 %916, %912
  %918 = or disjoint i16 %917, %913
  %919 = or disjoint i16 %918, %904
  %920 = or disjoint i16 %919, %906
  %921 = or disjoint i16 %920, %909
  %922 = or disjoint i16 %915, %895
  %923 = or disjoint i16 %922, %914
  %924 = or disjoint i16 %923, %902
  %925 = or i16 %924, %921
  %926 = or i16 %925, %542
  %927 = or i16 %926, %581
  br label %928

928:                                              ; preds = %884, %844, %807, %762, %719, %654, %618
  %929 = phi i16 [ %927, %884 ], [ %879, %844 ], [ %837, %807 ], [ %801, %762 ], [ %753, %719 ], [ %711, %654 ], [ %649, %618 ]
  %930 = icmp eq i16 %929, -1
  br i1 %930, label %.loopexit, label %931

931:                                              ; preds = %928
  %932 = trunc i16 %929 to i8
  store i8 %932, ptr %522, align 1, !tbaa !5
  %933 = lshr i16 %929, 8
  %934 = trunc i16 %933 to i8
  store i8 %934, ptr %526, align 1, !tbaa !5
  br label %.backedge

935:                                              ; preds = %514
  %936 = icmp ne i8 %24, 39
  %937 = icmp ult i32 %19, 3
  %or.cond24 = select i1 %936, i1 true, i1 %937
  br i1 %or.cond24, label %.loopexit, label %938

938:                                              ; preds = %935
  %939 = shl i32 %19, 1
  %940 = add i32 %939, -6
  %941 = getelementptr inbounds i8, ptr %4, i32 %940
  %942 = load i8, ptr %941, align 1, !tbaa !5
  %943 = zext i8 %942 to i16
  %944 = or disjoint i32 %940, 1
  %945 = getelementptr inbounds i8, ptr %4, i32 %944
  %946 = load i8, ptr %945, align 1, !tbaa !5
  %947 = zext i8 %946 to i16
  %948 = shl nuw i16 %947, 8
  %949 = or disjoint i16 %948, %943
  %950 = add i32 %19, -2
  %951 = shl i32 %950, 1
  %952 = getelementptr inbounds i8, ptr %4, i32 %951
  %953 = load i8, ptr %952, align 1, !tbaa !5
  %954 = zext i8 %953 to i16
  %955 = or disjoint i32 %951, 1
  %956 = getelementptr inbounds i8, ptr %4, i32 %955
  %957 = load i8, ptr %956, align 1, !tbaa !5
  %958 = zext i8 %957 to i16
  %959 = shl nuw i16 %958, 8
  %960 = or disjoint i16 %959, %954
  %961 = add i32 %939, -2
  %962 = getelementptr inbounds i8, ptr %4, i32 %961
  %963 = load i8, ptr %962, align 1, !tbaa !5
  %964 = zext i8 %963 to i16
  %965 = or disjoint i32 %961, 1
  %966 = getelementptr inbounds i8, ptr %4, i32 %965
  %967 = load i8, ptr %966, align 1, !tbaa !5
  %968 = zext i8 %967 to i16
  %969 = shl nuw i16 %968, 8
  %970 = or disjoint i16 %969, %964
  %971 = and i16 %954, 3
  %972 = and i16 %964, 3
  %973 = lshr i16 %964, 2
  %974 = and i16 %973, 1
  %975 = and i16 %964, 32
  %976 = lshr i16 %943, 7
  %977 = icmp sgt i16 %949, -1
  %978 = icmp sgt i16 %960, -1
  %or.cond25 = select i1 %977, i1 true, i1 %978
  %979 = icmp sgt i16 %970, -1
  %or.cond26 = select i1 %or.cond25, i1 true, i1 %979
  br i1 %or.cond26, label %1002, label %980

980:                                              ; preds = %938
  %981 = and i16 %947, 8
  %982 = icmp eq i16 %981, 0
  %983 = and i16 %958, 16
  %984 = icmp eq i16 %983, 0
  %or.cond28 = select i1 %982, i1 true, i1 %984
  br i1 %or.cond28, label %985, label %1002

985:                                              ; preds = %980
  %986 = and i16 %947, 16
  %987 = icmp eq i16 %986, 0
  %988 = and i16 %958, 8
  %989 = icmp eq i16 %988, 0
  %or.cond30 = select i1 %987, i1 true, i1 %989
  br i1 %or.cond30, label %990, label %1002

990:                                              ; preds = %985
  %991 = and i16 %947, 32
  %992 = icmp eq i16 %991, 0
  %993 = and i16 %958, 64
  %994 = icmp eq i16 %993, 0
  %or.cond32 = select i1 %992, i1 true, i1 %994
  br i1 %or.cond32, label %995, label %1002

995:                                              ; preds = %990
  %996 = and i16 %947, 64
  %997 = icmp eq i16 %996, 0
  br i1 %997, label %1002, label %998

998:                                              ; preds = %995
  %999 = shl i16 %958, 10
  %1000 = and i16 %999, -32768
  %1001 = xor i16 %1000, -32768
  br label %1002

1002:                                             ; preds = %990, %985, %980, %998, %995, %938
  %1003 = phi i16 [ 0, %938 ], [ -32768, %995 ], [ %1001, %998 ], [ 0, %980 ], [ 0, %985 ], [ 0, %990 ]
  %1004 = and i16 %943, 99
  %1005 = icmp ne i16 %1004, 96
  %1006 = icmp ne i16 %971, %972
  %.not60 = or i1 %1005, %1006
  %1007 = icmp eq i16 %971, 3
  %or.cond34 = or i1 %1007, %.not60
  br i1 %or.cond34, label %.loopexit, label %1008

1008:                                             ; preds = %1002
  %1009 = and i16 %943, 4
  %1010 = icmp ne i16 %1009, 0
  %1011 = and i16 %1009, %954
  %1012 = icmp eq i16 %1011, 0
  %1013 = shl nuw nsw i16 %974, 2
  %1014 = select i1 %1012, i16 0, i16 %1013
  %1015 = and i16 %970, %960
  %1016 = and i16 %1015, 8
  %1017 = icmp ne i16 %1016, 0
  %1018 = and i1 %1010, %1017
  br i1 %1018, label %1027, label %1019

1019:                                             ; preds = %1008
  %1020 = and i16 %954, 4
  %1021 = icmp ne i16 %1020, 0
  %1022 = and i16 %943, 8
  %1023 = icmp ne i16 %1022, 0
  %1024 = and i1 %1023, %1021
  %1025 = shl nuw nsw i16 %974, 3
  %1026 = select i1 %1024, i16 %1025, i16 0
  br label %1027

1027:                                             ; preds = %1019, %1008
  %1028 = phi i16 [ 8, %1008 ], [ %1026, %1019 ]
  %1029 = and i16 %1015, 64
  %1030 = and i16 %964, 128
  %1031 = icmp eq i16 %1030, 0
  %1032 = or i16 %960, %949
  %1033 = and i16 %1032, 128
  %1034 = select i1 %1031, i16 0, i16 %1033
  %1035 = and i16 %968, 1
  %1036 = icmp eq i16 %1035, 0
  %1037 = shl i16 %1032, 1
  %1038 = and i16 %1037, 256
  %1039 = select i1 %1036, i16 0, i16 %1038
  %1040 = and i16 %968, 2
  %1041 = icmp eq i16 %1040, 0
  %1042 = and i16 %959, 256
  %1043 = or disjoint i16 %1042, %976
  %1044 = icmp eq i16 %1043, 0
  %1045 = select i1 %1041, i1 true, i1 %1044
  %1046 = select i1 %1045, i16 0, i16 512
  %1047 = and i16 %948, 1024
  %1048 = and i16 %1047, %1015
  %1049 = icmp ne i16 %1048, 0
  %1050 = and i16 %947, 2
  %1051 = icmp ne i16 %1050, 0
  %1052 = and i1 %1051, %1049
  br i1 %1052, label %1053, label %1059

1053:                                             ; preds = %1027
  %1054 = and i16 %954, 128
  %1055 = or disjoint i16 %1054, %976
  %1056 = icmp eq i16 %1055, 0
  %1057 = shl nuw nsw i16 %1030, 3
  %1058 = select i1 %1056, i16 %1057, i16 1024
  br label %1059

1059:                                             ; preds = %1053, %1027
  %1060 = phi i16 [ 0, %1027 ], [ %1058, %1053 ]
  %1061 = or i16 %1032, %969
  %1062 = and i16 %1061, 30720
  %1063 = or disjoint i16 %1062, %975
  %1064 = or disjoint i16 %1063, %1014
  %1065 = or disjoint i16 %1064, %1034
  %1066 = or disjoint i16 %1065, %1029
  %1067 = or disjoint i16 %1066, %1039
  %1068 = or i16 %1067, %1046
  %1069 = or i16 %1068, %1003
  %1070 = or i16 %1069, %1028
  %1071 = or i16 %1070, %1060
  %1072 = or i16 %1071, %971
  %1073 = icmp eq i16 %1072, -1
  br i1 %1073, label %.loopexit, label %1074

1074:                                             ; preds = %1059
  %1075 = trunc i16 %1072 to i8
  store i8 %1075, ptr %941, align 1, !tbaa !5
  %1076 = lshr i16 %1071, 8
  %1077 = trunc i16 %1076 to i8
  store i8 %1077, ptr %945, align 1, !tbaa !5
  br label %.backedge

.backedge:                                        ; preds = %1074, %931, %510, %255, %250, %250, %250, %250, %250, %242, %221, %82, %71, %55, %42, %26
  %.be = phi i32 [ %31, %221 ], [ %31, %82 ], [ %31, %71 ], [ %31, %55 ], [ %31, %42 ], [ %31, %26 ], [ %14, %255 ], [ %14, %931 ], [ %14, %1074 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ %14, %510 ], [ %14, %242 ]
  %.be166 = phi i32 [ %30, %221 ], [ %30, %82 ], [ %30, %71 ], [ %30, %55 ], [ %30, %42 ], [ %30, %26 ], [ %15, %255 ], [ %15, %931 ], [ %15, %1074 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ 0, %250 ], [ %15, %510 ], [ %15, %242 ]
  %.be167 = phi i8 [ %16, %221 ], [ 13, %82 ], [ 12, %71 ], [ 7, %55 ], [ 6, %42 ], [ %16, %26 ], [ %16, %255 ], [ %16, %931 ], [ %16, %1074 ], [ %24, %250 ], [ %24, %250 ], [ %24, %250 ], [ %24, %250 ], [ %24, %250 ], [ %16, %510 ], [ %16, %242 ]
  %.be168 = phi i32 [ 0, %221 ], [ 0, %82 ], [ 0, %71 ], [ 0, %55 ], [ 0, %42 ], [ %32, %26 ], [ 0, %255 ], [ 0, %931 ], [ 0, %1074 ], [ 4, %250 ], [ 4, %250 ], [ 4, %250 ], [ 4, %250 ], [ 4, %250 ], [ 0, %510 ], [ 0, %242 ]
  %.be170 = phi i32 [ %222, %221 ], [ %83, %82 ], [ %72, %71 ], [ %57, %55 ], [ %45, %42 ], [ %19, %26 ], [ %256, %255 ], [ %531, %931 ], [ %950, %1074 ], [ %19, %250 ], [ %19, %250 ], [ %19, %250 ], [ %19, %250 ], [ %19, %250 ], [ %19, %510 ], [ %245, %242 ]
  br label %13

1078:                                             ; preds = %13
  %1079 = icmp eq i32 %17, 0
  %1080 = icmp eq i32 %19, 1
  %1081 = select i1 %1079, i1 %1080, i1 false
  br i1 %1081, label %1082, label %.loopexit

1082:                                             ; preds = %1078
  %1083 = load i8, ptr %4, align 1, !tbaa !5
  %1084 = and i8 %1083, 3
  %1085 = icmp eq i8 %1084, 0
  br i1 %1085, label %1086, label %1102

1086:                                             ; preds = %1082
  %1087 = getelementptr inbounds i8, ptr %4, i32 1
  %1088 = load i8, ptr %1087, align 1, !tbaa !5
  %1089 = icmp sgt i8 %1088, -1
  br i1 %1089, label %1102, label %1090

1090:                                             ; preds = %1086
  %1091 = zext i8 %3 to i32
  %1092 = and i32 %1091, 1
  %1093 = icmp ne i32 %1092, 0
  %1094 = and i8 %1088, 4
  %1095 = icmp eq i8 %1094, 0
  %1096 = and i1 %1093, %1095
  br i1 %1096, label %1102, label %1097

1097:                                             ; preds = %1090
  %1098 = and i32 %1091, 2
  %1099 = icmp ne i32 %1098, 0
  %1100 = icmp sgt i8 %1083, -1
  %1101 = and i1 %1099, %1100
  br i1 %1101, label %1102, label %.loopexit

1102:                                             ; preds = %1097, %1090, %1086, %1082
  br label %.loopexit

.loopexit:                                        ; preds = %1059, %1002, %935, %928, %880, %838, %802, %758, %754, %712, %650, %601, %599, %517, %507, %486, %459, %436, %415, %396, %375, %351, %326, %303, %266, %264, %253, %232, %183, %88, %77, %66, %52, %35, %119, %108, %1102, %1097, %1078, %5
  %1103 = phi i8 [ 0, %5 ], [ 0, %1078 ], [ 0, %1102 ], [ 1, %1097 ], [ 0, %108 ], [ 0, %119 ], [ 0, %35 ], [ 0, %52 ], [ 0, %66 ], [ 0, %77 ], [ 0, %88 ], [ 0, %183 ], [ 0, %232 ], [ 0, %253 ], [ 0, %264 ], [ 0, %266 ], [ 0, %303 ], [ 0, %326 ], [ 0, %351 ], [ 0, %375 ], [ 0, %396 ], [ 0, %415 ], [ 0, %436 ], [ 0, %459 ], [ 0, %486 ], [ 0, %507 ], [ 0, %517 ], [ 0, %599 ], [ 0, %601 ], [ 0, %650 ], [ 0, %712 ], [ 0, %754 ], [ 0, %758 ], [ 0, %802 ], [ 0, %838 ], [ 0, %880 ], [ 0, %928 ], [ 0, %935 ], [ 0, %1002 ], [ 0, %1059 ]
  ret i8 %1103
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden noundef i64 @llb_psbt_locktime_init() local_unnamed_addr #0 {
  ret i64 -9223372036854775808
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_psbt_locktime_step(i64 noundef %0, i8 noundef zeroext %1, i32 noundef %2, i8 noundef zeroext %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = lshr i64 %0, 61
  %7 = and i64 %6, 3
  %8 = icmp eq i64 %7, 1
  %9 = lshr i64 %0, 32
  %10 = trunc i64 %9 to i32
  %11 = and i32 %10, 536870911
  %12 = trunc i64 %0 to i32
  %13 = select i1 %8, i32 %11, i32 %12
  %14 = icmp eq i64 %0, 0
  br i1 %14, label %73, label %15

15:                                               ; preds = %5
  %16 = icmp ne i8 %1, 0
  %17 = add i32 %2, -500000000
  %or.cond = icmp ult i32 %17, -499999999
  %or.cond5 = and i1 %16, %or.cond
  br i1 %or.cond5, label %73, label %18

18:                                               ; preds = %15
  %19 = icmp ne i8 %3, 0
  %20 = icmp ult i32 %4, 500000000
  %21 = and i1 %19, %20
  br i1 %21, label %73, label %22

22:                                               ; preds = %18
  %23 = or i8 %3, %1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %73, label %25

25:                                               ; preds = %22
  %26 = and i1 %16, %19
  %27 = icmp eq i64 %7, 0
  br i1 %26, label %28, label %54

28:                                               ; preds = %25
  br i1 %27, label %29, label %35

29:                                               ; preds = %28
  %30 = zext i32 %2 to i64
  %31 = shl nuw i64 %30, 32
  %32 = zext i32 %4 to i64
  %33 = or disjoint i64 %31, %32
  %34 = or i64 %33, -6917529027641081856
  br label %73

35:                                               ; preds = %28
  br i1 %8, label %36, label %44

36:                                               ; preds = %35
  %37 = tail call i32 @llvm.umax.i32(i32 %11, i32 %2)
  %38 = zext i32 %37 to i64
  %39 = shl nuw i64 %38, 32
  %40 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %41 = zext i32 %40 to i64
  %42 = or disjoint i64 %39, %41
  %43 = or i64 %42, -6917529027641081856
  br label %73

44:                                               ; preds = %35
  %45 = icmp eq i64 %7, 2
  br i1 %45, label %46, label %50

46:                                               ; preds = %44
  %47 = tail call i32 @llvm.umax.i32(i32 %12, i32 %2)
  %48 = zext i32 %47 to i64
  %49 = or disjoint i64 %48, -4611686018427387904
  br label %73

50:                                               ; preds = %44
  %51 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %52 = zext i32 %51 to i64
  %53 = or disjoint i64 %52, -2305843009213693952
  br label %73

54:                                               ; preds = %25
  br i1 %16, label %55, label %64

55:                                               ; preds = %54
  br i1 %27, label %56, label %59

56:                                               ; preds = %55
  %57 = zext i32 %2 to i64
  %58 = or disjoint i64 %57, -4611686018427387904
  br label %73

59:                                               ; preds = %55
  %trunc4 = trunc i64 %6 to i2
  %trunc4.off = add i2 %trunc4, -1
  %switch = icmp sgt i2 %trunc4.off, -1
  br i1 %switch, label %60, label %73

60:                                               ; preds = %59
  %61 = tail call i32 @llvm.umax.i32(i32 %13, i32 %2)
  %62 = zext i32 %61 to i64
  %63 = or disjoint i64 %62, -4611686018427387904
  br label %73

64:                                               ; preds = %54
  br i1 %27, label %65, label %68

65:                                               ; preds = %64
  %66 = zext i32 %4 to i64
  %67 = or disjoint i64 %66, -2305843009213693952
  br label %73

68:                                               ; preds = %64
  %trunc = trunc i64 %6 to i2
  switch i2 %trunc, label %73 [
    i2 -1, label %69
    i2 1, label %69
  ]

69:                                               ; preds = %68, %68
  %70 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %71 = zext i32 %70 to i64
  %72 = or disjoint i64 %71, -2305843009213693952
  br label %73

73:                                               ; preds = %59, %15, %68, %69, %65, %60, %56, %50, %46, %36, %29, %22, %18, %5
  %74 = phi i64 [ %34, %29 ], [ %43, %36 ], [ %49, %46 ], [ %53, %50 ], [ %58, %56 ], [ %63, %60 ], [ %67, %65 ], [ %72, %69 ], [ 0, %5 ], [ 0, %18 ], [ %0, %22 ], [ 0, %59 ], [ 0, %68 ], [ 0, %15 ]
  ret i64 %74
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define hidden i64 @llb_psbt_locktime_finalize(i64 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i64 %0, 0
  br i1 %3, label %17, label %4

4:                                                ; preds = %2
  %5 = lshr i64 %0, 61
  %6 = trunc i64 %5 to i2
  switch i2 %6, label %11 [
    i2 0, label %13
    i2 1, label %7
  ]

7:                                                ; preds = %4
  %8 = lshr i64 %0, 32
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 536870911
  br label %13

11:                                               ; preds = %4
  %12 = trunc i64 %0 to i32
  br label %13

13:                                               ; preds = %11, %7, %4
  %14 = phi i32 [ %10, %7 ], [ %12, %11 ], [ %1, %4 ]
  %15 = zext i32 %14 to i64
  %16 = or disjoint i64 %15, 4294967296
  br label %17

17:                                               ; preds = %13, %2
  %18 = phi i64 [ %16, %13 ], [ 0, %2 ]
  ret i64 %18
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden i64 @llb_psbt_determine_locktime(ptr noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq ptr %0, null
  %5 = icmp ne i32 %1, 0
  %6 = and i1 %4, %5
  %7 = icmp ugt i32 %1, 429496729
  %or.cond = or i1 %7, %6
  br i1 %or.cond, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %3, %11
  %8 = phi i32 [ %23, %11 ], [ 0, %3 ]
  %9 = phi i64 [ %21, %11 ], [ -9223372036854775808, %3 ]
  %10 = icmp eq i32 %8, %1
  br i1 %10, label %24, label %11

11:                                               ; preds = %.preheader
  %12 = mul nuw i32 %8, 10
  %13 = getelementptr inbounds i8, ptr %0, i32 %12
  %14 = load i8, ptr %13, align 1, !tbaa !5
  %15 = getelementptr inbounds i8, ptr %13, i32 1
  %16 = load i32, ptr %15, align 1
  %17 = getelementptr inbounds i8, ptr %13, i32 5
  %18 = load i8, ptr %17, align 1, !tbaa !5
  %19 = getelementptr inbounds i8, ptr %13, i32 6
  %20 = load i32, ptr %19, align 1
  %21 = tail call i64 @llb_psbt_locktime_step(i64 noundef %9, i8 noundef zeroext %14, i32 noundef %16, i8 noundef zeroext %18, i32 noundef %20) #8
  %22 = icmp eq i64 %21, 0
  %23 = add nuw nsw i32 %8, 1
  br i1 %22, label %.loopexit, label %.preheader

24:                                               ; preds = %.preheader
  %25 = tail call i64 @llb_psbt_locktime_finalize(i64 noundef %9, i32 noundef %2) #8, !range !8
  br label %.loopexit

.loopexit:                                        ; preds = %11, %24, %3
  %26 = phi i64 [ %25, %24 ], [ 0, %3 ], [ 0, %11 ]
  ret i64 %26
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext i8 @llb_bytes_eq(ptr noundef readonly %0, ptr noundef readonly %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %3
  %6 = icmp eq ptr %0, null
  %7 = icmp eq ptr %1, null
  %or.cond = or i1 %6, %7
  br i1 %or.cond, label %22, label %.preheader

.preheader:                                       ; preds = %5, %11
  %8 = phi i32 [ %18, %11 ], [ 0, %5 ]
  %9 = phi i8 [ %17, %11 ], [ 0, %5 ]
  %10 = icmp eq i32 %8, %2
  br i1 %10, label %19, label %11

11:                                               ; preds = %.preheader
  %12 = getelementptr inbounds i8, ptr %0, i32 %8
  %13 = load i8, ptr %12, align 1, !tbaa !5
  %14 = getelementptr inbounds i8, ptr %1, i32 %8
  %15 = load i8, ptr %14, align 1, !tbaa !5
  %16 = xor i8 %15, %13
  %17 = or i8 %16, %9
  %18 = add i32 %8, 1
  br label %.preheader

19:                                               ; preds = %.preheader
  %20 = icmp eq i8 %9, 0
  %21 = zext i1 %20 to i8
  br label %22

22:                                               ; preds = %19, %5, %3
  %23 = phi i8 [ %21, %19 ], [ 1, %3 ], [ 0, %5 ]
  ret i8 %23
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext i8 @llb_check_dual_utxo(i64 noundef %0, ptr noundef readonly %1, i32 noundef %2, i64 noundef %3, ptr noundef readonly %4, i32 noundef %5) local_unnamed_addr #4 {
  %7 = icmp ult i64 %0, 2100000000000001
  %8 = icmp eq i64 %0, %3
  %9 = and i1 %7, %8
  %10 = icmp eq i32 %2, %5
  %11 = and i1 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %6
  %13 = tail call zeroext i8 @llb_bytes_eq(ptr noundef %1, ptr noundef %4, i32 noundef %2) #8, !range !3
  br label %14

14:                                               ; preds = %12, %6
  %15 = phi i8 [ %13, %12 ], [ 0, %6 ]
  ret i8 %15
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden i64 @llb_sum_amounts_le64(ptr noundef readonly %0, i32 noundef %1) local_unnamed_addr #4 {
  %3 = icmp eq ptr %0, null
  %4 = icmp ne i32 %1, 0
  %5 = and i1 %3, %4
  %6 = icmp ugt i32 %1, 536870911
  %or.cond = or i1 %6, %5
  br i1 %or.cond, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2, %39
  %7 = phi i32 [ %41, %39 ], [ 0, %2 ]
  %8 = phi i64 [ %40, %39 ], [ 0, %2 ]
  %9 = icmp eq i32 %7, %1
  br i1 %9, label %42, label %10

10:                                               ; preds = %.preheader
  %11 = shl nuw i32 %7, 3
  %12 = getelementptr inbounds i8, ptr %0, i32 %11
  %13 = load i32, ptr %12, align 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, ptr %12, i32 4
  %16 = load i8, ptr %15, align 1, !tbaa !5
  %17 = zext i8 %16 to i64
  %18 = shl nuw nsw i64 %17, 32
  %19 = or disjoint i64 %18, %14
  %20 = getelementptr inbounds i8, ptr %12, i32 5
  %21 = load i8, ptr %20, align 1, !tbaa !5
  %22 = zext i8 %21 to i64
  %23 = shl nuw nsw i64 %22, 40
  %24 = or disjoint i64 %19, %23
  %25 = getelementptr inbounds i8, ptr %12, i32 6
  %26 = load i8, ptr %25, align 1, !tbaa !5
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 48
  %29 = or disjoint i64 %24, %28
  %30 = getelementptr inbounds i8, ptr %12, i32 7
  %31 = load i8, ptr %30, align 1, !tbaa !5
  %32 = zext i8 %31 to i64
  %33 = shl nuw i64 %32, 56
  %34 = or disjoint i64 %29, %33
  %35 = icmp ugt i64 %8, 2100000000000000
  %36 = sub nuw nsw i64 2100000000000000, %8
  %37 = icmp ult i64 %36, %34
  %38 = select i1 %35, i1 true, i1 %37
  br i1 %38, label %.loopexit, label %39

39:                                               ; preds = %10
  %40 = add nuw nsw i64 %34, %8
  %41 = add nuw nsw i32 %7, 1
  br label %.preheader

42:                                               ; preds = %.preheader
  %43 = or i64 %8, -9223372036854775808
  br label %.loopexit

.loopexit:                                        ; preds = %10, %42, %2
  %44 = phi i64 [ %43, %42 ], [ 0, %2 ], [ 0, %10 ]
  ret i64 %44
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: read)
define hidden zeroext i8 @llb_bip32_check_export_path(ptr noundef readonly %0, i8 noundef zeroext %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq ptr %0, null
  %5 = zext i8 %1 to i32
  %6 = add i8 %1, -11
  %7 = icmp ult i8 %6, -9
  %or.cond1 = or i1 %4, %7
  br i1 %or.cond1, label %.loopexit, label %8

8:                                                ; preds = %3
  %9 = icmp eq i8 %1, 2
  br i1 %9, label %10, label %20

10:                                               ; preds = %8
  %11 = load i32, ptr %0, align 4, !tbaa !9
  %12 = icmp eq i32 %11, -2142942139
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = getelementptr inbounds i32, ptr %0, i32 1
  %15 = load i32, ptr %14, align 4, !tbaa !9
  %16 = icmp eq i32 %15, -1035385550
  br label %17

17:                                               ; preds = %13, %10
  %18 = phi i1 [ false, %10 ], [ %16, %13 ]
  %19 = zext i1 %18 to i8
  br label %.loopexit

20:                                               ; preds = %8
  %21 = icmp ugt i8 %1, 3
  br i1 %21, label %22, label %25

22:                                               ; preds = %20
  %23 = getelementptr inbounds i32, ptr %0, i32 3
  %24 = load i32, ptr %23, align 4, !tbaa !9
  br label %25

25:                                               ; preds = %22, %20
  %26 = phi i32 [ %24, %22 ], [ 0, %20 ]
  %27 = load i32, ptr %0, align 4, !tbaa !9
  %28 = getelementptr inbounds i32, ptr %0, i32 1
  %29 = load i32, ptr %28, align 4, !tbaa !9
  %30 = getelementptr inbounds i32, ptr %0, i32 2
  %31 = load i32, ptr %30, align 4, !tbaa !9
  %32 = tail call zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 noundef %27, i32 noundef %29, i32 noundef %31, i32 noundef %26, i8 noundef zeroext %1, i32 noundef %2, i8 noundef zeroext 1) #8, !range !3
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %.loopexit, label %34

34:                                               ; preds = %25
  %35 = and i32 %27, 2147483647
  %36 = icmp eq i32 %35, 48
  %37 = select i1 %36, i32 4, i32 3
  %umax = tail call i32 @llvm.umax.i32(i32 %37, i32 %5)
  br label %38

38:                                               ; preds = %40, %34
  %39 = phi i32 [ %37, %34 ], [ %44, %40 ]
  %exitcond.not = icmp eq i32 %39, %umax
  br i1 %exitcond.not, label %.loopexit, label %40

40:                                               ; preds = %38
  %41 = getelementptr inbounds i32, ptr %0, i32 %39
  %42 = load i32, ptr %41, align 4, !tbaa !9
  %43 = icmp sgt i32 %42, -1
  %44 = add nuw nsw i32 %39, 1
  br i1 %43, label %38, label %.loopexit

.loopexit:                                        ; preds = %40, %38, %25, %17, %3
  %45 = phi i8 [ %19, %17 ], [ 0, %3 ], [ 0, %25 ], [ 0, %40 ], [ 1, %38 ]
  ret i8 %45
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: read)
define hidden i64 @llb_read_compact_size_checked(ptr noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #5 {
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i32 %1, 0
  %or.cond = or i1 %4, %5
  br i1 %or.cond, label %40, label %6

6:                                                ; preds = %3
  %7 = load i8, ptr %0, align 1, !tbaa !5
  %8 = icmp ult i8 %7, -3
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = zext i8 %7 to i64
  br label %29

11:                                               ; preds = %6
  switch i8 %7, label %40 [
    i8 -3, label %12
    i8 -2, label %23
  ]

12:                                               ; preds = %11
  %13 = icmp ult i32 %1, 3
  br i1 %13, label %40, label %14

14:                                               ; preds = %12
  %15 = getelementptr inbounds i8, ptr %0, i32 1
  %16 = load i8, ptr %15, align 1, !tbaa !5
  %17 = zext i8 %16 to i64
  %18 = getelementptr inbounds i8, ptr %0, i32 2
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = zext i8 %19 to i64
  %21 = shl nuw nsw i64 %20, 8
  %22 = or disjoint i64 %21, %17
  br label %29

23:                                               ; preds = %11
  %24 = icmp ult i32 %1, 5
  br i1 %24, label %40, label %25

25:                                               ; preds = %23
  %26 = getelementptr inbounds i8, ptr %0, i32 1
  %27 = load i32, ptr %26, align 1
  %28 = zext i32 %27 to i64
  br label %29

29:                                               ; preds = %25, %14, %9
  %30 = phi i64 [ %10, %9 ], [ %22, %14 ], [ %28, %25 ]
  %31 = phi i32 [ 1, %9 ], [ 3, %14 ], [ 5, %25 ]
  %32 = tail call zeroext i8 @llb_varint_prefix_is_canonical(i8 noundef zeroext %7, i64 noundef %30) #8, !range !3
  %33 = icmp eq i8 %32, 0
  %34 = zext i32 %2 to i64
  %35 = icmp ugt i64 %30, %34
  %or.cond2 = or i1 %35, %33
  br i1 %or.cond2, label %40, label %36

36:                                               ; preds = %29
  %37 = zext nneg i32 %31 to i64
  %38 = shl nuw nsw i64 %37, 32
  %39 = add nuw nsw i64 %38, %30
  br label %40

40:                                               ; preds = %36, %29, %23, %12, %11, %3
  %41 = phi i64 [ %39, %36 ], [ 0, %3 ], [ 0, %12 ], [ 0, %23 ], [ 0, %11 ], [ 0, %29 ]
  ret i64 %41
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden void @llb_sort_fixed_bytes(ptr noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i32 %2, 0
  %or.cond = or i1 %4, %5
  %6 = icmp ult i32 %1, 2
  %or.cond1 = or i1 %6, %or.cond
  br i1 %or.cond1, label %.loopexit7, label %.preheader6

.preheader6:                                      ; preds = %3, %43
  %7 = phi i32 [ %44, %43 ], [ 1, %3 ]
  %8 = icmp eq i32 %7, %1
  br i1 %8, label %.loopexit7, label %.preheader5

.preheader5:                                      ; preds = %.preheader, %.preheader6
  %9 = phi i32 [ %7, %.preheader6 ], [ %12, %.preheader ]
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %43, label %11

11:                                               ; preds = %.preheader5
  %12 = add i32 %9, -1
  %13 = mul i32 %12, %2
  %14 = mul i32 %9, %2
  %15 = getelementptr i8, ptr %0, i32 %13
  %16 = getelementptr i8, ptr %0, i32 %14
  br label %17

17:                                               ; preds = %21, %11
  %18 = phi i8 [ 0, %11 ], [ %30, %21 ]
  %19 = phi i32 [ 0, %11 ], [ %31, %21 ]
  %20 = icmp eq i32 %19, %2
  br i1 %20, label %32, label %21

21:                                               ; preds = %17
  %22 = getelementptr i8, ptr %15, i32 %19
  %23 = load i8, ptr %22, align 1, !tbaa !5
  %24 = getelementptr i8, ptr %16, i32 %19
  %25 = load i8, ptr %24, align 1, !tbaa !5
  %26 = icmp ult i8 %23, %25
  %27 = icmp ugt i8 %23, %25
  %28 = select i1 %27, i8 1, i8 %18
  %29 = icmp eq i8 %23, %25
  %30 = select i1 %26, i8 0, i8 %28
  %31 = add i32 %19, 1
  br i1 %29, label %17, label %32

32:                                               ; preds = %21, %17
  %33 = phi i8 [ %30, %21 ], [ %18, %17 ]
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %43, label %.preheader

.preheader:                                       ; preds = %32, %37
  %35 = phi i32 [ %42, %37 ], [ 0, %32 ]
  %36 = icmp eq i32 %35, %2
  br i1 %36, label %.preheader5, label %37

37:                                               ; preds = %.preheader
  %38 = getelementptr i8, ptr %15, i32 %35
  %39 = load i8, ptr %38, align 1, !tbaa !5
  %40 = getelementptr i8, ptr %16, i32 %35
  %41 = load i8, ptr %40, align 1, !tbaa !5
  store i8 %41, ptr %38, align 1, !tbaa !5
  store i8 %39, ptr %40, align 1, !tbaa !5
  %42 = add i32 %35, 1
  br label %.preheader

43:                                               ; preds = %32, %.preheader5
  %44 = add i32 %7, 1
  br label %.preheader6

.loopexit7:                                       ; preds = %.preheader6, %3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden void @llb_sort_u16(ptr noundef %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = icmp eq ptr %0, null
  %4 = icmp ult i32 %1, 2
  %or.cond = or i1 %3, %4
  br i1 %or.cond, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2, %20
  %5 = phi i32 [ %22, %20 ], [ 1, %2 ]
  %6 = icmp eq i32 %5, %1
  br i1 %6, label %.loopexit, label %7

7:                                                ; preds = %.preheader
  %8 = getelementptr inbounds i16, ptr %0, i32 %5
  %9 = load i16, ptr %8, align 2, !tbaa !11
  br label %10

10:                                               ; preds = %18, %7
  %11 = phi i32 [ %5, %7 ], [ %19, %18 ]
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %20, label %13

13:                                               ; preds = %10
  %14 = getelementptr i16, ptr %0, i32 %11
  %15 = getelementptr i16, ptr %14, i32 -1
  %16 = load i16, ptr %15, align 2, !tbaa !11
  %17 = icmp ugt i16 %16, %9
  br i1 %17, label %18, label %20

18:                                               ; preds = %13
  store i16 %16, ptr %14, align 2, !tbaa !11
  %19 = add i32 %11, -1
  br label %10

20:                                               ; preds = %13, %10
  %21 = getelementptr inbounds i16, ptr %0, i32 %11
  store i16 %9, ptr %21, align 2, !tbaa !11
  %22 = add i32 %5, 1
  br label %.preheader

.loopexit:                                        ; preds = %.preheader, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define hidden i32 @llb_format_sats_ascii(i64 noundef %0, ptr noundef readonly %1, i32 noundef %2, i8 noundef zeroext %3, ptr noundef writeonly %4, i32 noundef %5) local_unnamed_addr #3 {
  %7 = alloca [12 x i8], align 1
  %8 = alloca [10 x i8], align 1
  %9 = alloca [8 x i8], align 1
  %10 = tail call i64 @llb_sats_div_1e8(i64 noundef %0) #8, !range !4
  %11 = tail call i32 @llb_sats_mod_1e8(i64 noundef %0) #8
  %12 = tail call i64 @llb_sats_div_1e8(i64 noundef %10) #8, !range !4
  %13 = trunc i64 %12 to i32
  %14 = tail call i32 @llb_sats_mod_1e8(i64 noundef %10) #8
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %7) #9
  call void @llvm.lifetime.start.p0(i64 10, ptr nonnull %8) #9
  %15 = icmp eq ptr %4, null
  br i1 %15, label %206, label %16

16:                                               ; preds = %6
  %17 = icmp eq ptr %1, null
  %18 = icmp ne i32 %2, 0
  %19 = and i1 %17, %18
  br i1 %19, label %206, label %20

20:                                               ; preds = %16
  %21 = icmp eq i32 %13, 0
  br i1 %21, label %24, label %22

22:                                               ; preds = %20
  %23 = call fastcc i32 @llb_dec_digits(i32 noundef %13, ptr noundef nonnull %7) #8
  br label %26

24:                                               ; preds = %20
  %25 = call fastcc i32 @llb_dec_digits(i32 noundef %14, ptr noundef nonnull %8) #8
  br label %.loopexit16

26:                                               ; preds = %30, %22
  %27 = phi i32 [ %53, %30 ], [ 0, %22 ]
  %28 = phi i32 [ %47, %30 ], [ %14, %22 ]
  %29 = icmp eq i32 %27, 8
  br i1 %29, label %.loopexit16, label %30

30:                                               ; preds = %26
  %31 = and i32 %28, 65535
  %32 = lshr i32 %28, 16
  %33 = mul nuw i32 %31, 52429
  %34 = zext i32 %33 to i64
  %35 = mul nuw i32 %31, 52428
  %36 = zext i32 %35 to i64
  %37 = mul nuw i32 %32, 52429
  %38 = zext i32 %37 to i64
  %39 = mul nuw i32 %32, 52428
  %40 = zext i32 %39 to i64
  %41 = add nuw nsw i64 %36, %38
  %42 = shl nuw nsw i64 %41, 16
  %43 = shl nuw i64 %40, 32
  %44 = or disjoint i64 %43, %34
  %45 = add nuw i64 %44, %42
  %46 = lshr i64 %45, 35
  %47 = trunc i64 %46 to i32
  %48 = mul i32 %47, 246
  %49 = add i32 %48, %28
  %50 = trunc i32 %49 to i8
  %51 = add i8 %50, 48
  %52 = getelementptr inbounds [10 x i8], ptr %8, i32 0, i32 %27
  store i8 %51, ptr %52, align 1, !tbaa !5
  %53 = add nuw nsw i32 %27, 1
  br label %26

.loopexit16:                                      ; preds = %26, %24
  %54 = phi i32 [ 0, %24 ], [ %23, %26 ]
  %55 = phi i32 [ %25, %24 ], [ 8, %26 ]
  %56 = icmp ne i8 %3, 0
  %57 = icmp ne i32 %11, 0
  %58 = select i1 %56, i1 true, i1 %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i8 %3, 0
  br i1 %60, label %.preheader15, label %92

.preheader15:                                     ; preds = %.loopexit16, %66
  %61 = phi i32 [ %83, %66 ], [ %11, %.loopexit16 ]
  %62 = phi i32 [ %87, %66 ], [ 0, %.loopexit16 ]
  %63 = icmp ult i32 %62, 8
  %64 = icmp ne i32 %61, 0
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %88

66:                                               ; preds = %.preheader15
  %67 = and i32 %61, 65535
  %68 = lshr i32 %61, 16
  %69 = mul nuw i32 %67, 52429
  %70 = zext i32 %69 to i64
  %71 = mul nuw i32 %67, 52428
  %72 = zext i32 %71 to i64
  %73 = mul nuw i32 %68, 52429
  %74 = zext i32 %73 to i64
  %75 = mul nuw i32 %68, 52428
  %76 = zext i32 %75 to i64
  %77 = add nuw nsw i64 %72, %74
  %78 = shl nuw nsw i64 %77, 16
  %79 = shl nuw i64 %76, 32
  %80 = or disjoint i64 %79, %70
  %81 = add nuw i64 %80, %78
  %82 = lshr i64 %81, 35
  %83 = trunc i64 %82 to i32
  %84 = mul i32 %83, -10
  %85 = sub i32 0, %61
  %86 = icmp eq i32 %84, %85
  %87 = add nuw nsw i32 %62, 1
  br i1 %86, label %.preheader15, label %88

88:                                               ; preds = %66, %.preheader15
  %89 = icmp eq i32 %11, 0
  %90 = sub nsw i32 8, %62
  %91 = select i1 %89, i32 0, i32 %90
  br label %92

92:                                               ; preds = %88, %.loopexit16
  %93 = phi i32 [ %91, %88 ], [ 8, %.loopexit16 ]
  %94 = select i1 %58, i32 %93, i32 0
  %95 = icmp eq i32 %2, 0
  %96 = add i32 %2, 2
  %97 = select i1 %95, i32 1, i32 %96
  %98 = add i32 %97, %59
  %99 = add i32 %98, %54
  %100 = add i32 %99, %55
  %101 = add i32 %100, %94
  %102 = icmp ugt i32 %101, %5
  br i1 %102, label %206, label %.preheader14

.preheader14:                                     ; preds = %92, %106
  %103 = phi i32 [ %110, %106 ], [ 0, %92 ]
  %104 = phi i32 [ %107, %106 ], [ %54, %92 ]
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.preheader, label %106

106:                                              ; preds = %.preheader14
  %107 = add i32 %104, -1
  %108 = getelementptr inbounds [12 x i8], ptr %7, i32 0, i32 %107
  %109 = load i8, ptr %108, align 1, !tbaa !5
  %110 = add i32 %103, 1
  %111 = getelementptr inbounds i8, ptr %4, i32 %103
  store i8 %109, ptr %111, align 1, !tbaa !5
  br label %.preheader14

.preheader:                                       ; preds = %.preheader14, %115
  %112 = phi i32 [ %119, %115 ], [ %54, %.preheader14 ]
  %113 = phi i32 [ %116, %115 ], [ %55, %.preheader14 ]
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %121, label %115

115:                                              ; preds = %.preheader
  %116 = add i32 %113, -1
  %117 = getelementptr inbounds [10 x i8], ptr %8, i32 0, i32 %116
  %118 = load i8, ptr %117, align 1, !tbaa !5
  %119 = add i32 %112, 1
  %120 = getelementptr inbounds i8, ptr %4, i32 %112
  store i8 %118, ptr %120, align 1, !tbaa !5
  br label %.preheader

121:                                              ; preds = %.preheader
  br i1 %58, label %122, label %190

122:                                              ; preds = %121
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #9
  br i1 %60, label %123, label %.loopexit13.preheader

.loopexit13.preheader:                            ; preds = %125, %122
  %.ph = phi i32 [ %11, %122 ], [ %127, %125 ]
  br label %.loopexit13

123:                                              ; preds = %122
  %124 = sub i32 8, %93
  br label %125

125:                                              ; preds = %129, %123
  %126 = phi i32 [ %147, %129 ], [ 0, %123 ]
  %127 = phi i32 [ %146, %129 ], [ %11, %123 ]
  %128 = icmp eq i32 %126, %124
  br i1 %128, label %.loopexit13.preheader, label %129

129:                                              ; preds = %125
  %130 = and i32 %127, 65535
  %131 = lshr i32 %127, 16
  %132 = mul nuw i32 %130, 52429
  %133 = zext i32 %132 to i64
  %134 = mul nuw i32 %130, 52428
  %135 = zext i32 %134 to i64
  %136 = mul nuw i32 %131, 52429
  %137 = zext i32 %136 to i64
  %138 = mul nuw i32 %131, 52428
  %139 = zext i32 %138 to i64
  %140 = add nuw nsw i64 %135, %137
  %141 = shl nuw nsw i64 %140, 16
  %142 = shl nuw i64 %139, 32
  %143 = or disjoint i64 %142, %133
  %144 = add nuw i64 %143, %141
  %145 = lshr i64 %144, 35
  %146 = trunc i64 %145 to i32
  %147 = add i32 %126, 1
  br label %125

.loopexit13:                                      ; preds = %.loopexit13.preheader, %151
  %148 = phi i32 [ %176, %151 ], [ 0, %.loopexit13.preheader ]
  %149 = phi i32 [ %168, %151 ], [ %.ph, %.loopexit13.preheader ]
  %150 = icmp eq i32 %148, %93
  br i1 %150, label %177, label %151

151:                                              ; preds = %.loopexit13
  %152 = and i32 %149, 65535
  %153 = lshr i32 %149, 16
  %154 = mul nuw i32 %152, 52429
  %155 = zext i32 %154 to i64
  %156 = mul nuw i32 %152, 52428
  %157 = zext i32 %156 to i64
  %158 = mul nuw i32 %153, 52429
  %159 = zext i32 %158 to i64
  %160 = mul nuw i32 %153, 52428
  %161 = zext i32 %160 to i64
  %162 = add nuw nsw i64 %157, %159
  %163 = shl nuw nsw i64 %162, 16
  %164 = shl nuw i64 %161, 32
  %165 = or disjoint i64 %164, %155
  %166 = add nuw i64 %165, %163
  %167 = lshr i64 %166, 35
  %168 = trunc i64 %167 to i32
  %169 = mul i32 %168, 246
  %170 = add i32 %169, %149
  %171 = trunc i32 %170 to i8
  %172 = add i8 %171, 48
  %173 = xor i32 %148, -1
  %174 = add i32 %93, %173
  %175 = getelementptr inbounds [8 x i8], ptr %9, i32 0, i32 %174
  store i8 %172, ptr %175, align 1, !tbaa !5
  %176 = add i32 %148, 1
  br label %.loopexit13

177:                                              ; preds = %.loopexit13
  %178 = getelementptr inbounds i8, ptr %4, i32 %112
  store i8 46, ptr %178, align 1, !tbaa !5
  br label %179

179:                                              ; preds = %184, %177
  %180 = phi i32 [ %112, %177 ], [ %182, %184 ]
  %181 = phi i32 [ 0, %177 ], [ %188, %184 ]
  %182 = add i32 %180, 1
  %183 = icmp eq i32 %181, %93
  br i1 %183, label %189, label %184

184:                                              ; preds = %179
  %185 = getelementptr inbounds [8 x i8], ptr %9, i32 0, i32 %181
  %186 = load i8, ptr %185, align 1, !tbaa !5
  %187 = getelementptr inbounds i8, ptr %4, i32 %182
  store i8 %186, ptr %187, align 1, !tbaa !5
  %188 = add i32 %181, 1
  br label %179

189:                                              ; preds = %179
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #9
  br label %190

190:                                              ; preds = %189, %121
  %191 = phi i32 [ %182, %189 ], [ %112, %121 ]
  br i1 %18, label %192, label %.loopexit

192:                                              ; preds = %190
  %193 = getelementptr inbounds i8, ptr %4, i32 %191
  store i8 32, ptr %193, align 1, !tbaa !5
  br label %194

194:                                              ; preds = %199, %192
  %195 = phi i32 [ %191, %192 ], [ %197, %199 ]
  %196 = phi i32 [ 0, %192 ], [ %203, %199 ]
  %197 = add i32 %195, 1
  %198 = icmp eq i32 %196, %2
  br i1 %198, label %.loopexit, label %199

199:                                              ; preds = %194
  %200 = getelementptr inbounds i8, ptr %1, i32 %196
  %201 = load i8, ptr %200, align 1, !tbaa !5
  %202 = getelementptr inbounds i8, ptr %4, i32 %197
  store i8 %201, ptr %202, align 1, !tbaa !5
  %203 = add i32 %196, 1
  br label %194

.loopexit:                                        ; preds = %194, %190
  %204 = phi i32 [ %191, %190 ], [ %197, %194 ]
  %205 = getelementptr inbounds i8, ptr %4, i32 %204
  store i8 0, ptr %205, align 1, !tbaa !5
  br label %206

206:                                              ; preds = %.loopexit, %92, %16, %6
  %207 = phi i32 [ %204, %.loopexit ], [ 0, %6 ], [ 0, %16 ], [ 0, %92 ]
  call void @llvm.lifetime.end.p0(i64 10, ptr nonnull %8) #9
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %7) #9
  ret i32 %207
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: write)
define hidden fastcc i32 @llb_dec_digits(i32 noundef %0, ptr nocapture noundef writeonly %1) unnamed_addr #6 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i32 [ 0, %2 ], [ %27, %3 ]
  %5 = phi i32 [ %0, %2 ], [ %22, %3 ]
  %6 = and i32 %5, 65535
  %7 = lshr i32 %5, 16
  %8 = mul nuw i32 %6, 52429
  %9 = zext i32 %8 to i64
  %10 = mul nuw i32 %6, 52428
  %11 = zext i32 %10 to i64
  %12 = mul nuw i32 %7, 52429
  %13 = zext i32 %12 to i64
  %14 = mul nuw i32 %7, 52428
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %11, %13
  %17 = shl nuw nsw i64 %16, 16
  %18 = shl nuw i64 %15, 32
  %19 = or disjoint i64 %18, %9
  %20 = add nuw i64 %19, %17
  %21 = lshr i64 %20, 35
  %22 = trunc i64 %21 to i32
  %23 = mul i32 %22, 246
  %24 = add i32 %23, %5
  %25 = trunc i32 %24 to i8
  %26 = add i8 %25, 48
  %27 = add i32 %4, 1
  %28 = getelementptr inbounds i8, ptr %1, i32 %4
  store i8 %26, ptr %28, align 1, !tbaa !5
  %29 = icmp eq i32 %22, 0
  br i1 %29, label %30, label %3

30:                                               ; preds = %3
  ret i32 %27
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #1 = { alwaysinline mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #4 = { nofree norecurse nosync nounwind optsize memory(argmem: read) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: read) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #6 = { nofree norecurse nosync nounwind optsize memory(argmem: write) "no-builtins" "no-trapping-math"="true" "use-soft-float"="true" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nobuiltin optsize "no-builtins" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"min_enum_size", i32 4}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i8 0, i8 2}
!4 = !{i64 0, i64 219903164404}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 0, i64 8589934592}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !6, i64 0}
