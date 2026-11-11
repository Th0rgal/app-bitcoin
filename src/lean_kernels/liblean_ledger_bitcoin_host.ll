; ModuleID = '/var/lib/sandboxed-node/.scratch/e42fdc4f-ce56-40b8-9b3e-c267ef038ce3/opencode/worktrees/lean-ledger-bitcoin/ffi/bolos/build/lto/liblean_ledger_bitcoin_host.ll.pre.ll'
source_filename = "/var/lib/sandboxed-node/.scratch/e42fdc4f-ce56-40b8-9b3e-c267ef038ce3/opencode/worktrees/lean-ledger-bitcoin/ffi/bolos/src/lean_kernels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@switch.table.llb_bolos_sw_for_error = private unnamed_addr constant [19 x i16] [i16 26368, i16 27271, i16 27904, i16 28160, i16 27270, i16 27013, i16 27010, i16 27392, i16 27264, i16 27264, i16 27266, i16 27266, i16 27264, i16 27264, i16 27264, i16 27264, i16 -20473, i16 -20480, i16 -20472], align 2
@switch.table.llb_miniscript_check_postfix = private unnamed_addr constant [5 x i16] [i16 -30876, i16 -31420, i16 -30982, i16 -30990, i16 -30984], align 2

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i32 @llb_version_packed() local_unnamed_addr #0 {
  ret i32 132097
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_valid_amount(i64 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i64 %0, 2100000000000001
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_checked_add_sats_ok(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i64 %0, 2100000000000001
  %4 = sub i64 2100000000000000, %0
  %5 = icmp uge i64 %4, %1
  %6 = and i1 %3, %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i64 @llb_checked_add_sats_val(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i64 %0, 2100000000000000
  %4 = sub i64 2100000000000000, %0
  %5 = icmp ult i64 %4, %1
  %6 = or i1 %3, %5
  %7 = add i64 %1, %0
  %8 = select i1 %6, i64 0, i64 %7
  ret i64 %8
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_checked_sub_sats_ok(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i64 %0, 2100000000000001
  %4 = icmp ule i64 %1, %0
  %5 = and i1 %3, %4
  %6 = zext i1 %5 to i8
  ret i8 %6
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i64 @llb_checked_sub_sats_val(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ugt i64 %0, 2100000000000000
  %4 = icmp ugt i64 %1, %0
  %5 = or i1 %3, %4
  %6 = sub i64 %0, %1
  %7 = select i1 %5, i64 0, i64 %6
  ret i64 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_is_hardened(i32 noundef %0) local_unnamed_addr #0 {
  %2 = lshr i32 %0, 31
  %3 = trunc i32 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i32 @llb_bip32_harden(i32 noundef %0) local_unnamed_addr #0 {
  %2 = or i32 %0, -2147483648
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i32 @llb_bip32_unharden(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, 2147483647
  ret i32 %2
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_bolos_depth_ok(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp ult i8 %0, 11
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_vanadium_depth_ok(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp ult i8 %0, 17
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_bip32_standard_purpose_ok(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, 2147483647
  %3 = icmp sgt i32 %0, -1
  br i1 %3, label %11, label %4

4:                                                ; preds = %1
  %5 = and i32 %0, 2147483645
  %6 = icmp eq i32 %5, 84
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  switch i32 %2, label %8 [
    i32 87, label %11
    i32 49, label %11
    i32 44, label %11
  ]

8:                                                ; preds = %7
  %9 = icmp eq i32 %2, 45
  %10 = zext i1 %9 to i8
  br label %11

11:                                               ; preds = %8, %7, %7, %7, %4, %1
  %12 = phi i8 [ 0, %1 ], [ 1, %7 ], [ %10, %8 ], [ 1, %4 ], [ 1, %7 ], [ 1, %7 ]
  ret i8 %12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden zeroext i8 @llb_witness_opcode_to_version(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp eq i8 %0, 0
  %3 = add i8 %0, -81
  %4 = icmp ult i8 %3, 16
  %5 = add nsw i8 %0, -80
  %6 = select i1 %4, i8 %5, i8 -1
  %7 = select i1 %2, i8 0, i8 %6
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_segwit_program_valid(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden zeroext i8 @llb_sighash_type_valid(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, 127
  %3 = icmp ult i32 %0, 256
  %4 = add nsw i32 %2, -1
  %5 = icmp ult i32 %4, 3
  %6 = and i1 %3, %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden zeroext i8 @llb_taproot_sighash_valid(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp eq i8 %0, 0
  %3 = and i8 %0, 127
  %4 = add nsw i8 %3, -1
  %5 = icmp ult i8 %4, 3
  %6 = select i1 %2, i1 true, i1 %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_merkle_depth_index_ok(i32 noundef %0, i32 noundef %1, i8 noundef zeroext %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %0, 0
  br i1 %4, label %12, label %5

5:                                                ; preds = %3
  %6 = icmp ult i32 %1, %0
  %7 = icmp sgt i32 %1, -1
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = icmp ult i8 %2, 33
  %11 = zext i1 %10 to i8
  br label %12

12:                                               ; preds = %9, %5, %3
  %13 = phi i8 [ 0, %5 ], [ 0, %3 ], [ %11, %9 ]
  ret i8 %13
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i16 @llb_bolos_sw_for_error(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp ult i8 %0, 19
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = zext nneg i8 %0 to i64
  %5 = getelementptr inbounds [19 x i16], ptr @switch.table.llb_bolos_sw_for_error, i64 0, i64 %4
  %6 = load i16, ptr %5, align 2
  br label %7

7:                                                ; preds = %3, %1
  %8 = phi i16 [ %6, %3 ], [ -20473, %1 ]
  ret i16 %8
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden i64 @llb_merkle_advance_state(i64 noundef %0) local_unnamed_addr #0 {
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden zeroext i8 @llb_bip32_pubkey_export_prefix_ok(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i8 noundef zeroext %4, i32 noundef %5, i8 noundef zeroext %6) local_unnamed_addr #0 {
  %8 = icmp eq i8 %4, 2
  br i1 %8, label %9, label %13

9:                                                ; preds = %7
  %10 = icmp eq i32 %0, -2142942139
  %11 = icmp eq i32 %1, -1035385550
  %12 = and i1 %10, %11
  br label %51

13:                                               ; preds = %7
  %14 = icmp ult i8 %4, 3
  %15 = icmp eq i8 %6, 0
  %16 = or i1 %14, %15
  %17 = and i32 %1, %0
  %18 = and i32 %17, %2
  %19 = icmp sgt i32 %18, -1
  %20 = or i1 %19, %16
  br i1 %20, label %51, label %21

21:                                               ; preds = %13
  %22 = and i32 %0, 2147483647
  %23 = and i32 %1, 2147483647
  %24 = and i32 %2, 2147483647
  %25 = icmp ne i32 %23, %5
  %26 = icmp ugt i32 %24, 100
  %27 = or i1 %26, %25
  br i1 %27, label %51, label %28

28:                                               ; preds = %21
  %29 = icmp sgt i32 %0, -1
  br i1 %29, label %36, label %30

30:                                               ; preds = %28
  %31 = and i32 %0, 2147483645
  %32 = icmp eq i32 %31, 84
  br i1 %32, label %51, label %33

33:                                               ; preds = %30
  %34 = add nsw i32 %22, -44
  %35 = icmp ult i32 %34, 44
  br i1 %35, label %46, label %36

36:                                               ; preds = %46, %33, %28
  %37 = icmp ne i32 %22, 48
  %38 = icmp ult i8 %4, 4
  %39 = or i1 %37, %38
  %40 = icmp sgt i32 %3, -1
  %41 = or i1 %40, %39
  br i1 %41, label %51, label %42

42:                                               ; preds = %36
  %43 = and i32 %3, 2147483647
  %44 = add nsw i32 %43, -1
  %45 = icmp ult i32 %44, 2
  br label %51

46:                                               ; preds = %33
  %47 = zext nneg i32 %34 to i64
  %48 = lshr i64 8796093022243, %47
  %49 = and i64 %48, 1
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %36, label %51

51:                                               ; preds = %46, %42, %36, %30, %21, %13, %9
  %52 = phi i1 [ %12, %9 ], [ %45, %42 ], [ false, %13 ], [ false, %21 ], [ false, %36 ], [ true, %30 ], [ true, %46 ]
  %53 = zext i1 %52 to i8
  ret i8 %53
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i32 @llb_bech32_final_constant(i8 noundef zeroext %0) local_unnamed_addr #0 {
  %2 = icmp eq i8 %0, 2
  %3 = select i1 %2, i32 734539939, i32 0
  %4 = icmp eq i8 %0, 1
  %5 = select i1 %4, i32 1, i32 %3
  ret i32 %5
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_wallet_name_char_ok(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #0 {
  %3 = icmp eq i8 %1, 0
  %4 = select i1 %3, i32 32, i32 33
  %5 = zext i8 %0 to i32
  %6 = icmp ule i32 %4, %5
  %7 = icmp ult i8 %0, 127
  %8 = and i1 %7, %6
  %9 = zext i1 %8 to i8
  ret i8 %9
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden i32 @llb_sats_mod_1e8(i64 noundef %0) local_unnamed_addr #0 {
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
  %73 = trunc i64 %72 to i32
  %74 = mul i32 %73, -100000000
  %75 = add i32 %74, %2
  ret i32 %75
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_older_ok(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, -4259840
  %3 = icmp eq i32 %2, 0
  %4 = and i32 %0, 65535
  %5 = icmp ne i32 %4, 0
  %6 = and i1 %3, %5
  %7 = zext i1 %6 to i8
  ret i8 %7
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_after_ok(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef zeroext i8 @llb_miniscript_andor_branches_valid(i8 noundef zeroext %0, i8 noundef zeroext %1, i8 noundef zeroext %2) local_unnamed_addr #0 {
  %4 = icmp eq i8 %0, 100
  %5 = icmp eq i8 %1, 103
  %6 = and i1 %4, %5
  %7 = icmp eq i8 %2, 104
  %8 = and i1 %6, %7
  %9 = zext i1 %8 to i8
  ret i8 %9
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite)
define hidden noundef zeroext i8 @llb_miniscript_check_postfix(ptr noundef readonly %0, i32 noundef %1, i8 noundef zeroext %2, i8 noundef zeroext %3, ptr noundef %4) local_unnamed_addr #2 {
  %6 = icmp eq ptr %0, null
  %7 = icmp eq ptr %4, null
  %8 = or i1 %6, %7
  %9 = add i32 %1, -513
  %10 = icmp ult i32 %9, -512
  %11 = or i1 %10, %8
  br i1 %11, label %ms_apply_andor.exit.thread, label %12

12:                                               ; preds = %5
  %13 = icmp eq i8 %2, 0
  %14 = icmp ne i8 %2, 0
  %15 = select i1 %13, i16 56, i16 120
  %16 = zext nneg i32 %1 to i64
  br label %17

17:                                               ; preds = %1162, %12
  %18 = phi i64 [ 0, %12 ], [ %24, %1162 ]
  %19 = phi i32 [ 0, %12 ], [ %1167, %1162 ]
  %20 = phi i32 [ 0, %12 ], [ %1166, %1162 ]
  %21 = phi i8 [ 0, %12 ], [ %1165, %1162 ]
  %22 = phi i32 [ 0, %12 ], [ %1164, %1162 ]
  %23 = phi i32 [ 0, %12 ], [ %1163, %1162 ]
  %24 = add nuw nsw i64 %18, 1
  %25 = getelementptr inbounds i8, ptr %0, i64 %18
  %26 = load i8, ptr %25, align 1, !tbaa !2
  %27 = icmp eq i32 %20, 0
  br i1 %27, label %302, label %28

28:                                               ; preds = %17
  %29 = zext i8 %26 to i32
  %30 = shl i32 %23, 3
  %31 = shl i32 %29, %30
  %32 = or i32 %31, %22
  %33 = add i32 %23, 1
  %34 = add nsw i32 %20, -1
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %1162

36:                                               ; preds = %28
  switch i8 %21, label %77 [
    i8 6, label %37
    i8 7, label %63
  ]

37:                                               ; preds = %36
  %38 = and i32 %32, -4259840
  %39 = icmp eq i32 %38, 0
  %40 = and i32 %32, 65535
  %41 = icmp ne i32 %40, 0
  %42 = and i1 %39, %41
  %43 = icmp ult i32 %19, 64
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %ms_apply_andor.exit.thread

45:                                               ; preds = %37
  %46 = lshr i32 %32, 22
  %47 = trunc i32 %46 to i16
  %48 = add nuw nsw i32 %19, 1
  %49 = shl nuw nsw i16 %47, 11
  %50 = and i16 %49, 2048
  %51 = shl nuw nsw i16 %47, 12
  %52 = and i16 %51, 4096
  %53 = or disjoint i16 %50, %52
  %54 = shl nuw nsw i32 %19, 1
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds i8, ptr %4, i64 %55
  store i8 4, ptr %56, align 1, !tbaa !2
  %57 = lshr exact i16 %53, 8
  %58 = trunc i16 %57 to i8
  %59 = xor i8 %58, -107
  %60 = or disjoint i32 %54, 1
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr inbounds i8, ptr %4, i64 %61
  store i8 %59, ptr %62, align 1, !tbaa !2
  br label %1162

63:                                               ; preds = %36
  %64 = icmp sgt i32 %32, 0
  %65 = icmp ult i32 %19, 64
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %ms_apply_andor.exit.thread

67:                                               ; preds = %63
  %68 = icmp ult i32 %32, 500000000
  %69 = add nuw nsw i32 %19, 1
  %70 = shl nuw nsw i32 %19, 1
  %71 = zext nneg i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %4, i64 %71
  store i8 4, ptr %72, align 1, !tbaa !2
  %73 = select i1 %68, i8 -59, i8 -91
  %74 = or disjoint i32 %70, 1
  %75 = zext nneg i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %4, i64 %75
  store i8 %73, ptr %76, align 1, !tbaa !2
  br label %1162

77:                                               ; preds = %36
  %78 = and i32 %32, 65535
  %79 = lshr i32 %32, 16
  %80 = icmp eq i32 %78, 0
  switch i8 %21, label %113 [
    i8 12, label %81
    i8 13, label %97
  ]

81:                                               ; preds = %77
  %82 = select i1 %14, i1 true, i1 %80
  br i1 %82, label %ms_apply_andor.exit.thread, label %83

83:                                               ; preds = %81
  %84 = icmp ugt i32 %78, %79
  %85 = icmp ugt i32 %32, 1376255
  %86 = or i1 %85, %84
  %87 = icmp ugt i32 %19, 63
  %88 = select i1 %86, i1 true, i1 %87
  br i1 %88, label %ms_apply_andor.exit.thread, label %89

89:                                               ; preds = %83
  %90 = add nuw nsw i32 %19, 1
  %91 = shl nuw nsw i32 %19, 1
  %92 = zext nneg i32 %91 to i64
  %93 = getelementptr inbounds i8, ptr %4, i64 %92
  store i8 -16, ptr %93, align 1, !tbaa !2
  %94 = or disjoint i32 %91, 1
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr inbounds i8, ptr %4, i64 %95
  store i8 -122, ptr %96, align 1, !tbaa !2
  br label %1162

97:                                               ; preds = %77
  %98 = select i1 %13, i1 true, i1 %80
  br i1 %98, label %ms_apply_andor.exit.thread, label %99

99:                                               ; preds = %97
  %100 = icmp ugt i32 %78, %79
  %101 = icmp ugt i32 %32, 65535999
  %102 = or i1 %101, %100
  %103 = icmp ugt i32 %19, 63
  %104 = select i1 %102, i1 true, i1 %103
  br i1 %104, label %ms_apply_andor.exit.thread, label %105

105:                                              ; preds = %99
  %106 = add nuw nsw i32 %19, 1
  %107 = shl nuw nsw i32 %19, 1
  %108 = zext nneg i32 %107 to i64
  %109 = getelementptr inbounds i8, ptr %4, i64 %108
  store i8 -32, ptr %109, align 1, !tbaa !2
  %110 = or disjoint i32 %107, 1
  %111 = zext nneg i32 %110 to i64
  %112 = getelementptr inbounds i8, ptr %4, i64 %111
  store i8 -122, ptr %112, align 1, !tbaa !2
  br label %1162

113:                                              ; preds = %77
  br i1 %80, label %ms_apply_andor.exit.thread, label %114

114:                                              ; preds = %113
  %115 = icmp ugt i32 %78, %79
  %116 = icmp ugt i32 %32, 4259839
  %117 = or i1 %116, %115
  %118 = icmp ult i32 %19, %79
  %119 = select i1 %117, i1 true, i1 %118
  br i1 %119, label %ms_apply_andor.exit.thread, label %120

120:                                              ; preds = %114
  %121 = sub i32 %19, %79
  %122 = icmp eq i32 %78, 1
  %123 = zext nneg i32 %79 to i64
  %124 = shl i32 %121, 1
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i8, ptr %4, i64 %125
  %127 = load i8, ptr %126, align 1, !tbaa !2
  %128 = zext i8 %127 to i16
  %129 = and i16 %128, 99
  %130 = icmp eq i16 %129, 96
  br i1 %130, label %131, label %ms_apply_andor.exit.thread

131:                                              ; preds = %120
  %132 = or disjoint i32 %124, 1
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i8, ptr %4, i64 %133
  %135 = load i8, ptr %134, align 1, !tbaa !2
  %136 = zext i8 %135 to i16
  %137 = lshr exact i16 %128, 2
  %138 = and i16 %137, 1
  %139 = zext nneg i16 %138 to i32
  %140 = lshr i16 %128, 3
  %141 = and i16 %140, 1
  %142 = zext nneg i16 %141 to i32
  %143 = icmp sgt i8 %127, -1
  %144 = zext i1 %143 to i32
  %145 = lshr i16 %136, 1
  %146 = and i16 %145, 1
  %147 = zext nneg i16 %146 to i32
  %148 = lshr i16 %136, 2
  %149 = and i16 %148, 1
  %150 = zext nneg i16 %149 to i32
  %151 = icmp sgt i8 %135, -1
  %152 = zext i1 %151 to i16
  %153 = lshr i16 %136, 3
  %154 = and i16 %153, 1
  %155 = lshr i16 %136, 4
  %156 = and i16 %155, 1
  %157 = lshr i16 %136, 5
  %158 = and i16 %157, 1
  %159 = lshr i16 %136, 6
  %160 = and i16 %159, 1
  %161 = icmp eq i32 %79, 1
  br i1 %161, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %131, %231
  %162 = phi i64 [ %247, %231 ], [ 1, %131 ]
  %163 = phi i32 [ %194, %231 ], [ %139, %131 ]
  %164 = phi i16 [ %234, %231 ], [ %152, %131 ]
  %165 = phi i16 [ %246, %231 ], [ %160, %131 ]
  %166 = phi i16 [ %243, %231 ], [ %158, %131 ]
  %167 = phi i16 [ %240, %231 ], [ %156, %131 ]
  %168 = phi i16 [ %237, %231 ], [ %154, %131 ]
  %169 = phi i32 [ %209, %231 ], [ %150, %131 ]
  %170 = phi i32 [ %205, %231 ], [ %147, %131 ]
  %171 = phi i32 [ %201, %231 ], [ %144, %131 ]
  %172 = phi i32 [ %198, %231 ], [ %142, %131 ]
  %173 = trunc i64 %162 to i32
  %174 = add i32 %121, %173
  %175 = shl i32 %174, 1
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds i8, ptr %4, i64 %176
  %178 = load i8, ptr %177, align 1, !tbaa !2
  %179 = zext i8 %178 to i16
  %180 = and i16 %179, 3
  %181 = icmp eq i16 %180, 3
  br i1 %181, label %182, label %ms_apply_andor.exit.thread

182:                                              ; preds = %.preheader
  %183 = or disjoint i32 %175, 1
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds i8, ptr %4, i64 %184
  %186 = load i8, ptr %185, align 1, !tbaa !2
  %187 = zext i8 %186 to i16
  %188 = and i16 %179, 96
  %189 = icmp eq i16 %188, 96
  br i1 %189, label %190, label %ms_apply_andor.exit.thread

190:                                              ; preds = %182
  %191 = lshr i16 %179, 2
  %192 = and i16 %191, 1
  %193 = zext nneg i16 %192 to i32
  %194 = add i32 %163, %193
  %195 = lshr i16 %179, 3
  %196 = and i16 %195, 1
  %197 = zext nneg i16 %196 to i32
  %198 = add i32 %172, %197
  %199 = icmp sgt i8 %178, -1
  %200 = zext i1 %199 to i32
  %201 = add i32 %171, %200
  %202 = lshr i16 %187, 1
  %203 = and i16 %202, 1
  %204 = zext nneg i16 %203 to i32
  %205 = add i32 %170, %204
  %206 = lshr i16 %187, 2
  %207 = and i16 %206, 1
  %208 = zext nneg i16 %207 to i32
  %209 = add i32 %169, %208
  br i1 %122, label %231, label %210

210:                                              ; preds = %190
  %211 = and i16 %187, 8
  %212 = icmp ne i16 %211, 0
  %213 = icmp ne i16 %167, 0
  %214 = select i1 %212, i1 %213, i1 false
  br i1 %214, label %230, label %215

215:                                              ; preds = %210
  %216 = and i16 %187, 16
  %217 = icmp ne i16 %216, 0
  %218 = icmp ne i16 %168, 0
  %219 = select i1 %217, i1 %218, i1 false
  br i1 %219, label %230, label %220

220:                                              ; preds = %215
  %221 = and i16 %187, 32
  %222 = icmp ne i16 %221, 0
  %223 = icmp ne i16 %165, 0
  %224 = select i1 %222, i1 %223, i1 false
  br i1 %224, label %230, label %225

225:                                              ; preds = %220
  %226 = and i16 %187, 64
  %227 = icmp ne i16 %226, 0
  %228 = icmp ne i16 %166, 0
  %229 = select i1 %227, i1 %228, i1 false
  br i1 %229, label %230, label %231

230:                                              ; preds = %225, %220, %215, %210
  br label %231

231:                                              ; preds = %230, %225, %190
  %232 = phi i16 [ 1, %230 ], [ %164, %225 ], [ %164, %190 ]
  %233 = icmp sgt i8 %186, -1
  %234 = select i1 %233, i16 1, i16 %232
  %235 = lshr i16 %187, 3
  %236 = and i16 %235, 1
  %237 = or i16 %236, %168
  %238 = lshr i16 %187, 4
  %239 = and i16 %238, 1
  %240 = or i16 %239, %167
  %241 = lshr i16 %187, 5
  %242 = and i16 %241, 1
  %243 = or i16 %242, %166
  %244 = lshr i16 %187, 6
  %245 = and i16 %244, 1
  %246 = or i16 %245, %165
  %247 = add nuw nsw i64 %162, 1
  %248 = icmp eq i64 %247, %123
  br i1 %248, label %.loopexit, label %.preheader, !llvm.loop !5

.loopexit:                                        ; preds = %231, %131
  %249 = phi i16 [ %152, %131 ], [ %234, %231 ]
  %250 = phi i16 [ %154, %131 ], [ %237, %231 ]
  %251 = phi i16 [ %156, %131 ], [ %240, %231 ]
  %252 = phi i16 [ %158, %131 ], [ %243, %231 ]
  %253 = phi i16 [ %160, %131 ], [ %246, %231 ]
  %254 = phi i32 [ %139, %131 ], [ %194, %231 ]
  %255 = phi i32 [ %142, %131 ], [ %198, %231 ]
  %256 = phi i32 [ %144, %131 ], [ %201, %231 ]
  %257 = phi i32 [ %147, %131 ], [ %205, %231 ]
  %258 = phi i32 [ %150, %131 ], [ %209, %231 ]
  %259 = icmp eq i32 %255, 1
  %260 = icmp eq i16 %249, 0
  %261 = shl nuw nsw i16 %250, 11
  %262 = and i16 %261, 2048
  %263 = shl nuw nsw i16 %251, 12
  %264 = and i16 %263, 4096
  %265 = shl nuw nsw i16 %252, 13
  %266 = and i16 %265, 8192
  %267 = shl nuw nsw i16 %253, 14
  %268 = select i1 %260, i16 -32768, i16 0
  %269 = icmp eq i32 %254, %79
  %270 = add nsw i32 %79, -1
  %271 = icmp eq i32 %254, %270
  %272 = select i1 %271, i1 %259, i1 false
  %273 = add nsw i32 %78, -1
  %274 = icmp ugt i32 %256, %273
  %275 = icmp eq i32 %257, %79
  %276 = icmp eq i32 %256, 0
  %277 = select i1 %275, i1 %276, i1 false
  %278 = icmp eq i32 %258, %79
  %279 = select i1 %275, i1 %278, i1 false
  %280 = icmp ule i32 %256, %78
  %281 = select i1 %279, i1 %280, i1 false
  %282 = select i1 %269, i16 4, i16 0
  %283 = select i1 %272, i16 8, i16 0
  %284 = select i1 %277, i16 512, i16 0
  %285 = select i1 %281, i16 1024, i16 0
  %286 = select i1 %274, i16 96, i16 224
  %287 = or disjoint i16 %264, %262
  %288 = or disjoint i16 %287, %266
  %289 = or disjoint i16 %288, %267
  %290 = or disjoint i16 %289, %286
  %291 = or disjoint i16 %290, %284
  %292 = or disjoint i16 %291, %285
  %293 = or i16 %292, %268
  %294 = or disjoint i16 %283, %282
  %295 = or i16 %294, %293
  %296 = icmp eq i16 %295, -1
  br i1 %296, label %ms_apply_andor.exit.thread, label %297

297:                                              ; preds = %.loopexit
  %298 = add i32 %121, 1
  %299 = trunc i16 %295 to i8
  store i8 %299, ptr %126, align 1, !tbaa !2
  %300 = lshr i16 %293, 8
  %301 = trunc i16 %300 to i8
  store i8 %301, ptr %134, align 1, !tbaa !2
  br label %1162

302:                                              ; preds = %17
  %303 = icmp ult i8 %26, 6
  br i1 %303, label %304, label %324

304:                                              ; preds = %302
  %305 = icmp ult i32 %19, 64
  br i1 %305, label %306, label %ms_apply_andor.exit.thread

306:                                              ; preds = %304
  %307 = icmp eq i8 %26, 5
  br i1 %307, label %312, label %308

308:                                              ; preds = %306
  %309 = zext nneg i8 %26 to i64
  %310 = getelementptr inbounds [5 x i16], ptr @switch.table.llb_miniscript_check_postfix, i64 0, i64 %309
  %311 = load i16, ptr %310, align 2
  br label %312

312:                                              ; preds = %308, %306
  %313 = phi i16 [ %311, %308 ], [ -30992, %306 ]
  %314 = add nuw nsw i32 %19, 1
  %315 = trunc i16 %313 to i8
  %316 = shl nuw nsw i32 %19, 1
  %317 = zext nneg i32 %316 to i64
  %318 = getelementptr inbounds i8, ptr %4, i64 %317
  store i8 %315, ptr %318, align 1, !tbaa !2
  %319 = lshr i16 %313, 8
  %320 = trunc i16 %319 to i8
  %321 = or disjoint i32 %316, 1
  %322 = zext nneg i32 %321 to i64
  %323 = getelementptr inbounds i8, ptr %4, i64 %322
  store i8 %320, ptr %323, align 1, !tbaa !2
  br label %1162

324:                                              ; preds = %302
  switch i8 %26, label %325 [
    i8 40, label %1162
    i8 13, label %1162
    i8 12, label %1162
    i8 7, label %1162
    i8 6, label %1162
  ]

325:                                              ; preds = %324
  %326 = icmp ult i8 %26, 12
  br i1 %326, label %327, label %337

327:                                              ; preds = %325
  %328 = icmp ugt i32 %19, 63
  br i1 %328, label %ms_apply_andor.exit.thread, label %329

329:                                              ; preds = %327
  %330 = add nuw nsw i32 %19, 1
  %331 = shl nuw nsw i32 %19, 1
  %332 = zext nneg i32 %331 to i64
  %333 = getelementptr inbounds i8, ptr %4, i64 %332
  store i8 120, ptr %333, align 1, !tbaa !2
  %334 = or disjoint i32 %331, 1
  %335 = zext nneg i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr %4, i64 %335
  store i8 -124, ptr %336, align 1, !tbaa !2
  br label %1162

337:                                              ; preds = %325
  %338 = add i8 %26, -16
  %339 = icmp ult i8 %338, 10
  br i1 %339, label %340, label %592

340:                                              ; preds = %337
  %341 = icmp eq i32 %19, 0
  br i1 %341, label %ms_apply_andor.exit.thread, label %342

342:                                              ; preds = %340
  %343 = shl i32 %19, 1
  %344 = add i32 %343, -2
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds i8, ptr %4, i64 %345
  %347 = load i8, ptr %346, align 1, !tbaa !2
  %348 = zext i8 %347 to i16
  %349 = or disjoint i32 %344, 1
  %350 = zext i32 %349 to i64
  %351 = getelementptr inbounds i8, ptr %4, i64 %350
  %352 = load i8, ptr %351, align 1, !tbaa !2
  %353 = zext i8 %352 to i16
  %354 = and i16 %348, 3
  %355 = lshr i16 %348, 2
  %356 = and i16 %355, 1
  %357 = lshr i16 %348, 3
  %358 = and i16 %357, 1
  %359 = lshr i16 %348, 4
  %360 = and i16 %359, 1
  %361 = lshr i16 %348, 5
  %362 = and i16 %361, 1
  %363 = lshr i16 %348, 6
  %364 = and i16 %363, 1
  %365 = and i16 %348, 128
  %366 = and i16 %353, 1
  %367 = lshr i16 %353, 1
  %368 = and i16 %367, 1
  %369 = lshr i16 %353, 2
  %370 = and i16 %369, 1
  %371 = lshr i16 %353, 3
  %372 = and i16 %371, 1
  %373 = lshr i16 %353, 4
  %374 = and i16 %373, 1
  %375 = lshr i16 %353, 5
  %376 = and i16 %375, 1
  %377 = lshr i16 %353, 6
  %378 = and i16 %377, 1
  %379 = sext i8 %352 to i16
  %380 = and i16 %379, -32768
  switch i8 %26, label %ms_apply_andor.exit.thread [
    i8 16, label %381
    i8 17, label %404
    i8 18, label %429
    i8 19, label %453
    i8 20, label %474
    i8 21, label %493
    i8 22, label %514
    i8 23, label %537
    i8 24, label %564
    i8 25, label %564
  ]

381:                                              ; preds = %342
  %382 = icmp eq i16 %354, 0
  br i1 %382, label %383, label %ms_apply_andor.exit.thread

383:                                              ; preds = %381
  %384 = shl nuw nsw i16 %362, 5
  %385 = shl nuw nsw i16 %364, 6
  %386 = or disjoint i16 %384, %385
  %387 = shl nuw nsw i16 %366, 8
  %388 = or disjoint i16 %386, %387
  %389 = shl nuw nsw i16 %368, 9
  %390 = or disjoint i16 %388, %389
  %391 = shl nuw nsw i16 %370, 10
  %392 = or disjoint i16 %390, %391
  %393 = or disjoint i16 %392, %365
  %394 = shl nuw nsw i16 %372, 11
  %395 = shl nuw nsw i16 %374, 12
  %396 = shl nuw nsw i16 %376, 13
  %397 = shl nuw nsw i16 %378, 14
  %398 = or disjoint i16 %394, %395
  %399 = or disjoint i16 %398, %396
  %400 = or disjoint i16 %399, %397
  %401 = or i16 %400, %393
  %402 = or i16 %401, %380
  %403 = or i16 %402, 3
  br label %585

404:                                              ; preds = %342
  %405 = icmp eq i16 %354, 0
  %406 = icmp ne i16 %358, 0
  %407 = and i1 %405, %406
  br i1 %407, label %408, label %ms_apply_andor.exit.thread

408:                                              ; preds = %404
  %409 = shl nuw nsw i16 %362, 5
  %410 = shl nuw nsw i16 %364, 6
  %411 = or disjoint i16 %409, %410
  %412 = shl nuw nsw i16 %366, 8
  %413 = or disjoint i16 %411, %412
  %414 = shl nuw nsw i16 %368, 9
  %415 = or disjoint i16 %413, %414
  %416 = shl nuw nsw i16 %370, 10
  %417 = or disjoint i16 %415, %416
  %418 = or disjoint i16 %417, %365
  %419 = shl nuw nsw i16 %372, 11
  %420 = shl nuw nsw i16 %374, 12
  %421 = shl nuw nsw i16 %376, 13
  %422 = shl nuw nsw i16 %378, 14
  %423 = or disjoint i16 %419, %420
  %424 = or disjoint i16 %423, %421
  %425 = or disjoint i16 %424, %422
  %426 = or i16 %425, %418
  %427 = or i16 %426, %380
  %428 = or i16 %427, 3
  br label %585

429:                                              ; preds = %342
  %430 = icmp eq i16 %354, 2
  br i1 %430, label %431, label %ms_apply_andor.exit.thread

431:                                              ; preds = %429
  %432 = shl nuw nsw i16 %358, 3
  %433 = shl nuw nsw i16 %360, 4
  %434 = or disjoint i16 %432, %433
  %435 = shl nuw nsw i16 %362, 5
  %436 = or disjoint i16 %434, %435
  %437 = shl nuw nsw i16 %366, 8
  %438 = or disjoint i16 %436, %437
  %439 = shl nuw nsw i16 %368, 9
  %440 = or disjoint i16 %438, %439
  %441 = shl nuw nsw i16 %370, 10
  %442 = or disjoint i16 %440, %441
  %443 = shl nuw nsw i16 %372, 11
  %444 = shl nuw nsw i16 %374, 12
  %445 = shl nuw nsw i16 %376, 13
  %446 = shl nuw nsw i16 %378, 14
  %447 = or disjoint i16 %443, %444
  %448 = or disjoint i16 %447, %445
  %449 = or disjoint i16 %448, %446
  %450 = or i16 %449, %442
  %451 = or i16 %450, %380
  %452 = or i16 %451, 192
  br label %585

453:                                              ; preds = %342
  %454 = icmp eq i16 %354, 1
  br i1 %454, label %455, label %ms_apply_andor.exit.thread

455:                                              ; preds = %453
  %456 = shl nuw nsw i16 %356, 2
  %457 = shl nuw nsw i16 %358, 3
  %458 = or disjoint i16 %456, %457
  %459 = shl nuw nsw i16 %360, 4
  %460 = or disjoint i16 %458, %459
  %461 = shl nuw nsw i16 %370, 10
  %462 = or disjoint i16 %460, %461
  %463 = shl nuw nsw i16 %372, 11
  %464 = or disjoint i16 %462, %463
  %465 = or disjoint i16 %464, %365
  %466 = shl nuw nsw i16 %374, 12
  %467 = shl nuw nsw i16 %376, 13
  %468 = shl nuw nsw i16 %378, 14
  %469 = or disjoint i16 %466, %467
  %470 = or disjoint i16 %469, %468
  %471 = or i16 %470, %465
  %472 = or i16 %471, %380
  %473 = or i16 %472, 320
  br label %585

474:                                              ; preds = %342
  %475 = icmp eq i16 %354, 1
  %476 = icmp ne i16 %356, 0
  %477 = and i1 %475, %476
  br i1 %477, label %478, label %ms_apply_andor.exit.thread

478:                                              ; preds = %474
  %479 = shl nuw nsw i16 %366, 9
  %480 = or disjoint i16 %479, %15
  %481 = shl nuw nsw i16 %370, 10
  %482 = or disjoint i16 %480, %481
  %483 = shl nuw nsw i16 %372, 11
  %484 = or disjoint i16 %482, %483
  %485 = shl nuw nsw i16 %374, 12
  %486 = or disjoint i16 %484, %485
  %487 = shl nuw nsw i16 %376, 13
  %488 = shl nuw nsw i16 %378, 14
  %489 = or disjoint i16 %487, %488
  %490 = or disjoint i16 %486, %489
  %491 = or disjoint i16 %490, %365
  %492 = or i16 %491, %380
  br label %585

493:                                              ; preds = %342
  %494 = icmp eq i16 %354, 0
  br i1 %494, label %495, label %ms_apply_andor.exit.thread

495:                                              ; preds = %493
  %496 = shl nuw nsw i16 %356, 2
  %497 = shl nuw nsw i16 %358, 3
  %498 = or disjoint i16 %496, %497
  %499 = shl nuw nsw i16 %360, 4
  %500 = or disjoint i16 %498, %499
  %501 = shl nuw nsw i16 %370, 10
  %502 = or disjoint i16 %500, %501
  %503 = shl nuw nsw i16 %372, 11
  %504 = or disjoint i16 %502, %503
  %505 = or disjoint i16 %504, %365
  %506 = shl nuw nsw i16 %374, 12
  %507 = shl nuw nsw i16 %376, 13
  %508 = shl nuw nsw i16 %378, 14
  %509 = or disjoint i16 %506, %507
  %510 = or disjoint i16 %509, %508
  %511 = or i16 %510, %505
  %512 = or i16 %511, %380
  %513 = or i16 %512, 257
  br label %585

514:                                              ; preds = %342
  %515 = icmp eq i16 %354, 0
  %516 = icmp ne i16 %360, 0
  %517 = and i1 %515, %516
  br i1 %517, label %518, label %ms_apply_andor.exit.thread

518:                                              ; preds = %514
  %519 = shl nuw nsw i16 %358, 3
  %520 = shl nuw nsw i16 %364, 6
  %521 = or disjoint i16 %519, %520
  %522 = shl nuw nsw i16 %366, 9
  %523 = or disjoint i16 %521, %522
  %524 = shl nuw nsw i16 %370, 10
  %525 = or disjoint i16 %523, %524
  %526 = shl nuw nsw i16 %372, 11
  %527 = or disjoint i16 %525, %526
  %528 = or disjoint i16 %527, %365
  %529 = shl nuw nsw i16 %374, 12
  %530 = shl nuw nsw i16 %376, 13
  %531 = shl nuw nsw i16 %378, 14
  %532 = or disjoint i16 %529, %530
  %533 = or disjoint i16 %532, %531
  %534 = or i16 %533, %528
  %535 = or i16 %534, %380
  %536 = or i16 %535, 48
  br label %585

537:                                              ; preds = %342
  %538 = icmp eq i16 %354, 0
  br i1 %538, label %539, label %ms_apply_andor.exit.thread

539:                                              ; preds = %537
  %540 = shl nuw nsw i16 %356, 2
  %541 = shl nuw nsw i16 %358, 3
  %542 = or disjoint i16 %540, %541
  %543 = shl nuw nsw i16 %360, 4
  %544 = or disjoint i16 %542, %543
  %545 = shl nuw nsw i16 %362, 5
  %546 = or disjoint i16 %544, %545
  %547 = shl nuw nsw i16 %366, 8
  %548 = or disjoint i16 %546, %547
  %549 = shl nuw nsw i16 %368, 9
  %550 = shl nuw nsw i16 %370, 10
  %551 = shl nuw nsw i16 %372, 11
  %552 = shl nuw nsw i16 %374, 12
  %553 = shl nuw nsw i16 %376, 13
  %554 = shl nuw nsw i16 %378, 14
  %555 = or disjoint i16 %549, %550
  %556 = or disjoint i16 %555, %551
  %557 = or disjoint i16 %556, %552
  %558 = or disjoint i16 %557, %380
  %559 = or disjoint i16 %558, 64
  %560 = add nuw i16 %559, %553
  %561 = or disjoint i16 %548, %554
  %562 = or i16 %561, %560
  %563 = or i16 %562, %365
  br label %585

564:                                              ; preds = %342, %342
  %565 = icmp eq i16 %354, 0
  br i1 %565, label %566, label %ms_apply_andor.exit.thread

566:                                              ; preds = %564
  %567 = shl nuw nsw i16 %356, 3
  %568 = shl nuw nsw i16 %364, 6
  %569 = or disjoint i16 %567, %568
  %570 = shl nuw nsw i16 %366, 9
  %571 = or disjoint i16 %569, %570
  %572 = shl nuw nsw i16 %370, 10
  %573 = or disjoint i16 %571, %572
  %574 = shl nuw nsw i16 %372, 11
  %575 = or disjoint i16 %573, %574
  %576 = or disjoint i16 %575, %365
  %577 = shl nuw nsw i16 %374, 12
  %578 = shl nuw nsw i16 %376, 13
  %579 = shl nuw nsw i16 %378, 14
  %580 = or disjoint i16 %577, %578
  %581 = or disjoint i16 %580, %579
  %582 = or i16 %581, %576
  %583 = or i16 %582, %380
  %584 = or i16 %583, 32
  br label %585

585:                                              ; preds = %566, %539, %518, %495, %478, %455, %431, %408, %383
  %586 = phi i16 [ %584, %566 ], [ %563, %539 ], [ %536, %518 ], [ %513, %495 ], [ %492, %478 ], [ %473, %455 ], [ %452, %431 ], [ %428, %408 ], [ %403, %383 ]
  %587 = icmp eq i16 %586, -1
  br i1 %587, label %ms_apply_andor.exit.thread, label %588

588:                                              ; preds = %585
  %589 = trunc i16 %586 to i8
  store i8 %589, ptr %346, align 1, !tbaa !2
  %590 = lshr i16 %586, 8
  %591 = trunc i16 %590 to i8
  store i8 %591, ptr %351, align 1, !tbaa !2
  br label %1162

592:                                              ; preds = %337
  %593 = add i8 %26, -32
  %594 = icmp ult i8 %593, 7
  br i1 %594, label %595, label %1017

595:                                              ; preds = %592
  %596 = icmp ult i32 %19, 2
  br i1 %596, label %ms_apply_andor.exit.thread, label %597

597:                                              ; preds = %595
  %598 = shl i32 %19, 1
  %599 = add i32 %598, -4
  %600 = zext i32 %599 to i64
  %601 = getelementptr inbounds i8, ptr %4, i64 %600
  %602 = load i8, ptr %601, align 1, !tbaa !2
  %603 = zext i8 %602 to i16
  %604 = or disjoint i32 %599, 1
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds i8, ptr %4, i64 %605
  %607 = load i8, ptr %606, align 1, !tbaa !2
  %608 = zext i8 %607 to i16
  %609 = shl nuw i16 %608, 8
  %610 = or disjoint i16 %609, %603
  %611 = add i32 %19, -1
  %612 = shl i32 %611, 1
  %613 = zext i32 %612 to i64
  %614 = getelementptr inbounds i8, ptr %4, i64 %613
  %615 = load i8, ptr %614, align 1, !tbaa !2
  %616 = zext i8 %615 to i16
  %617 = or disjoint i32 %612, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds i8, ptr %4, i64 %618
  %620 = load i8, ptr %619, align 1, !tbaa !2
  %621 = zext i8 %620 to i16
  %622 = shl nuw i16 %621, 8
  %623 = or disjoint i16 %622, %616
  %624 = and i16 %603, 3
  %625 = and i16 %616, 3
  %626 = lshr i16 %610, 2
  %627 = lshr i16 %623, 2
  %628 = lshr i16 %610, 3
  %629 = lshr i16 %623, 3
  %630 = lshr i16 %603, 4
  %631 = and i16 %630, 1
  %632 = lshr i16 %610, 5
  %633 = and i16 %632, 1
  %634 = lshr i16 %623, 5
  %635 = and i16 %634, 1
  %636 = lshr i16 %616, 6
  %637 = and i16 %636, 1
  %638 = lshr i16 %610, 7
  %639 = lshr i16 %623, 7
  %640 = and i16 %639, 1
  %641 = and i16 %621, 1
  %642 = lshr i16 %608, 1
  %643 = lshr i16 %621, 1
  %644 = lshr i16 %608, 2
  %645 = lshr i16 %621, 2
  %646 = or i16 %623, %610
  %647 = lshr i16 %646, 11
  %648 = and i16 %647, 1
  %649 = lshr i16 %646, 12
  %650 = and i16 %649, 1
  %651 = lshr i16 %608, 5
  %652 = lshr i16 %646, 13
  %653 = and i16 %652, 1
  %654 = lshr i16 %621, 6
  %655 = lshr i16 %646, 14
  %656 = and i16 %655, 1
  %657 = and i16 %623, %610
  %658 = and i16 %657, -32768
  %659 = icmp sgt i16 %657, -1
  br i1 %659, label %683, label %660

660:                                              ; preds = %597
  %661 = lshr i16 %608, 3
  %662 = lshr i16 %621, 4
  %663 = and i16 %661, 1
  %664 = and i16 %663, %662
  %665 = icmp eq i16 %664, 0
  br i1 %665, label %666, label %683

666:                                              ; preds = %660
  %667 = and i16 %608, 16
  %668 = icmp eq i16 %667, 0
  %669 = and i16 %621, 8
  %670 = icmp eq i16 %669, 0
  %671 = or i1 %668, %670
  br i1 %671, label %672, label %683

672:                                              ; preds = %666
  %673 = and i16 %651, 1
  %674 = and i16 %673, %654
  %675 = icmp eq i16 %674, 0
  br i1 %675, label %676, label %683

676:                                              ; preds = %672
  %677 = and i16 %608, 64
  %678 = icmp eq i16 %677, 0
  %679 = and i16 %621, 32
  %680 = icmp eq i16 %679, 0
  %681 = or i1 %678, %680
  %682 = select i1 %681, i16 -32768, i16 0
  br label %683

683:                                              ; preds = %676, %672, %666, %660, %597
  %684 = phi i16 [ 0, %597 ], [ 0, %660 ], [ 0, %666 ], [ 0, %672 ], [ %682, %676 ]
  switch i8 %26, label %ms_apply_andor.exit.thread [
    i8 32, label %685
    i8 33, label %732
    i8 34, label %792
    i8 35, label %834
    i8 36, label %882
    i8 37, label %918
    i8 38, label %962
  ]

685:                                              ; preds = %683
  %686 = icmp ne i16 %624, 1
  %687 = icmp eq i16 %625, 3
  %688 = or i1 %686, %687
  br i1 %688, label %ms_apply_andor.exit.thread, label %689

689:                                              ; preds = %685
  %690 = and i16 %603, 4
  %691 = icmp ne i16 %690, 0
  %692 = and i16 %616, 4
  %693 = icmp ne i16 %692, 0
  %694 = and i16 %616, 8
  %695 = icmp ne i16 %694, 0
  %696 = and i1 %691, %695
  %697 = and i16 %603, 8
  %698 = icmp ne i16 %697, 0
  %699 = and i1 %698, %693
  %700 = or i1 %696, %699
  %701 = icmp ne i16 %631, 0
  %702 = and i16 %616, 16
  %703 = icmp ne i16 %702, 0
  %704 = and i1 %691, %703
  %705 = or i1 %701, %704
  %706 = and i16 %603, 128
  %707 = or disjoint i16 %640, %706
  %708 = icmp eq i16 %707, 0
  %709 = or disjoint i16 %641, %706
  %710 = icmp eq i16 %709, 0
  %711 = select i1 %700, i16 8, i16 0
  %712 = select i1 %705, i16 16, i16 0
  %713 = shl nuw nsw i16 %637, 6
  %714 = select i1 %708, i16 0, i16 128
  %715 = select i1 %710, i16 0, i16 256
  %716 = and i16 %657, 1028
  %717 = or disjoint i16 %716, %713
  %718 = or disjoint i16 %717, %711
  %719 = or disjoint i16 %718, %712
  %720 = or disjoint i16 %719, %714
  %721 = or disjoint i16 %720, %715
  %722 = shl nuw nsw i16 %648, 11
  %723 = shl nuw nsw i16 %650, 12
  %724 = shl nuw nsw i16 %653, 13
  %725 = shl nuw nsw i16 %656, 14
  %726 = or disjoint i16 %722, %723
  %727 = or disjoint i16 %726, %724
  %728 = or disjoint i16 %727, %725
  %729 = or i16 %728, %721
  %730 = or i16 %729, %625
  %731 = or i16 %730, %684
  br label %1010

732:                                              ; preds = %683
  %733 = icmp ne i16 %624, 0
  %734 = icmp ne i16 %625, 3
  %735 = or i1 %733, %734
  br i1 %735, label %ms_apply_andor.exit.thread, label %736

736:                                              ; preds = %732
  %737 = and i16 %627, %626
  %738 = and i16 %626, 1
  %739 = and i16 %738, %629
  %740 = icmp eq i16 %739, 0
  %741 = and i16 %627, %628
  %742 = shl nuw i16 %741, 3
  %743 = and i16 %742, 8
  %744 = icmp eq i16 %631, 0
  %745 = shl i16 %626, 4
  %746 = and i16 %616, 16
  %747 = and i16 %746, %745
  %748 = and i16 %634, %632
  %749 = or i16 %639, %638
  %750 = or i16 %638, %621
  %751 = and i16 %608, 1
  %752 = and i16 %751, %750
  %753 = icmp eq i16 %752, 0
  %754 = and i16 %639, %621
  %755 = shl nuw i16 %754, 8
  %756 = and i16 %755, 256
  %757 = and i16 %642, 1
  %758 = and i16 %757, %638
  %759 = and i16 %758, %643
  %760 = icmp eq i16 %759, 0
  %761 = shl nuw nsw i16 %640, 9
  %762 = and i16 %645, %644
  %763 = shl nuw i16 %737, 2
  %764 = and i16 %763, 4
  %765 = select i1 %740, i16 %743, i16 8
  %766 = select i1 %744, i16 %747, i16 16
  %767 = shl nuw i16 %748, 5
  %768 = and i16 %767, 32
  %769 = shl nuw i16 %749, 7
  %770 = and i16 %769, 128
  %771 = select i1 %753, i16 %756, i16 256
  %772 = select i1 %760, i16 0, i16 %761
  %773 = shl nuw i16 %762, 10
  %774 = and i16 %773, 1024
  %775 = shl nuw nsw i16 %648, 11
  %776 = shl nuw nsw i16 %650, 12
  %777 = shl nuw nsw i16 %653, 13
  %778 = shl nuw nsw i16 %656, 14
  %779 = or disjoint i16 %766, %774
  %780 = or disjoint i16 %779, %768
  %781 = or disjoint i16 %780, %764
  %782 = or disjoint i16 %781, %770
  %783 = add nuw nsw i16 %782, %775
  %784 = add nuw nsw i16 %783, %776
  %785 = add nuw nsw i16 %784, %777
  %786 = add nuw nsw i16 %785, %778
  %787 = add nuw i16 %786, %772
  %788 = add nuw i16 %787, %765
  %789 = add nuw i16 %788, %771
  %790 = or i16 %789, %684
  %791 = or i16 %790, 64
  br label %1010

792:                                              ; preds = %683
  %793 = icmp eq i16 %633, 0
  %794 = and i16 %603, 67
  %795 = icmp ne i16 %794, 64
  %796 = or i1 %795, %793
  %797 = icmp ne i16 %625, 0
  %798 = or i1 %797, %796
  br i1 %798, label %ms_apply_andor.exit.thread, label %799

799:                                              ; preds = %792
  %800 = and i16 %627, %626
  %801 = and i16 %627, %628
  %802 = or i16 %639, %638
  %803 = or i16 %638, %621
  %804 = and i16 %645, %644
  %805 = and i16 %804, 1
  %806 = icmp eq i16 %805, 0
  %807 = shl i16 %642, 10
  %808 = and i16 %807, 1024
  %809 = shl nuw i16 %800, 2
  %810 = and i16 %809, 4
  %811 = shl nuw i16 %801, 3
  %812 = and i16 %811, 8
  %813 = or disjoint i16 %810, %812
  %814 = shl nuw nsw i16 %637, 6
  %815 = or disjoint i16 %813, %814
  %816 = shl nuw i16 %802, 7
  %817 = and i16 %816, 128
  %818 = or disjoint i16 %815, %817
  %819 = shl i16 %803, 9
  %820 = and i16 %819, 512
  %821 = or disjoint i16 %818, %820
  %822 = select i1 %806, i16 0, i16 %808
  %823 = or disjoint i16 %821, %822
  %824 = shl nuw nsw i16 %648, 11
  %825 = or disjoint i16 %823, %824
  %826 = shl nuw nsw i16 %650, 12
  %827 = shl nuw nsw i16 %653, 13
  %828 = shl nuw nsw i16 %656, 14
  %829 = or disjoint i16 %826, %827
  %830 = or disjoint i16 %829, %828
  %831 = or i16 %830, %825
  %832 = or i16 %831, %684
  %833 = or i16 %832, 32
  br label %1010

834:                                              ; preds = %683
  %835 = icmp ne i16 %624, 0
  %836 = icmp eq i16 %633, 0
  %837 = or i1 %835, %836
  %838 = icmp ne i16 %625, 3
  %839 = or i1 %838, %837
  %840 = icmp eq i16 %635, 0
  %841 = or i1 %840, %839
  br i1 %841, label %ms_apply_andor.exit.thread, label %842

842:                                              ; preds = %834
  %843 = and i16 %627, %626
  %844 = and i16 %626, 1
  %845 = and i16 %844, %629
  %846 = icmp eq i16 %845, 0
  %847 = and i16 %627, %628
  %848 = shl nuw i16 %847, 3
  %849 = and i16 %848, 8
  %850 = and i16 %639, %638
  %851 = and i16 %643, %642
  %852 = and i16 %645, %644
  %853 = and i16 %852, 1
  %854 = and i16 %853, %642
  %855 = and i16 %854, %643
  %856 = icmp eq i16 %855, 0
  %857 = or i16 %639, %638
  %858 = shl i16 %857, 10
  %859 = and i16 %858, 1024
  %860 = shl nuw i16 %843, 2
  %861 = and i16 %860, 4
  %862 = select i1 %846, i16 %849, i16 8
  %863 = shl nuw i16 %850, 7
  %864 = and i16 %863, 128
  %865 = shl nuw i16 %851, 9
  %866 = and i16 %865, 512
  %867 = select i1 %856, i16 0, i16 %859
  %868 = shl nuw nsw i16 %648, 11
  %869 = shl nuw nsw i16 %650, 12
  %870 = shl nuw nsw i16 %653, 13
  %871 = shl nuw nsw i16 %656, 14
  %872 = or disjoint i16 %870, %866
  %873 = or disjoint i16 %872, %869
  %874 = or disjoint i16 %873, %871
  %875 = or disjoint i16 %874, %861
  %876 = or disjoint i16 %875, %864
  %877 = or disjoint i16 %876, %868
  %878 = add nuw i16 %877, %862
  %879 = add nuw i16 %878, %867
  %880 = or i16 %658, %879
  %881 = or i16 %880, 96
  br label %1010

882:                                              ; preds = %683
  %883 = and i16 %603, 99
  %884 = icmp ne i16 %883, 96
  %885 = icmp ne i16 %625, 1
  %886 = or i1 %884, %885
  br i1 %886, label %ms_apply_andor.exit.thread, label %887

887:                                              ; preds = %882
  %888 = and i16 %627, %626
  %889 = and i16 %627, %628
  %890 = and i16 %639, %638
  %891 = and i16 %645, %644
  %892 = and i16 %891, 1
  %893 = and i16 %892, %642
  %894 = icmp eq i16 %893, 0
  %895 = or i16 %639, %638
  %896 = shl i16 %895, 10
  %897 = and i16 %896, 1024
  %898 = shl nuw i16 %888, 2
  %899 = and i16 %898, 4
  %900 = shl nuw i16 %889, 3
  %901 = and i16 %900, 8
  %902 = shl nuw i16 %890, 7
  %903 = and i16 %902, 128
  %904 = select i1 %894, i16 0, i16 %897
  %905 = shl nuw nsw i16 %648, 11
  %906 = shl nuw nsw i16 %650, 12
  %907 = shl nuw nsw i16 %653, 13
  %908 = or disjoint i16 %899, %901
  %909 = or disjoint i16 %908, %903
  %910 = or disjoint i16 %909, %905
  %911 = or disjoint i16 %910, %906
  %912 = or disjoint i16 %911, %907
  %913 = or disjoint i16 %912, %904
  %914 = shl nuw nsw i16 %656, 14
  %915 = or i16 %914, %913
  %916 = or i16 %915, %658
  %917 = or i16 %916, 257
  br label %1010

918:                                              ; preds = %683
  %919 = and i16 %603, 96
  %920 = icmp ne i16 %919, 96
  %921 = and i16 %646, 3
  %922 = icmp ne i16 %921, 0
  %923 = or i1 %920, %922
  br i1 %923, label %ms_apply_andor.exit.thread, label %924

924:                                              ; preds = %918
  %925 = and i16 %627, %626
  %926 = and i16 %627, %628
  %927 = and i16 %639, %638
  %928 = and i16 %645, %644
  %929 = and i16 %928, 1
  %930 = and i16 %929, %642
  %931 = icmp eq i16 %930, 0
  %932 = or i16 %639, %638
  %933 = shl i16 %932, 10
  %934 = and i16 %933, 1024
  %935 = shl nuw i16 %925, 2
  %936 = and i16 %935, 4
  %937 = shl nuw i16 %926, 3
  %938 = and i16 %937, 8
  %939 = or disjoint i16 %936, %938
  %940 = shl nuw nsw i16 %635, 5
  %941 = or disjoint i16 %939, %940
  %942 = shl nuw nsw i16 %637, 6
  %943 = or disjoint i16 %941, %942
  %944 = shl nuw i16 %927, 7
  %945 = and i16 %944, 128
  %946 = or disjoint i16 %943, %945
  %947 = shl nuw nsw i16 %641, 8
  %948 = or disjoint i16 %946, %947
  %949 = and i16 %622, 512
  %950 = or disjoint i16 %948, %949
  %951 = select i1 %931, i16 0, i16 %934
  %952 = shl nuw nsw i16 %648, 11
  %953 = shl nuw nsw i16 %650, 12
  %954 = shl nuw nsw i16 %653, 13
  %955 = shl nuw nsw i16 %656, 14
  %956 = or disjoint i16 %952, %953
  %957 = or disjoint i16 %956, %954
  %958 = or disjoint i16 %957, %955
  %959 = or disjoint i16 %958, %951
  %960 = or i16 %959, %950
  %961 = or i16 %960, %658
  br label %1010

962:                                              ; preds = %683
  %963 = icmp ne i16 %624, 3
  %964 = icmp eq i16 %624, %625
  %965 = and i1 %963, %964
  br i1 %965, label %966, label %ms_apply_andor.exit.thread

966:                                              ; preds = %962
  %967 = and i16 %627, %626
  %968 = or i16 %634, %632
  %969 = and i16 %639, %638
  %970 = and i16 %621, %608
  %971 = and i16 %642, 1
  %972 = and i16 %971, %621
  %973 = icmp eq i16 %972, 0
  %974 = and i16 %643, %608
  %975 = shl nuw i16 %974, 9
  %976 = and i16 %975, 512
  %977 = and i16 %645, %644
  %978 = and i16 %977, 1
  %979 = icmp eq i16 %978, 0
  %980 = or i16 %639, %638
  %981 = shl i16 %980, 10
  %982 = and i16 %981, 1024
  %983 = shl i16 %967, 3
  %984 = and i16 %983, 8
  %985 = shl nuw i16 %968, 5
  %986 = and i16 %985, 32
  %987 = and i16 %657, 64
  %988 = shl nuw i16 %969, 7
  %989 = and i16 %988, 128
  %990 = shl nuw i16 %970, 8
  %991 = and i16 %990, 256
  %992 = select i1 %973, i16 %976, i16 512
  %993 = select i1 %979, i16 0, i16 %982
  %994 = shl nuw nsw i16 %648, 11
  %995 = shl nuw nsw i16 %650, 12
  %996 = shl nuw nsw i16 %653, 13
  %997 = shl nuw nsw i16 %656, 14
  %998 = or disjoint i16 %987, %991
  %999 = or disjoint i16 %998, %984
  %1000 = or disjoint i16 %999, %986
  %1001 = or disjoint i16 %1000, %989
  %1002 = or disjoint i16 %1001, %994
  %1003 = or disjoint i16 %1002, %995
  %1004 = or disjoint i16 %992, %996
  %1005 = or disjoint i16 %1004, %997
  %1006 = or disjoint i16 %1005, %993
  %1007 = or i16 %1006, %1003
  %1008 = or i16 %1007, %624
  %1009 = or i16 %1008, %658
  br label %1010

1010:                                             ; preds = %966, %924, %887, %842, %799, %736, %689
  %1011 = phi i16 [ %1009, %966 ], [ %961, %924 ], [ %917, %887 ], [ %881, %842 ], [ %833, %799 ], [ %791, %736 ], [ %731, %689 ]
  %1012 = icmp eq i16 %1011, -1
  br i1 %1012, label %ms_apply_andor.exit.thread, label %1013

1013:                                             ; preds = %1010
  %1014 = trunc i16 %1011 to i8
  store i8 %1014, ptr %601, align 1, !tbaa !2
  %1015 = lshr i16 %1011, 8
  %1016 = trunc i16 %1015 to i8
  store i8 %1016, ptr %606, align 1, !tbaa !2
  br label %1162

1017:                                             ; preds = %592
  %1018 = icmp ne i8 %26, 39
  %1019 = icmp ult i32 %19, 3
  %1020 = select i1 %1018, i1 true, i1 %1019
  br i1 %1020, label %ms_apply_andor.exit.thread, label %1021

1021:                                             ; preds = %1017
  %1022 = shl i32 %19, 1
  %1023 = add i32 %1022, -6
  %1024 = zext i32 %1023 to i64
  %1025 = getelementptr inbounds i8, ptr %4, i64 %1024
  %1026 = load i8, ptr %1025, align 1, !tbaa !2
  %1027 = zext i8 %1026 to i16
  %1028 = or disjoint i32 %1023, 1
  %1029 = zext i32 %1028 to i64
  %1030 = getelementptr inbounds i8, ptr %4, i64 %1029
  %1031 = load i8, ptr %1030, align 1, !tbaa !2
  %1032 = zext i8 %1031 to i16
  %1033 = shl nuw i16 %1032, 8
  %1034 = or disjoint i16 %1033, %1027
  %1035 = add i32 %19, -2
  %1036 = shl i32 %1035, 1
  %1037 = zext i32 %1036 to i64
  %1038 = getelementptr inbounds i8, ptr %4, i64 %1037
  %1039 = load i8, ptr %1038, align 1, !tbaa !2
  %1040 = zext i8 %1039 to i16
  %1041 = or disjoint i32 %1036, 1
  %1042 = zext i32 %1041 to i64
  %1043 = getelementptr inbounds i8, ptr %4, i64 %1042
  %1044 = load i8, ptr %1043, align 1, !tbaa !2
  %1045 = zext i8 %1044 to i16
  %1046 = shl nuw i16 %1045, 8
  %1047 = or disjoint i16 %1046, %1040
  %1048 = add i32 %1022, -2
  %1049 = zext i32 %1048 to i64
  %1050 = getelementptr inbounds i8, ptr %4, i64 %1049
  %1051 = load i8, ptr %1050, align 1, !tbaa !2
  %1052 = zext i8 %1051 to i16
  %1053 = or disjoint i32 %1048, 1
  %1054 = zext i32 %1053 to i64
  %1055 = getelementptr inbounds i8, ptr %4, i64 %1054
  %1056 = load i8, ptr %1055, align 1, !tbaa !2
  %1057 = zext i8 %1056 to i16
  %1058 = shl nuw i16 %1057, 8
  %1059 = or disjoint i16 %1058, %1052
  %1060 = and i16 %1040, 3
  %1061 = and i16 %1052, 3
  %1062 = lshr i16 %1052, 2
  %1063 = and i16 %1062, 1
  %1064 = and i16 %1052, 32
  %1065 = and i16 %1059, %1047
  %1066 = and i16 %1065, %1034
  %1067 = icmp sgt i16 %1066, -1
  br i1 %1067, label %1093, label %1068

1068:                                             ; preds = %1021
  %1069 = and i16 %1032, 8
  %1070 = icmp eq i16 %1069, 0
  %1071 = and i16 %1045, 16
  %1072 = icmp eq i16 %1071, 0
  %1073 = or i1 %1070, %1072
  br i1 %1073, label %1074, label %1093

1074:                                             ; preds = %1068
  %1075 = and i16 %1032, 16
  %1076 = icmp eq i16 %1075, 0
  %1077 = and i16 %1045, 8
  %1078 = icmp eq i16 %1077, 0
  %1079 = or i1 %1076, %1078
  br i1 %1079, label %1080, label %1093

1080:                                             ; preds = %1074
  %1081 = and i16 %1032, 32
  %1082 = icmp eq i16 %1081, 0
  %1083 = and i16 %1045, 64
  %1084 = icmp eq i16 %1083, 0
  %1085 = or i1 %1082, %1084
  br i1 %1085, label %1086, label %1093

1086:                                             ; preds = %1080
  %1087 = and i16 %1032, 64
  %1088 = icmp eq i16 %1087, 0
  br i1 %1088, label %1093, label %1089

1089:                                             ; preds = %1086
  %1090 = shl i16 %1045, 10
  %1091 = and i16 %1090, -32768
  %1092 = xor i16 %1091, -32768
  br label %1093

1093:                                             ; preds = %1089, %1086, %1080, %1074, %1068, %1021
  %1094 = phi i16 [ 0, %1021 ], [ -32768, %1086 ], [ %1092, %1089 ], [ 0, %1068 ], [ 0, %1074 ], [ 0, %1080 ]
  %1095 = and i16 %1027, 99
  %1096 = icmp eq i16 %1095, 96
  br i1 %1096, label %1097, label %ms_apply_andor.exit.thread

1097:                                             ; preds = %1093
  %1098 = icmp ne i16 %1060, %1061
  %1099 = icmp eq i16 %1060, 3
  %1100 = or i1 %1099, %1098
  br i1 %1100, label %ms_apply_andor.exit.thread, label %ms_apply_andor.exit

ms_apply_andor.exit:                              ; preds = %1097
  %1101 = and i16 %1027, 4
  %1102 = icmp ne i16 %1101, 0
  %1103 = and i16 %1040, 4
  %1104 = icmp ne i16 %1103, 0
  %1105 = and i16 %1101, %1040
  %1106 = icmp eq i16 %1105, 0
  %1107 = shl nuw nsw i16 %1063, 2
  %1108 = and i16 %1065, 8
  %1109 = icmp ne i16 %1108, 0
  %1110 = and i1 %1102, %1109
  %1111 = and i16 %1027, 8
  %1112 = icmp ne i16 %1111, 0
  %1113 = and i1 %1112, %1104
  %1114 = shl nuw nsw i16 %1063, 3
  %1115 = select i1 %1113, i16 %1114, i16 0
  %1116 = and i16 %1065, 64
  %1117 = icmp sgt i8 %1051, -1
  %1118 = and i16 %1027, 128
  %1119 = or i16 %1047, %1034
  %1120 = and i16 %1119, 128
  %1121 = icmp eq i16 %1120, 0
  %1122 = and i16 %1057, 1
  %1123 = icmp eq i16 %1122, 0
  %1124 = shl nuw nsw i16 %1120, 1
  %1125 = and i16 %1057, 2
  %1126 = icmp ne i16 %1125, 0
  %1127 = and i16 %1046, 256
  %1128 = or disjoint i16 %1127, %1118
  %1129 = icmp ne i16 %1128, 0
  %1130 = select i1 %1126, i1 %1129, i1 false
  %1131 = and i16 %1066, 1024
  %1132 = icmp ne i16 %1131, 0
  %1133 = and i16 %1032, 2
  %1134 = icmp ne i16 %1133, 0
  %1135 = and i1 %1134, %1132
  %1136 = shl nuw nsw i16 %1052, 3
  %1137 = and i16 %1136, 1024
  %1138 = select i1 %1121, i16 %1137, i16 1024
  %1139 = or i16 %1119, %1058
  %1140 = select i1 %1106, i16 0, i16 %1107
  %1141 = select i1 %1110, i16 8, i16 %1115
  %1142 = select i1 %1117, i16 0, i16 %1120
  %1143 = select i1 %1123, i16 0, i16 %1124
  %1144 = select i1 %1130, i16 512, i16 0
  %1145 = select i1 %1135, i16 %1138, i16 0
  %1146 = and i16 %1139, 30720
  %1147 = or disjoint i16 %1146, %1064
  %1148 = or disjoint i16 %1147, %1140
  %1149 = or disjoint i16 %1148, %1142
  %1150 = or disjoint i16 %1149, %1116
  %1151 = or i16 %1150, %1143
  %1152 = or i16 %1151, %1144
  %1153 = or i16 %1152, %1141
  %1154 = or i16 %1153, %1145
  %1155 = or i16 %1154, %1094
  %1156 = or i16 %1155, %1060
  %1157 = icmp eq i16 %1156, -1
  br i1 %1157, label %ms_apply_andor.exit.thread, label %1158

1158:                                             ; preds = %ms_apply_andor.exit
  %1159 = trunc i16 %1156 to i8
  store i8 %1159, ptr %1025, align 1, !tbaa !2
  %1160 = lshr i16 %1155, 8
  %1161 = trunc i16 %1160 to i8
  store i8 %1161, ptr %1030, align 1, !tbaa !2
  br label %1162

1162:                                             ; preds = %1158, %1013, %588, %329, %324, %324, %324, %324, %324, %312, %297, %105, %89, %67, %45, %28
  %1163 = phi i32 [ %33, %105 ], [ %33, %89 ], [ %33, %297 ], [ %33, %67 ], [ %33, %45 ], [ %33, %28 ], [ %23, %329 ], [ %23, %1013 ], [ %23, %1158 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ %23, %588 ], [ %23, %312 ]
  %1164 = phi i32 [ %32, %105 ], [ %32, %89 ], [ %32, %297 ], [ %32, %67 ], [ %32, %45 ], [ %32, %28 ], [ %22, %329 ], [ %22, %1013 ], [ %22, %1158 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ 0, %324 ], [ %22, %588 ], [ %22, %312 ]
  %1165 = phi i8 [ 13, %105 ], [ 12, %89 ], [ %21, %297 ], [ 7, %67 ], [ 6, %45 ], [ %21, %28 ], [ %21, %329 ], [ %21, %1013 ], [ %21, %1158 ], [ %26, %324 ], [ %26, %324 ], [ %26, %324 ], [ %26, %324 ], [ %26, %324 ], [ %21, %588 ], [ %21, %312 ]
  %1166 = phi i32 [ 0, %105 ], [ 0, %89 ], [ 0, %297 ], [ 0, %67 ], [ 0, %45 ], [ %34, %28 ], [ 0, %329 ], [ 0, %1013 ], [ 0, %1158 ], [ 4, %324 ], [ 4, %324 ], [ 4, %324 ], [ 4, %324 ], [ 4, %324 ], [ 0, %588 ], [ 0, %312 ]
  %1167 = phi i32 [ %106, %105 ], [ %90, %89 ], [ %298, %297 ], [ %69, %67 ], [ %48, %45 ], [ %19, %28 ], [ %330, %329 ], [ %611, %1013 ], [ %1035, %1158 ], [ %19, %324 ], [ %19, %324 ], [ %19, %324 ], [ %19, %324 ], [ %19, %324 ], [ %19, %588 ], [ %314, %312 ]
  %1168 = icmp eq i64 %24, %16
  br i1 %1168, label %1169, label %17

1169:                                             ; preds = %1162
  %1170 = icmp ne i32 %1166, 0
  %1171 = icmp ne i32 %1167, 1
  %1172 = select i1 %1170, i1 true, i1 %1171
  br i1 %1172, label %ms_apply_andor.exit.thread, label %1173

1173:                                             ; preds = %1169
  %1174 = load i8, ptr %4, align 1, !tbaa !2
  %1175 = and i8 %1174, 3
  %1176 = icmp eq i8 %1175, 0
  br i1 %1176, label %1177, label %1193

1177:                                             ; preds = %1173
  %1178 = getelementptr inbounds i8, ptr %4, i64 1
  %1179 = load i8, ptr %1178, align 1, !tbaa !2
  %1180 = icmp sgt i8 %1179, -1
  br i1 %1180, label %1193, label %1181

1181:                                             ; preds = %1177
  %1182 = zext i8 %3 to i32
  %1183 = and i32 %1182, 1
  %1184 = icmp ne i32 %1183, 0
  %1185 = and i8 %1179, 4
  %1186 = icmp eq i8 %1185, 0
  %1187 = and i1 %1184, %1186
  br i1 %1187, label %1193, label %1188

1188:                                             ; preds = %1181
  %1189 = and i32 %1182, 2
  %1190 = icmp ne i32 %1189, 0
  %1191 = icmp sgt i8 %1174, -1
  %1192 = and i1 %1190, %1191
  br i1 %1192, label %1193, label %ms_apply_andor.exit.thread

1193:                                             ; preds = %1188, %1181, %1177, %1173
  br label %ms_apply_andor.exit.thread

ms_apply_andor.exit.thread:                       ; preds = %1093, %1097, %ms_apply_andor.exit, %1017, %1010, %962, %918, %882, %834, %792, %732, %685, %683, %595, %585, %564, %537, %514, %493, %474, %453, %429, %404, %381, %342, %340, %327, %304, %.loopexit, %120, %114, %113, %99, %97, %83, %81, %63, %37, %182, %.preheader, %1193, %1188, %1169, %5
  %1194 = phi i8 [ 0, %5 ], [ 0, %1169 ], [ 0, %1193 ], [ 1, %1188 ], [ 0, %.preheader ], [ 0, %182 ], [ 0, %37 ], [ 0, %63 ], [ 0, %81 ], [ 0, %83 ], [ 0, %97 ], [ 0, %99 ], [ 0, %113 ], [ 0, %114 ], [ 0, %120 ], [ 0, %.loopexit ], [ 0, %304 ], [ 0, %327 ], [ 0, %340 ], [ 0, %342 ], [ 0, %381 ], [ 0, %404 ], [ 0, %429 ], [ 0, %453 ], [ 0, %474 ], [ 0, %493 ], [ 0, %514 ], [ 0, %537 ], [ 0, %564 ], [ 0, %585 ], [ 0, %595 ], [ 0, %683 ], [ 0, %685 ], [ 0, %732 ], [ 0, %792 ], [ 0, %834 ], [ 0, %882 ], [ 0, %918 ], [ 0, %962 ], [ 0, %1010 ], [ 0, %1017 ], [ 0, %ms_apply_andor.exit ], [ 0, %1097 ], [ 0, %1093 ]
  ret i8 %1194
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef i64 @llb_psbt_locktime_init() local_unnamed_addr #0 {
  ret i64 -9223372036854775808
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
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
  %18 = icmp ult i32 %17, -499999999
  %19 = and i1 %16, %18
  br i1 %19, label %73, label %20

20:                                               ; preds = %15
  %21 = icmp ne i8 %3, 0
  %22 = icmp ult i32 %4, 500000000
  %23 = and i1 %21, %22
  br i1 %23, label %73, label %24

24:                                               ; preds = %20
  %25 = or i8 %3, %1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %73, label %27

27:                                               ; preds = %24
  %28 = and i1 %16, %21
  br i1 %28, label %29, label %56

29:                                               ; preds = %27
  %30 = icmp eq i64 %7, 0
  br i1 %30, label %31, label %37

31:                                               ; preds = %29
  %32 = zext i32 %2 to i64
  %33 = shl nuw i64 %32, 32
  %34 = zext i32 %4 to i64
  %35 = or disjoint i64 %33, %34
  %36 = or i64 %35, -6917529027641081856
  br label %73

37:                                               ; preds = %29
  br i1 %8, label %38, label %46

38:                                               ; preds = %37
  %39 = tail call i32 @llvm.umax.i32(i32 %11, i32 %2)
  %40 = zext i32 %39 to i64
  %41 = shl nuw i64 %40, 32
  %42 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %43 = zext i32 %42 to i64
  %44 = or disjoint i64 %41, %43
  %45 = or i64 %44, -6917529027641081856
  br label %73

46:                                               ; preds = %37
  %47 = icmp eq i64 %7, 2
  br i1 %47, label %48, label %52

48:                                               ; preds = %46
  %49 = tail call i32 @llvm.umax.i32(i32 %12, i32 %2)
  %50 = zext i32 %49 to i64
  %51 = or disjoint i64 %50, -4611686018427387904
  br label %73

52:                                               ; preds = %46
  %53 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %54 = zext i32 %53 to i64
  %55 = or disjoint i64 %54, -2305843009213693952
  br label %73

56:                                               ; preds = %27
  br i1 %16, label %57, label %65

57:                                               ; preds = %56
  switch i64 %7, label %61 [
    i64 0, label %58
    i64 3, label %73
  ]

58:                                               ; preds = %57
  %59 = zext i32 %2 to i64
  %60 = or disjoint i64 %59, -4611686018427387904
  br label %73

61:                                               ; preds = %57
  %62 = tail call i32 @llvm.umax.i32(i32 %13, i32 %2)
  %63 = zext i32 %62 to i64
  %64 = or disjoint i64 %63, -4611686018427387904
  br label %73

65:                                               ; preds = %56
  switch i64 %7, label %73 [
    i64 0, label %66
    i64 3, label %69
    i64 1, label %69
  ]

66:                                               ; preds = %65
  %67 = zext i32 %4 to i64
  %68 = or disjoint i64 %67, -2305843009213693952
  br label %73

69:                                               ; preds = %65, %65
  %70 = tail call i32 @llvm.umax.i32(i32 %12, i32 %4)
  %71 = zext i32 %70 to i64
  %72 = or disjoint i64 %71, -2305843009213693952
  br label %73

73:                                               ; preds = %69, %66, %65, %61, %58, %57, %52, %48, %38, %31, %24, %20, %15, %5
  %74 = phi i64 [ %36, %31 ], [ %45, %38 ], [ %51, %48 ], [ %55, %52 ], [ %60, %58 ], [ %64, %61 ], [ %68, %66 ], [ %72, %69 ], [ 0, %5 ], [ 0, %15 ], [ 0, %20 ], [ %0, %24 ], [ 0, %57 ], [ 0, %65 ]
  ret i64 %74
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden i64 @llb_psbt_locktime_finalize(i64 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i64 %0, 0
  br i1 %3, label %17, label %4

4:                                                ; preds = %2
  %5 = lshr i64 %0, 61
  %6 = and i64 %5, 3
  switch i64 %6, label %11 [
    i64 0, label %13
    i64 1, label %7
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

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: read)
define hidden i64 @llb_psbt_determine_locktime(ptr noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = icmp eq ptr %0, null
  %5 = icmp ne i32 %1, 0
  %6 = and i1 %4, %5
  %7 = icmp ugt i32 %1, 429496729
  %8 = or i1 %7, %6
  br i1 %8, label %llb_psbt_locktime_step.exit, label %9

9:                                                ; preds = %3
  %10 = icmp eq i32 %1, 0
  br i1 %10, label %102, label %11

11:                                               ; preds = %9
  %12 = zext nneg i32 %1 to i64
  br label %16

13:                                               ; preds = %51, %58, %68, %72, %78, %81, %86, %89, %44
  %.ph = phi i64 [ %18, %44 ], [ %92, %89 ], [ %88, %86 ], [ %84, %81 ], [ %80, %78 ], [ %75, %72 ], [ %71, %68 ], [ %65, %58 ], [ %56, %51 ]
  %14 = add nuw nsw i64 %17, 1
  %15 = icmp eq i64 %14, %12
  br i1 %15, label %93, label %16

16:                                               ; preds = %13, %11
  %17 = phi i64 [ 0, %11 ], [ %14, %13 ]
  %18 = phi i64 [ -9223372036854775808, %11 ], [ %.ph, %13 ]
  %19 = mul nuw nsw i64 %17, 10
  %20 = getelementptr inbounds i8, ptr %0, i64 %19
  %21 = load i8, ptr %20, align 1, !tbaa !2
  %22 = getelementptr inbounds i8, ptr %20, i64 1
  %23 = load i32, ptr %22, align 1
  %24 = getelementptr inbounds i8, ptr %20, i64 5
  %25 = load i8, ptr %24, align 1, !tbaa !2
  %26 = getelementptr inbounds i8, ptr %20, i64 6
  %27 = load i32, ptr %26, align 1
  %28 = lshr i64 %18, 61
  %29 = and i64 %28, 3
  %30 = icmp eq i64 %29, 1
  %31 = lshr i64 %18, 32
  %32 = trunc i64 %31 to i32
  %33 = and i32 %32, 536870911
  %34 = trunc i64 %18 to i32
  %35 = select i1 %30, i32 %33, i32 %34
  %36 = icmp ne i8 %21, 0
  %37 = add i32 %23, -500000000
  %38 = icmp ult i32 %37, -499999999
  %39 = and i1 %36, %38
  br i1 %39, label %llb_psbt_locktime_step.exit, label %40

40:                                               ; preds = %16
  %41 = icmp ne i8 %25, 0
  %42 = icmp ult i32 %27, 500000000
  %43 = and i1 %41, %42
  br i1 %43, label %llb_psbt_locktime_step.exit, label %44

44:                                               ; preds = %40
  %45 = or i8 %25, %21
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %13, label %47

47:                                               ; preds = %44
  %48 = and i1 %36, %41
  br i1 %48, label %49, label %76

49:                                               ; preds = %47
  %50 = icmp eq i64 %29, 0
  br i1 %50, label %51, label %57

51:                                               ; preds = %49
  %52 = zext i32 %23 to i64
  %53 = shl nuw i64 %52, 32
  %54 = zext i32 %27 to i64
  %55 = or disjoint i64 %53, %54
  %56 = or i64 %55, -6917529027641081856
  br label %13

57:                                               ; preds = %49
  br i1 %30, label %58, label %66

58:                                               ; preds = %57
  %59 = tail call i32 @llvm.umax.i32(i32 %33, i32 %23)
  %60 = zext i32 %59 to i64
  %61 = shl nuw i64 %60, 32
  %62 = tail call i32 @llvm.umax.i32(i32 %34, i32 %27)
  %63 = zext i32 %62 to i64
  %64 = or disjoint i64 %61, %63
  %65 = or i64 %64, -6917529027641081856
  br label %13

66:                                               ; preds = %57
  %67 = icmp eq i64 %29, 2
  br i1 %67, label %68, label %72

68:                                               ; preds = %66
  %69 = tail call i32 @llvm.umax.i32(i32 %34, i32 %23)
  %70 = zext i32 %69 to i64
  %71 = or disjoint i64 %70, -4611686018427387904
  br label %13

72:                                               ; preds = %66
  %73 = tail call i32 @llvm.umax.i32(i32 %34, i32 %27)
  %74 = zext i32 %73 to i64
  %75 = or disjoint i64 %74, -2305843009213693952
  br label %13

76:                                               ; preds = %47
  br i1 %36, label %77, label %85

77:                                               ; preds = %76
  switch i64 %29, label %81 [
    i64 0, label %78
    i64 3, label %llb_psbt_locktime_step.exit
  ]

78:                                               ; preds = %77
  %79 = zext i32 %23 to i64
  %80 = or disjoint i64 %79, -4611686018427387904
  br label %13

81:                                               ; preds = %77
  %82 = tail call i32 @llvm.umax.i32(i32 %35, i32 %23)
  %83 = zext i32 %82 to i64
  %84 = or disjoint i64 %83, -4611686018427387904
  br label %13

85:                                               ; preds = %76
  switch i64 %29, label %llb_psbt_locktime_step.exit [
    i64 0, label %86
    i64 3, label %89
    i64 1, label %89
  ]

86:                                               ; preds = %85
  %87 = zext i32 %27 to i64
  %88 = or disjoint i64 %87, -2305843009213693952
  br label %13

89:                                               ; preds = %85, %85
  %90 = tail call i32 @llvm.umax.i32(i32 %34, i32 %27)
  %91 = zext i32 %90 to i64
  %92 = or disjoint i64 %91, -2305843009213693952
  br label %13

93:                                               ; preds = %13
  %94 = lshr i64 %.ph, 61
  %95 = and i64 %94, 3
  switch i64 %95, label %100 [
    i64 0, label %102
    i64 1, label %96
  ]

96:                                               ; preds = %93
  %97 = lshr i64 %.ph, 32
  %98 = trunc i64 %97 to i32
  %99 = and i32 %98, 536870911
  br label %102

100:                                              ; preds = %93
  %101 = trunc i64 %.ph to i32
  br label %102

102:                                              ; preds = %100, %96, %93, %9
  %103 = phi i32 [ %99, %96 ], [ %101, %100 ], [ %2, %93 ], [ %2, %9 ]
  %104 = zext i32 %103 to i64
  %105 = or disjoint i64 %104, 4294967296
  br label %llb_psbt_locktime_step.exit

llb_psbt_locktime_step.exit:                      ; preds = %85, %77, %40, %16, %102, %3
  %106 = phi i64 [ %105, %102 ], [ 0, %3 ], [ 0, %16 ], [ 0, %40 ], [ 0, %77 ], [ 0, %85 ]
  ret i64 %106
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: read)
define hidden zeroext i8 @llb_bytes_eq(ptr noundef readonly %0, ptr noundef readonly %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %74, label %5

5:                                                ; preds = %3
  %6 = icmp eq ptr %0, null
  %7 = icmp eq ptr %1, null
  %8 = or i1 %6, %7
  br i1 %8, label %74, label %9

9:                                                ; preds = %5
  %10 = zext i32 %2 to i64
  %11 = icmp ult i32 %2, 8
  br i1 %11, label %.preheader, label %12

12:                                               ; preds = %9
  %13 = icmp ult i32 %2, 32
  br i1 %13, label %41, label %14

14:                                               ; preds = %12
  %15 = and i64 %10, 4294967264
  br label %16

16:                                               ; preds = %16, %14
  %17 = phi i64 [ 0, %14 ], [ %32, %16 ]
  %18 = phi <16 x i8> [ zeroinitializer, %14 ], [ %30, %16 ]
  %19 = phi <16 x i8> [ zeroinitializer, %14 ], [ %31, %16 ]
  %20 = getelementptr inbounds i8, ptr %0, i64 %17
  %21 = getelementptr inbounds i8, ptr %20, i64 16
  %22 = load <16 x i8>, ptr %20, align 1, !tbaa !2
  %23 = load <16 x i8>, ptr %21, align 1, !tbaa !2
  %24 = getelementptr inbounds i8, ptr %1, i64 %17
  %25 = getelementptr inbounds i8, ptr %24, i64 16
  %26 = load <16 x i8>, ptr %24, align 1, !tbaa !2
  %27 = load <16 x i8>, ptr %25, align 1, !tbaa !2
  %28 = xor <16 x i8> %26, %22
  %29 = xor <16 x i8> %27, %23
  %30 = or <16 x i8> %28, %18
  %31 = or <16 x i8> %29, %19
  %32 = add nuw nsw i64 %17, 32
  %33 = icmp eq i64 %32, %15
  br i1 %33, label %34, label %16, !llvm.loop !7

34:                                               ; preds = %16
  %35 = or <16 x i8> %31, %30
  %36 = tail call i8 @llvm.vector.reduce.or.v16i8(<16 x i8> %35)
  %37 = icmp eq i64 %15, %10
  br i1 %37, label %.loopexit, label %38

38:                                               ; preds = %34
  %39 = and i64 %10, 24
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %.preheader, label %41

41:                                               ; preds = %38, %12
  %42 = phi i8 [ 0, %12 ], [ %36, %38 ]
  %43 = phi i64 [ 0, %12 ], [ %15, %38 ]
  %44 = and i64 %10, 4294967288
  %45 = insertelement <8 x i8> <i8 poison, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, i8 %42, i64 0
  br label %46

46:                                               ; preds = %46, %41
  %47 = phi i64 [ %43, %41 ], [ %55, %46 ]
  %48 = phi <8 x i8> [ %45, %41 ], [ %54, %46 ]
  %49 = getelementptr inbounds i8, ptr %0, i64 %47
  %50 = load <8 x i8>, ptr %49, align 1, !tbaa !2
  %51 = getelementptr inbounds i8, ptr %1, i64 %47
  %52 = load <8 x i8>, ptr %51, align 1, !tbaa !2
  %53 = xor <8 x i8> %52, %50
  %54 = or <8 x i8> %53, %48
  %55 = add nuw i64 %47, 8
  %56 = icmp eq i64 %55, %44
  br i1 %56, label %57, label %46, !llvm.loop !10

57:                                               ; preds = %46
  %58 = tail call i8 @llvm.vector.reduce.or.v8i8(<8 x i8> %54)
  %59 = icmp eq i64 %44, %10
  br i1 %59, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %57, %38, %9
  %.ph = phi i64 [ %44, %57 ], [ %15, %38 ], [ 0, %9 ]
  %.ph18 = phi i8 [ %58, %57 ], [ %36, %38 ], [ 0, %9 ]
  br label %60

60:                                               ; preds = %.preheader, %60
  %61 = phi i64 [ %69, %60 ], [ %.ph, %.preheader ]
  %62 = phi i8 [ %68, %60 ], [ %.ph18, %.preheader ]
  %63 = getelementptr inbounds i8, ptr %0, i64 %61
  %64 = load i8, ptr %63, align 1, !tbaa !2
  %65 = getelementptr inbounds i8, ptr %1, i64 %61
  %66 = load i8, ptr %65, align 1, !tbaa !2
  %67 = xor i8 %66, %64
  %68 = or i8 %67, %62
  %69 = add nuw nsw i64 %61, 1
  %70 = icmp eq i64 %69, %10
  br i1 %70, label %.loopexit, label %60, !llvm.loop !11

.loopexit:                                        ; preds = %60, %57, %34
  %71 = phi i8 [ %36, %34 ], [ %58, %57 ], [ %68, %60 ]
  %72 = icmp eq i8 %71, 0
  %73 = zext i1 %72 to i8
  br label %74

74:                                               ; preds = %.loopexit, %5, %3
  %75 = phi i8 [ %73, %.loopexit ], [ 1, %3 ], [ 0, %5 ]
  ret i8 %75
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: read)
define hidden zeroext i8 @llb_check_dual_utxo(i64 noundef %0, ptr noundef readonly %1, i32 noundef %2, i64 noundef %3, ptr noundef readonly %4, i32 noundef %5) local_unnamed_addr #3 {
  %7 = icmp ult i64 %0, 2100000000000001
  %8 = icmp eq i64 %0, %3
  %9 = and i1 %7, %8
  %10 = icmp eq i32 %2, %5
  %11 = and i1 %9, %10
  br i1 %11, label %12, label %83

12:                                               ; preds = %6
  %13 = icmp eq i32 %2, 0
  br i1 %13, label %83, label %14

14:                                               ; preds = %12
  %15 = icmp eq ptr %1, null
  %16 = icmp eq ptr %4, null
  %17 = or i1 %15, %16
  br i1 %17, label %83, label %18

18:                                               ; preds = %14
  %19 = zext i32 %2 to i64
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %.preheader, label %21

21:                                               ; preds = %18
  %22 = icmp ult i32 %2, 32
  br i1 %22, label %50, label %23

23:                                               ; preds = %21
  %24 = and i64 %19, 4294967264
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i64 [ 0, %23 ], [ %41, %25 ]
  %27 = phi <16 x i8> [ zeroinitializer, %23 ], [ %39, %25 ]
  %28 = phi <16 x i8> [ zeroinitializer, %23 ], [ %40, %25 ]
  %29 = getelementptr inbounds i8, ptr %1, i64 %26
  %30 = getelementptr inbounds i8, ptr %29, i64 16
  %31 = load <16 x i8>, ptr %29, align 1, !tbaa !2
  %32 = load <16 x i8>, ptr %30, align 1, !tbaa !2
  %33 = getelementptr inbounds i8, ptr %4, i64 %26
  %34 = getelementptr inbounds i8, ptr %33, i64 16
  %35 = load <16 x i8>, ptr %33, align 1, !tbaa !2
  %36 = load <16 x i8>, ptr %34, align 1, !tbaa !2
  %37 = xor <16 x i8> %35, %31
  %38 = xor <16 x i8> %36, %32
  %39 = or <16 x i8> %37, %27
  %40 = or <16 x i8> %38, %28
  %41 = add nuw nsw i64 %26, 32
  %42 = icmp eq i64 %41, %24
  br i1 %42, label %43, label %25, !llvm.loop !12

43:                                               ; preds = %25
  %44 = or <16 x i8> %40, %39
  %45 = tail call i8 @llvm.vector.reduce.or.v16i8(<16 x i8> %44)
  %46 = icmp eq i64 %24, %19
  br i1 %46, label %.loopexit, label %47

47:                                               ; preds = %43
  %48 = and i64 %19, 24
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %.preheader, label %50

50:                                               ; preds = %47, %21
  %51 = phi i8 [ 0, %21 ], [ %45, %47 ]
  %52 = phi i64 [ 0, %21 ], [ %24, %47 ]
  %53 = and i64 %19, 4294967288
  %54 = insertelement <8 x i8> <i8 poison, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, i8 %51, i64 0
  br label %55

55:                                               ; preds = %55, %50
  %56 = phi i64 [ %52, %50 ], [ %64, %55 ]
  %57 = phi <8 x i8> [ %54, %50 ], [ %63, %55 ]
  %58 = getelementptr inbounds i8, ptr %1, i64 %56
  %59 = load <8 x i8>, ptr %58, align 1, !tbaa !2
  %60 = getelementptr inbounds i8, ptr %4, i64 %56
  %61 = load <8 x i8>, ptr %60, align 1, !tbaa !2
  %62 = xor <8 x i8> %61, %59
  %63 = or <8 x i8> %62, %57
  %64 = add nuw i64 %56, 8
  %65 = icmp eq i64 %64, %53
  br i1 %65, label %66, label %55, !llvm.loop !13

66:                                               ; preds = %55
  %67 = tail call i8 @llvm.vector.reduce.or.v8i8(<8 x i8> %63)
  %68 = icmp eq i64 %53, %19
  br i1 %68, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %66, %47, %18
  %.ph = phi i64 [ %53, %66 ], [ %24, %47 ], [ 0, %18 ]
  %.ph18 = phi i8 [ %67, %66 ], [ %45, %47 ], [ 0, %18 ]
  br label %69

69:                                               ; preds = %.preheader, %69
  %70 = phi i64 [ %78, %69 ], [ %.ph, %.preheader ]
  %71 = phi i8 [ %77, %69 ], [ %.ph18, %.preheader ]
  %72 = getelementptr inbounds i8, ptr %1, i64 %70
  %73 = load i8, ptr %72, align 1, !tbaa !2
  %74 = getelementptr inbounds i8, ptr %4, i64 %70
  %75 = load i8, ptr %74, align 1, !tbaa !2
  %76 = xor i8 %75, %73
  %77 = or i8 %76, %71
  %78 = add nuw nsw i64 %70, 1
  %79 = icmp eq i64 %78, %19
  br i1 %79, label %.loopexit, label %69, !llvm.loop !14

.loopexit:                                        ; preds = %69, %66, %43
  %80 = phi i8 [ %45, %43 ], [ %67, %66 ], [ %77, %69 ]
  %81 = icmp eq i8 %80, 0
  %82 = zext i1 %81 to i8
  br label %83

83:                                               ; preds = %.loopexit, %14, %12, %6
  %84 = phi i8 [ 0, %6 ], [ %82, %.loopexit ], [ 1, %12 ], [ 0, %14 ]
  ret i8 %84
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: read)
define hidden i64 @llb_sum_amounts_le64(ptr noundef readonly %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = icmp eq ptr %0, null
  %4 = icmp ne i32 %1, 0
  %5 = and i1 %3, %4
  %6 = icmp ugt i32 %1, 536870911
  %7 = or i1 %6, %5
  br i1 %7, label %.loopexit, label %8

8:                                                ; preds = %2
  %9 = icmp eq i32 %1, 0
  br i1 %9, label %.loopexit, label %10

10:                                               ; preds = %8
  %11 = zext nneg i32 %1 to i64
  br label %12

12:                                               ; preds = %43, %10
  %13 = phi i64 [ 0, %10 ], [ %45, %43 ]
  %14 = phi i64 [ 0, %10 ], [ %44, %43 ]
  %15 = shl nuw nsw i64 %13, 3
  %16 = getelementptr inbounds i8, ptr %0, i64 %15
  %17 = load i32, ptr %16, align 1
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 4
  %20 = load i8, ptr %19, align 1, !tbaa !2
  %21 = zext i8 %20 to i64
  %22 = shl nuw nsw i64 %21, 32
  %23 = or disjoint i64 %22, %18
  %24 = getelementptr inbounds i8, ptr %16, i64 5
  %25 = load i8, ptr %24, align 1, !tbaa !2
  %26 = zext i8 %25 to i64
  %27 = shl nuw nsw i64 %26, 40
  %28 = or disjoint i64 %23, %27
  %29 = getelementptr inbounds i8, ptr %16, i64 6
  %30 = load i8, ptr %29, align 1, !tbaa !2
  %31 = zext i8 %30 to i64
  %32 = shl nuw nsw i64 %31, 48
  %33 = or disjoint i64 %28, %32
  %34 = getelementptr inbounds i8, ptr %16, i64 7
  %35 = load i8, ptr %34, align 1, !tbaa !2
  %36 = zext i8 %35 to i64
  %37 = shl nuw i64 %36, 56
  %38 = or disjoint i64 %33, %37
  %39 = icmp ugt i64 %14, 2100000000000000
  %40 = sub i64 2100000000000000, %14
  %41 = icmp ult i64 %40, %38
  %42 = or i1 %39, %41
  br i1 %42, label %.loopexit, label %43

43:                                               ; preds = %12
  %44 = add i64 %38, %14
  %45 = add nuw nsw i64 %13, 1
  %46 = icmp eq i64 %45, %11
  br i1 %46, label %47, label %12

47:                                               ; preds = %43
  %48 = or i64 %44, -9223372036854775808
  br label %.loopexit

.loopexit:                                        ; preds = %12, %47, %8, %2
  %49 = phi i64 [ 0, %2 ], [ -9223372036854775808, %8 ], [ %48, %47 ], [ 0, %12 ]
  ret i64 %49
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: read)
define hidden zeroext i8 @llb_bip32_check_export_path(ptr noundef readonly %0, i8 noundef zeroext %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = icmp eq ptr %0, null
  %5 = zext i8 %1 to i32
  %6 = add i8 %1, -11
  %7 = icmp ult i8 %6, -9
  %8 = or i1 %4, %7
  br i1 %8, label %.loopexit, label %9

9:                                                ; preds = %3
  %10 = icmp eq i8 %1, 2
  br i1 %10, label %11, label %19

11:                                               ; preds = %9
  %12 = load i32, ptr %0, align 4, !tbaa !15
  %13 = icmp eq i32 %12, -2142942139
  br i1 %13, label %14, label %.loopexit

14:                                               ; preds = %11
  %15 = getelementptr inbounds i32, ptr %0, i64 1
  %16 = load i32, ptr %15, align 4, !tbaa !15
  %17 = icmp eq i32 %16, -1035385550
  %18 = zext i1 %17 to i8
  br label %.loopexit

19:                                               ; preds = %9
  %20 = icmp ugt i8 %1, 3
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds i32, ptr %0, i64 3
  %23 = load i32, ptr %22, align 4, !tbaa !15
  br label %24

24:                                               ; preds = %21, %19
  %25 = phi i32 [ %23, %21 ], [ 0, %19 ]
  %26 = load i32, ptr %0, align 4, !tbaa !15
  %27 = getelementptr inbounds i32, ptr %0, i64 1
  %28 = load i32, ptr %27, align 4, !tbaa !15
  %29 = getelementptr inbounds i32, ptr %0, i64 2
  %30 = load i32, ptr %29, align 4, !tbaa !15
  %31 = and i32 %28, %26
  %32 = and i32 %31, %30
  %33 = icmp sgt i32 %32, -1
  br i1 %33, label %.loopexit, label %34

34:                                               ; preds = %24
  %35 = and i32 %26, 2147483647
  %36 = and i32 %28, 2147483647
  %37 = and i32 %30, 2147483647
  %38 = icmp ne i32 %36, %2
  %39 = icmp ugt i32 %37, 100
  %40 = or i1 %38, %39
  br i1 %40, label %.loopexit, label %41

41:                                               ; preds = %34
  %42 = icmp sgt i32 %26, -1
  br i1 %42, label %47, label %43

43:                                               ; preds = %41
  %44 = and i32 %26, 2147483645
  %45 = icmp eq i32 %44, 84
  br i1 %45, label %57, label %46

46:                                               ; preds = %43
  switch i32 %35, label %47 [
    i32 87, label %57
    i32 49, label %57
    i32 44, label %57
    i32 45, label %57
  ]

47:                                               ; preds = %46, %41
  %48 = icmp ne i32 %35, 48
  %49 = icmp ult i8 %1, 4
  %50 = or i1 %49, %48
  %51 = icmp sgt i32 %25, -1
  %52 = or i1 %51, %50
  br i1 %52, label %.loopexit, label %53

53:                                               ; preds = %47
  %54 = and i32 %25, 2147483647
  %55 = add nsw i32 %54, -3
  %56 = icmp ult i32 %55, -2
  br i1 %56, label %.loopexit, label %57

57:                                               ; preds = %53, %46, %46, %46, %46, %43
  %58 = icmp eq i32 %35, 48
  %59 = select i1 %58, i32 4, i32 3
  %60 = icmp ult i32 %59, %5
  br i1 %60, label %61, label %.loopexit

61:                                               ; preds = %57
  %62 = zext nneg i32 %59 to i64
  %63 = zext nneg i8 %1 to i64
  br label %67

64:                                               ; preds = %67
  %65 = add nuw nsw i64 %68, 1
  %66 = icmp eq i64 %65, %63
  br i1 %66, label %.loopexit, label %67

67:                                               ; preds = %64, %61
  %68 = phi i64 [ %62, %61 ], [ %65, %64 ]
  %69 = getelementptr inbounds i32, ptr %0, i64 %68
  %70 = load i32, ptr %69, align 4, !tbaa !15
  %71 = icmp sgt i32 %70, -1
  br i1 %71, label %64, label %.loopexit

.loopexit:                                        ; preds = %67, %64, %57, %53, %47, %34, %24, %14, %11, %3
  %72 = phi i8 [ 0, %3 ], [ 0, %11 ], [ %18, %14 ], [ 0, %53 ], [ 0, %24 ], [ 0, %34 ], [ 0, %47 ], [ 1, %57 ], [ 1, %64 ], [ 0, %67 ]
  ret i8 %72
}

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define hidden i64 @llb_read_compact_size_checked(ptr noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i32 %1, 0
  %6 = or i1 %4, %5
  br i1 %6, label %53, label %7

7:                                                ; preds = %3
  %8 = load i8, ptr %0, align 1, !tbaa !2
  %9 = icmp ult i8 %8, -3
  br i1 %9, label %15, label %10

10:                                               ; preds = %7
  switch i8 %8, label %53 [
    i8 -3, label %11
    i8 -2, label %13
  ]

11:                                               ; preds = %10
  %12 = icmp ult i32 %1, 3
  br i1 %12, label %53, label %17

13:                                               ; preds = %10
  %14 = icmp ult i32 %1, 5
  br i1 %14, label %53, label %28

15:                                               ; preds = %7
  %16 = zext i8 %8 to i64
  br label %44

17:                                               ; preds = %11
  %18 = getelementptr inbounds i8, ptr %0, i64 1
  %19 = load i8, ptr %18, align 1, !tbaa !2
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds i8, ptr %0, i64 2
  %22 = load i8, ptr %21, align 1, !tbaa !2
  %23 = zext i8 %22 to i64
  %24 = shl nuw nsw i64 %23, 8
  %25 = or disjoint i64 %24, %20
  %26 = add nsw i64 %25, -253
  %27 = icmp ult i64 %26, 65283
  br label %44

28:                                               ; preds = %13
  %29 = getelementptr inbounds i8, ptr %0, i64 1
  %30 = load i16, ptr %29, align 1
  %31 = zext i16 %30 to i64
  %32 = getelementptr inbounds i8, ptr %0, i64 3
  %33 = load i8, ptr %32, align 1, !tbaa !2
  %34 = zext i8 %33 to i64
  %35 = shl nuw nsw i64 %34, 16
  %36 = or disjoint i64 %35, %31
  %37 = getelementptr inbounds i8, ptr %0, i64 4
  %38 = load i8, ptr %37, align 1, !tbaa !2
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 24
  %41 = or disjoint i64 %36, %40
  %42 = add nsw i64 %41, -65536
  %43 = icmp ult i64 %42, 4294901760
  br label %44

44:                                               ; preds = %28, %17, %15
  %45 = phi i64 [ 4294967296, %15 ], [ 12884901888, %17 ], [ 21474836480, %28 ]
  %46 = phi i64 [ %16, %15 ], [ %25, %17 ], [ %41, %28 ]
  %47 = phi i1 [ true, %15 ], [ %27, %17 ], [ %43, %28 ]
  %48 = zext i32 %2 to i64
  %49 = icmp ule i64 %46, %48
  %50 = and i1 %49, %47
  br i1 %50, label %51, label %53

51:                                               ; preds = %44
  %52 = or disjoint i64 %46, %45
  br label %53

53:                                               ; preds = %51, %44, %13, %11, %10, %3
  %54 = phi i64 [ %52, %51 ], [ 0, %3 ], [ 0, %11 ], [ 0, %13 ], [ 0, %10 ], [ 0, %44 ]
  ret i64 %54
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite)
define hidden void @llb_sort_fixed_bytes(ptr noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i32 %2, 0
  %6 = or i1 %4, %5
  %7 = icmp ult i32 %1, 2
  %8 = or i1 %7, %6
  br i1 %8, label %.loopexit7, label %9

9:                                                ; preds = %3
  %10 = zext i32 %2 to i64
  %11 = zext i32 %1 to i64
  %12 = icmp ult i32 %2, 8
  %13 = icmp ult i32 %2, 32
  %14 = and i64 %10, 4294967264
  %15 = icmp eq i64 %14, %10
  %16 = and i64 %10, 24
  %17 = icmp eq i64 %16, 0
  %18 = and i64 %10, 4294967288
  %19 = icmp eq i64 %18, %10
  br label %20

20:                                               ; preds = %79, %9
  %21 = phi i64 [ 1, %9 ], [ %80, %79 ]
  br label %23

.loopexit:                                        ; preds = %71, %70, %60
  %22 = icmp eq i64 %25, 0
  br i1 %22, label %79, label %23

23:                                               ; preds = %.loopexit, %20
  %24 = phi i64 [ %21, %20 ], [ %25, %.loopexit ]
  %25 = add nsw i64 %24, -1
  %26 = mul nuw i64 %25, %10
  %27 = mul nuw i64 %24, %10
  %28 = getelementptr i8, ptr %0, i64 %26
  %29 = getelementptr i8, ptr %0, i64 %27
  br label %30

30:                                               ; preds = %30, %23
  %31 = phi i64 [ %42, %30 ], [ 0, %23 ]
  %32 = phi i8 [ %41, %30 ], [ 0, %23 ]
  %33 = getelementptr i8, ptr %28, i64 %31
  %34 = load i8, ptr %33, align 1, !tbaa !2
  %35 = getelementptr i8, ptr %29, i64 %31
  %36 = load i8, ptr %35, align 1, !tbaa !2
  %37 = icmp ult i8 %34, %36
  %38 = icmp ugt i8 %34, %36
  %39 = select i1 %38, i8 1, i8 %32
  %40 = icmp eq i8 %34, %36
  %41 = select i1 %37, i8 0, i8 %39
  %42 = add nuw nsw i64 %31, 1
  %43 = icmp ult i64 %42, %10
  %44 = select i1 %40, i1 %43, i1 false
  br i1 %44, label %30, label %45

45:                                               ; preds = %30
  %46 = icmp eq i8 %41, 0
  br i1 %46, label %79, label %47

47:                                               ; preds = %45
  br i1 %12, label %.preheader8, label %48

48:                                               ; preds = %47
  br i1 %13, label %.preheader9, label %.preheader

.preheader:                                       ; preds = %48, %.preheader
  %49 = phi i64 [ %58, %.preheader ], [ 0, %48 ]
  %50 = getelementptr i8, ptr %28, i64 %49
  %51 = getelementptr i8, ptr %50, i64 16
  %52 = load <16 x i8>, ptr %50, align 1, !tbaa !2
  %53 = load <16 x i8>, ptr %51, align 1, !tbaa !2
  %54 = getelementptr i8, ptr %29, i64 %49
  %55 = getelementptr i8, ptr %54, i64 16
  %56 = load <16 x i8>, ptr %54, align 1, !tbaa !2
  %57 = load <16 x i8>, ptr %55, align 1, !tbaa !2
  store <16 x i8> %56, ptr %50, align 1, !tbaa !2
  store <16 x i8> %57, ptr %51, align 1, !tbaa !2
  store <16 x i8> %52, ptr %54, align 1, !tbaa !2
  store <16 x i8> %53, ptr %55, align 1, !tbaa !2
  %58 = add nuw nsw i64 %49, 32
  %59 = icmp eq i64 %58, %14
  br i1 %59, label %60, label %.preheader, !llvm.loop !17

60:                                               ; preds = %.preheader
  br i1 %15, label %.loopexit, label %61

61:                                               ; preds = %60
  br i1 %17, label %.preheader8, label %.preheader9

.preheader9:                                      ; preds = %61, %48
  %.ph10 = phi i64 [ 0, %48 ], [ %14, %61 ]
  br label %62

62:                                               ; preds = %.preheader9, %62
  %63 = phi i64 [ %68, %62 ], [ %.ph10, %.preheader9 ]
  %64 = getelementptr i8, ptr %28, i64 %63
  %65 = load <8 x i8>, ptr %64, align 1, !tbaa !2
  %66 = getelementptr i8, ptr %29, i64 %63
  %67 = load <8 x i8>, ptr %66, align 1, !tbaa !2
  store <8 x i8> %67, ptr %64, align 1, !tbaa !2
  store <8 x i8> %65, ptr %66, align 1, !tbaa !2
  %68 = add nuw i64 %63, 8
  %69 = icmp eq i64 %68, %18
  br i1 %69, label %70, label %62, !llvm.loop !18

70:                                               ; preds = %62
  br i1 %19, label %.loopexit, label %.preheader8

.preheader8:                                      ; preds = %70, %61, %47
  %.ph = phi i64 [ %18, %70 ], [ %14, %61 ], [ 0, %47 ]
  br label %71

71:                                               ; preds = %.preheader8, %71
  %72 = phi i64 [ %77, %71 ], [ %.ph, %.preheader8 ]
  %73 = getelementptr i8, ptr %28, i64 %72
  %74 = load i8, ptr %73, align 1, !tbaa !2
  %75 = getelementptr i8, ptr %29, i64 %72
  %76 = load i8, ptr %75, align 1, !tbaa !2
  store i8 %76, ptr %73, align 1, !tbaa !2
  store i8 %74, ptr %75, align 1, !tbaa !2
  %77 = add nuw nsw i64 %72, 1
  %78 = icmp eq i64 %77, %10
  br i1 %78, label %.loopexit, label %71, !llvm.loop !19

79:                                               ; preds = %45, %.loopexit
  %80 = add nuw nsw i64 %21, 1
  %81 = icmp eq i64 %80, %11
  br i1 %81, label %.loopexit7, label %20

.loopexit7:                                       ; preds = %79, %3
  ret void
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite)
define hidden void @llb_sort_u16(ptr noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq ptr %0, null
  %4 = icmp ult i32 %1, 2
  %5 = or i1 %3, %4
  br i1 %5, label %.loopexit, label %6

6:                                                ; preds = %2
  %7 = zext i32 %1 to i64
  br label %8

8:                                                ; preds = %22, %6
  %9 = phi i64 [ 1, %6 ], [ %26, %22 ]
  %10 = getelementptr inbounds i16, ptr %0, i64 %9
  %11 = load i16, ptr %10, align 2, !tbaa !20
  br label %12

12:                                               ; preds = %19, %8
  %13 = phi i64 [ %9, %8 ], [ %14, %19 ]
  %14 = add nsw i64 %13, -1
  %15 = and i64 %14, 4294967295
  %16 = getelementptr inbounds i16, ptr %0, i64 %15
  %17 = load i16, ptr %16, align 2, !tbaa !20
  %18 = icmp ugt i16 %17, %11
  br i1 %18, label %19, label %22

19:                                               ; preds = %12
  %20 = getelementptr inbounds i16, ptr %0, i64 %13
  store i16 %17, ptr %20, align 2, !tbaa !20
  %21 = icmp eq i64 %15, 0
  br i1 %21, label %22, label %12

22:                                               ; preds = %19, %12
  %23 = phi i64 [ 0, %19 ], [ %13, %12 ]
  %24 = and i64 %23, 4294967295
  %25 = getelementptr inbounds i16, ptr %0, i64 %24
  store i16 %11, ptr %25, align 2, !tbaa !20
  %26 = add nuw nsw i64 %9, 1
  %27 = icmp eq i64 %26, %7
  br i1 %27, label %.loopexit, label %8

.loopexit:                                        ; preds = %22, %2
  ret void
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite)
define hidden i32 @llb_format_sats_ascii(i64 noundef %0, ptr noundef readonly %1, i32 noundef %2, i8 noundef zeroext %3, ptr noundef writeonly %4, i32 noundef %5) local_unnamed_addr #2 {
  %7 = ptrtoint ptr %1 to i64
  %8 = ptrtoint ptr %4 to i64
  %9 = alloca [12 x i8], align 1
  %10 = alloca [10 x i8], align 1
  %11 = alloca [8 x i8], align 1
  %12 = trunc i64 %0 to i32
  %13 = lshr i64 %0, 32
  %14 = trunc i64 %13 to i32
  %15 = and i32 %12, 65535
  %16 = lshr i32 %12, 16
  %17 = mul nuw i32 %15, 52989
  %18 = zext i32 %17 to i64
  %19 = mul nuw i32 %15, 33889
  %20 = zext i32 %19 to i64
  %21 = mul nuw i32 %16, 52989
  %22 = zext i32 %21 to i64
  %23 = mul nuw i32 %16, 33889
  %24 = add nuw nsw i64 %20, %22
  %25 = shl nuw nsw i64 %24, 16
  %26 = add nuw nsw i64 %25, %18
  %27 = mul nuw nsw i32 %15, 30481
  %28 = zext nneg i32 %27 to i64
  %29 = mul nuw i32 %15, 43980
  %30 = zext i32 %29 to i64
  %31 = mul nuw nsw i32 %16, 30481
  %32 = zext nneg i32 %31 to i64
  %33 = mul nuw i32 %16, 43980
  %34 = add nuw nsw i64 %30, %32
  %35 = shl nuw nsw i64 %34, 16
  %36 = add nuw nsw i64 %35, %28
  %37 = and i32 %14, 65535
  %38 = lshr i32 %14, 16
  %39 = mul nuw i32 %37, 52989
  %40 = zext i32 %39 to i64
  %41 = mul nuw i32 %37, 33889
  %42 = zext i32 %41 to i64
  %43 = mul nuw i32 %38, 52989
  %44 = zext i32 %43 to i64
  %45 = mul nuw i32 %38, 33889
  %46 = add nuw nsw i64 %42, %44
  %47 = shl nuw nsw i64 %46, 16
  %48 = add nuw nsw i64 %47, %40
  %49 = mul nuw nsw i32 %37, 30481
  %50 = zext nneg i32 %49 to i64
  %51 = mul nuw i32 %37, 43980
  %52 = zext i32 %51 to i64
  %53 = mul nuw nsw i32 %38, 30481
  %54 = zext nneg i32 %53 to i64
  %55 = mul nuw i32 %38, 43980
  %56 = zext i32 %55 to i64
  %57 = add nuw nsw i64 %52, %54
  %58 = shl nuw nsw i64 %57, 16
  %59 = shl nuw i64 %56, 32
  %60 = lshr i64 %26, 32
  %61 = trunc i64 %60 to i32
  %62 = add nuw i32 %23, %61
  %63 = zext i32 %62 to i64
  %64 = and i64 %36, 4294967295
  %65 = and i64 %48, 4294967295
  %66 = add nuw nsw i64 %65, %64
  %67 = add nuw nsw i64 %66, %63
  %68 = lshr i64 %36, 32
  %69 = trunc i64 %68 to i32
  %70 = add nuw i32 %33, %69
  %71 = zext i32 %70 to i64
  %72 = lshr i64 %48, 32
  %73 = trunc i64 %72 to i32
  %74 = add nuw i32 %45, %73
  %75 = zext i32 %74 to i64
  %76 = lshr i64 %67, 32
  %77 = or disjoint i64 %59, %50
  %78 = add nuw i64 %77, %58
  %79 = add nuw i64 %78, %71
  %80 = add nuw i64 %79, %75
  %81 = add nuw i64 %80, %76
  %82 = lshr i64 %81, 26
  %83 = trunc i64 %82 to i32
  %84 = mul i32 %83, -100000000
  %85 = add i32 %84, %12
  %86 = lshr i64 %81, 58
  %87 = and i32 %83, 65535
  %88 = lshr i32 %83, 16
  %89 = mul nuw i32 %87, 52989
  %90 = zext i32 %89 to i64
  %91 = mul nuw i32 %87, 33889
  %92 = zext i32 %91 to i64
  %93 = mul nuw i32 %88, 52989
  %94 = zext i32 %93 to i64
  %95 = mul nuw i32 %88, 33889
  %96 = add nuw nsw i64 %92, %94
  %97 = shl nuw nsw i64 %96, 16
  %98 = add nuw nsw i64 %97, %90
  %99 = mul nuw nsw i32 %87, 30481
  %100 = zext nneg i32 %99 to i64
  %101 = mul nuw i32 %87, 43980
  %102 = zext i32 %101 to i64
  %103 = mul nuw nsw i32 %88, 30481
  %104 = zext nneg i32 %103 to i64
  %105 = mul nuw i32 %88, 43980
  %106 = add nuw nsw i64 %102, %104
  %107 = shl nuw nsw i64 %106, 16
  %108 = add nuw nsw i64 %107, %100
  %109 = mul nuw nsw i64 %86, 2221002493
  %110 = lshr i64 %98, 32
  %111 = trunc i64 %110 to i32
  %112 = add nuw i32 %95, %111
  %113 = zext i32 %112 to i64
  %114 = and i64 %108, 4294967295
  %115 = and i64 %109, 4294967295
  %116 = add nuw nsw i64 %114, %115
  %117 = add nuw nsw i64 %116, %113
  %118 = lshr i64 %108, 32
  %119 = trunc i64 %118 to i32
  %120 = add nuw i32 %105, %119
  %121 = zext i32 %120 to i64
  %122 = lshr i64 %109, 32
  %123 = lshr i64 %117, 32
  %124 = mul nuw nsw i64 %86, 2882303761
  %125 = add nuw nsw i64 %122, %124
  %126 = add nuw nsw i64 %125, %121
  %127 = add nuw nsw i64 %126, %123
  %128 = lshr i64 %127, 26
  %129 = trunc i64 %128 to i32
  %130 = mul i32 %129, -100000000
  %131 = add i32 %130, %83
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %9) #6
  call void @llvm.lifetime.start.p0(i64 10, ptr nonnull %10) #6
  %132 = icmp eq ptr %4, null
  br i1 %132, label %782, label %133

133:                                              ; preds = %6
  %134 = icmp eq ptr %1, null
  %135 = icmp ne i32 %2, 0
  %136 = and i1 %134, %135
  br i1 %136, label %782, label %137

137:                                              ; preds = %133
  %138 = icmp eq i32 %129, 0
  br i1 %138, label %.preheader26, label %.preheader28

.preheader28:                                     ; preds = %137, %.preheader28
  %139 = phi i32 [ %154, %.preheader28 ], [ 0, %137 ]
  %140 = phi i32 [ %149, %.preheader28 ], [ %129, %137 ]
  %141 = and i32 %140, 65535
  %142 = mul nuw nsw i32 %141, 52429
  %143 = zext nneg i32 %142 to i64
  %144 = mul nuw nsw i32 %141, 52428
  %145 = zext nneg i32 %144 to i64
  %146 = shl nuw nsw i64 %145, 16
  %147 = add nuw nsw i64 %146, %143
  %148 = lshr i64 %147, 35
  %149 = trunc i64 %148 to i32
  %150 = mul nuw nsw i32 %149, 246
  %151 = add nuw nsw i32 %150, %140
  %152 = trunc i32 %151 to i8
  %153 = add i8 %152, 48
  %154 = add i32 %139, 1
  %155 = zext i32 %139 to i64
  %156 = getelementptr inbounds i8, ptr %9, i64 %155
  store i8 %153, ptr %156, align 1, !tbaa !2
  %157 = icmp eq i32 %149, 0
  br i1 %157, label %158, label %.preheader28

158:                                              ; preds = %.preheader28
  %159 = and i32 %131, 65535
  %160 = lshr i32 %131, 16
  %161 = mul nuw i32 %159, 52429
  %162 = zext i32 %161 to i64
  %163 = mul nuw i32 %159, 52428
  %164 = zext i32 %163 to i64
  %165 = mul nuw i32 %160, 52429
  %166 = zext i32 %165 to i64
  %167 = mul nuw i32 %160, 52428
  %168 = zext i32 %167 to i64
  %169 = add nuw nsw i64 %164, %166
  %170 = shl nuw nsw i64 %169, 16
  %171 = shl nuw i64 %168, 32
  %172 = or disjoint i64 %171, %162
  %173 = add nuw i64 %172, %170
  %174 = lshr i64 %173, 35
  %175 = trunc i64 %174 to i32
  %176 = mul i32 %175, 246
  %177 = add i32 %176, %83
  %178 = trunc i32 %177 to i8
  %179 = add i8 %178, 48
  store i8 %179, ptr %10, align 1, !tbaa !2
  %180 = and i32 %175, 65535
  %181 = lshr i32 %175, 16
  %182 = mul nuw i32 %180, 52429
  %183 = zext i32 %182 to i64
  %184 = mul nuw i32 %180, 52428
  %185 = zext i32 %184 to i64
  %186 = mul nuw nsw i32 %181, 52429
  %187 = zext nneg i32 %186 to i64
  %188 = mul nuw nsw i32 %181, 52428
  %189 = zext nneg i32 %188 to i64
  %190 = add nuw nsw i64 %185, %187
  %191 = shl nuw nsw i64 %190, 16
  %192 = shl nuw nsw i64 %189, 32
  %193 = or disjoint i64 %192, %183
  %194 = add nuw nsw i64 %193, %191
  %195 = lshr i64 %194, 35
  %196 = trunc i64 %195 to i32
  %197 = mul i32 %196, 246
  %198 = add i32 %197, %175
  %199 = trunc i32 %198 to i8
  %200 = add i8 %199, 48
  %201 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 1
  store i8 %200, ptr %201, align 1, !tbaa !2
  %202 = and i32 %196, 65535
  %203 = lshr i32 %196, 16
  %204 = mul nuw i32 %202, 52429
  %205 = zext i32 %204 to i64
  %206 = mul nuw i32 %202, 52428
  %207 = zext i32 %206 to i64
  %208 = mul nuw nsw i32 %203, 52429
  %209 = zext nneg i32 %208 to i64
  %210 = mul nuw nsw i32 %203, 52428
  %211 = zext nneg i32 %210 to i64
  %212 = add nuw nsw i64 %207, %209
  %213 = shl nuw nsw i64 %212, 16
  %214 = shl nuw nsw i64 %211, 32
  %215 = or disjoint i64 %214, %205
  %216 = add nuw nsw i64 %215, %213
  %217 = lshr i64 %216, 35
  %218 = trunc i64 %217 to i32
  %219 = mul nuw nsw i32 %218, 246
  %220 = add nuw nsw i32 %219, %196
  %221 = trunc i32 %220 to i8
  %222 = add i8 %221, 48
  %223 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 2
  store i8 %222, ptr %223, align 1, !tbaa !2
  %224 = and i32 %218, 65535
  %225 = lshr i32 %218, 16
  %226 = mul nuw i32 %224, 52429
  %227 = zext i32 %226 to i64
  %228 = mul nuw i32 %224, 52428
  %229 = zext i32 %228 to i64
  %230 = mul nuw nsw i32 %225, 52429
  %231 = zext nneg i32 %230 to i64
  %232 = mul nuw nsw i32 %225, 52428
  %233 = zext nneg i32 %232 to i64
  %234 = add nuw nsw i64 %229, %231
  %235 = shl nuw nsw i64 %234, 16
  %236 = shl nuw nsw i64 %233, 32
  %237 = or disjoint i64 %236, %227
  %238 = add nuw nsw i64 %237, %235
  %239 = lshr i64 %238, 35
  %240 = trunc i64 %239 to i32
  %241 = mul nuw nsw i32 %240, 246
  %242 = add nuw nsw i32 %241, %218
  %243 = trunc i32 %242 to i8
  %244 = add i8 %243, 48
  %245 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 3
  store i8 %244, ptr %245, align 1, !tbaa !2
  %246 = and i32 %240, 65535
  %247 = lshr i32 %240, 16
  %248 = mul nuw i32 %246, 52429
  %249 = zext i32 %248 to i64
  %250 = mul nuw i32 %246, 52428
  %251 = zext i32 %250 to i64
  %252 = mul nuw nsw i32 %247, 52429
  %253 = zext nneg i32 %252 to i64
  %254 = mul nuw nsw i32 %247, 52428
  %255 = zext nneg i32 %254 to i64
  %256 = add nuw nsw i64 %251, %253
  %257 = shl nuw nsw i64 %256, 16
  %258 = shl nuw nsw i64 %255, 32
  %259 = or disjoint i64 %258, %249
  %260 = add nuw nsw i64 %259, %257
  %261 = lshr i64 %260, 35
  %262 = trunc i64 %261 to i32
  %263 = mul nuw nsw i32 %262, 246
  %264 = add nuw nsw i32 %263, %240
  %265 = trunc i32 %264 to i8
  %266 = add i8 %265, 48
  %267 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 4
  store i8 %266, ptr %267, align 1, !tbaa !2
  %268 = and i32 %262, 65535
  %269 = lshr i32 %262, 16
  %270 = mul nuw i32 %268, 52429
  %271 = zext i32 %270 to i64
  %272 = mul nuw i32 %268, 52428
  %273 = zext i32 %272 to i64
  %274 = mul nuw nsw i32 %269, 52429
  %275 = zext nneg i32 %274 to i64
  %276 = mul nuw nsw i32 %269, 52428
  %277 = zext nneg i32 %276 to i64
  %278 = add nuw nsw i64 %273, %275
  %279 = shl nuw nsw i64 %278, 16
  %280 = shl nuw nsw i64 %277, 32
  %281 = or disjoint i64 %280, %271
  %282 = add nuw nsw i64 %281, %279
  %283 = lshr i64 %282, 35
  %284 = trunc i64 %283 to i32
  %285 = mul nuw nsw i32 %284, 246
  %286 = add nuw nsw i32 %285, %262
  %287 = trunc i32 %286 to i8
  %288 = add i8 %287, 48
  %289 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 5
  store i8 %288, ptr %289, align 1, !tbaa !2
  %290 = mul nuw nsw i64 %283, 52429
  %291 = mul nuw nsw i64 %283, 3435921408
  %292 = and i64 %291, 281474976448512
  %293 = add nuw nsw i64 %292, %290
  %294 = lshr i64 %293, 35
  %295 = trunc i64 %294 to i32
  %296 = mul nuw nsw i32 %295, 246
  %297 = add nuw nsw i32 %296, %284
  %298 = trunc i32 %297 to i8
  %299 = add i8 %298, 48
  %300 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 6
  store i8 %299, ptr %300, align 1, !tbaa !2
  %301 = mul nuw nsw i64 %294, 3435973837
  %302 = lshr i64 %301, 35
  %303 = trunc i64 %302 to i32
  %304 = mul nuw nsw i32 %303, 246
  %305 = add nuw nsw i32 %304, %295
  %306 = trunc i32 %305 to i8
  %307 = add i8 %306, 48
  %308 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 7
  store i8 %307, ptr %308, align 1, !tbaa !2
  br label %.loopexit27

.preheader26:                                     ; preds = %137, %.preheader26
  %309 = phi i32 [ %332, %.preheader26 ], [ 0, %137 ]
  %310 = phi i32 [ %327, %.preheader26 ], [ %131, %137 ]
  %311 = and i32 %310, 65535
  %312 = lshr i32 %310, 16
  %313 = mul nuw i32 %311, 52429
  %314 = zext i32 %313 to i64
  %315 = mul nuw i32 %311, 52428
  %316 = zext i32 %315 to i64
  %317 = mul nuw i32 %312, 52429
  %318 = zext i32 %317 to i64
  %319 = mul nuw i32 %312, 52428
  %320 = zext i32 %319 to i64
  %321 = add nuw nsw i64 %316, %318
  %322 = shl nuw nsw i64 %321, 16
  %323 = shl nuw i64 %320, 32
  %324 = or disjoint i64 %323, %314
  %325 = add nuw i64 %324, %322
  %326 = lshr i64 %325, 35
  %327 = trunc i64 %326 to i32
  %328 = mul i32 %327, 246
  %329 = add i32 %328, %310
  %330 = trunc i32 %329 to i8
  %331 = add i8 %330, 48
  %332 = add i32 %309, 1
  %333 = zext i32 %309 to i64
  %334 = getelementptr inbounds i8, ptr %10, i64 %333
  store i8 %331, ptr %334, align 1, !tbaa !2
  %335 = icmp eq i32 %327, 0
  br i1 %335, label %.loopexit27, label %.preheader26

.loopexit27:                                      ; preds = %.preheader26, %158
  %336 = phi i32 [ %154, %158 ], [ 0, %.preheader26 ]
  %337 = phi i32 [ 8, %158 ], [ %332, %.preheader26 ]
  %338 = icmp ne i8 %3, 0
  %339 = icmp ne i32 %85, 0
  %340 = select i1 %338, i1 true, i1 %339
  %341 = zext i1 %340 to i32
  %342 = icmp eq i8 %3, 0
  br i1 %342, label %.preheader25, label %374

.preheader25:                                     ; preds = %.loopexit27, %348
  %343 = phi i32 [ %365, %348 ], [ %85, %.loopexit27 ]
  %344 = phi i32 [ %369, %348 ], [ 0, %.loopexit27 ]
  %345 = icmp ult i32 %344, 8
  %346 = icmp ne i32 %343, 0
  %347 = select i1 %345, i1 %346, i1 false
  br i1 %347, label %348, label %370

348:                                              ; preds = %.preheader25
  %349 = and i32 %343, 65535
  %350 = lshr i32 %343, 16
  %351 = mul nuw i32 %349, 52429
  %352 = zext i32 %351 to i64
  %353 = mul nuw i32 %349, 52428
  %354 = zext i32 %353 to i64
  %355 = mul nuw i32 %350, 52429
  %356 = zext i32 %355 to i64
  %357 = mul nuw i32 %350, 52428
  %358 = zext i32 %357 to i64
  %359 = add nuw nsw i64 %354, %356
  %360 = shl nuw nsw i64 %359, 16
  %361 = shl nuw i64 %358, 32
  %362 = or disjoint i64 %361, %352
  %363 = add nuw i64 %362, %360
  %364 = lshr i64 %363, 35
  %365 = trunc i64 %364 to i32
  %366 = mul i32 %365, -10
  %367 = sub i32 0, %343
  %368 = icmp eq i32 %366, %367
  %369 = add nuw nsw i32 %344, 1
  br i1 %368, label %.preheader25, label %370

370:                                              ; preds = %348, %.preheader25
  %371 = icmp eq i32 %85, 0
  %372 = sub nsw i32 8, %344
  %373 = select i1 %371, i32 0, i32 %372
  br label %374

374:                                              ; preds = %370, %.loopexit27
  %375 = phi i32 [ %373, %370 ], [ 8, %.loopexit27 ]
  %376 = select i1 %340, i32 %375, i32 0
  %377 = icmp eq i32 %2, 0
  %378 = add i32 %2, 2
  %379 = select i1 %377, i32 1, i32 %378
  %380 = add i32 %379, %341
  %381 = add i32 %380, %336
  %382 = add i32 %381, %337
  %383 = add i32 %382, %376
  %384 = icmp ugt i32 %383, %5
  br i1 %384, label %782, label %385

385:                                              ; preds = %374
  %386 = icmp eq i32 %336, 0
  br i1 %386, label %412, label %387

387:                                              ; preds = %385
  %388 = zext i32 %336 to i64
  %389 = icmp ult i32 %336, 32
  br i1 %389, label %.preheader90, label %390

.preheader90:                                     ; preds = %407, %387
  %.ph = phi i64 [ %391, %407 ], [ 0, %387 ]
  %.ph91 = phi i64 [ %408, %407 ], [ %388, %387 ]
  br label %466

390:                                              ; preds = %387
  %391 = and i64 %388, 4294967264
  br label %392

392:                                              ; preds = %392, %390
  %393 = phi i64 [ 0, %390 ], [ %405, %392 ]
  %394 = xor i64 %393, -1
  %395 = add nsw i64 %394, %388
  %396 = getelementptr inbounds [12 x i8], ptr %9, i64 0, i64 %395
  %397 = getelementptr inbounds i8, ptr %396, i64 -15
  %398 = getelementptr inbounds i8, ptr %396, i64 -31
  %399 = load <16 x i8>, ptr %397, align 1, !tbaa !2
  %400 = shufflevector <16 x i8> %399, <16 x i8> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %401 = load <16 x i8>, ptr %398, align 1, !tbaa !2
  %402 = shufflevector <16 x i8> %401, <16 x i8> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %403 = getelementptr inbounds i8, ptr %4, i64 %393
  %404 = getelementptr inbounds i8, ptr %403, i64 16
  store <16 x i8> %400, ptr %403, align 1, !tbaa !2
  store <16 x i8> %402, ptr %404, align 1, !tbaa !2
  %405 = add nuw nsw i64 %393, 32
  %406 = icmp eq i64 %405, %391
  br i1 %406, label %407, label %392, !llvm.loop !22

407:                                              ; preds = %392
  %408 = and i64 %388, 31
  %409 = icmp eq i64 %391, %388
  br i1 %409, label %.loopexit24, label %.preheader90

.loopexit24:                                      ; preds = %466, %407
  %410 = phi i64 [ %388, %407 ], [ %472, %466 ]
  %411 = trunc i64 %410 to i32
  br label %412

412:                                              ; preds = %.loopexit24, %385
  %413 = phi i32 [ 0, %385 ], [ %411, %.loopexit24 ]
  %414 = icmp eq i32 %337, 0
  br i1 %414, label %.loopexit21, label %415

415:                                              ; preds = %412
  %416 = zext i32 %337 to i64
  %417 = icmp ult i32 %337, 32
  %418 = sub i32 0, %337
  %419 = icmp ugt i32 %413, %418
  %or.cond = select i1 %417, i1 true, i1 %419
  br i1 %or.cond, label %445, label %420

420:                                              ; preds = %415
  %421 = and i64 %416, 4294967264
  %422 = trunc i64 %421 to i32
  br label %423

423:                                              ; preds = %423, %420
  %424 = phi i64 [ 0, %420 ], [ %439, %423 ]
  %425 = trunc i64 %424 to i32
  %426 = add i32 %413, %425
  %427 = xor i64 %424, -1
  %428 = add nsw i64 %427, %416
  %429 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %428
  %430 = getelementptr inbounds i8, ptr %429, i64 -15
  %431 = getelementptr inbounds i8, ptr %429, i64 -31
  %432 = load <16 x i8>, ptr %430, align 1, !tbaa !2
  %433 = shufflevector <16 x i8> %432, <16 x i8> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %434 = load <16 x i8>, ptr %431, align 1, !tbaa !2
  %435 = shufflevector <16 x i8> %434, <16 x i8> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %436 = zext i32 %426 to i64
  %437 = getelementptr inbounds i8, ptr %4, i64 %436
  %438 = getelementptr inbounds i8, ptr %437, i64 16
  store <16 x i8> %433, ptr %437, align 1, !tbaa !2
  store <16 x i8> %435, ptr %438, align 1, !tbaa !2
  %439 = add nuw nsw i64 %424, 32
  %440 = icmp eq i64 %439, %421
  br i1 %440, label %441, label %423, !llvm.loop !23

441:                                              ; preds = %423
  %442 = and i64 %416, 31
  %443 = add i32 %413, %422
  %444 = icmp eq i64 %421, %416
  br i1 %444, label %.loopexit21, label %445

445:                                              ; preds = %441, %415
  %446 = phi i64 [ %416, %415 ], [ %442, %441 ]
  %447 = phi i32 [ %413, %415 ], [ %443, %441 ]
  %448 = add nsw i64 %446, -1
  %449 = and i64 %446, 3
  %450 = icmp eq i64 %449, 0
  br i1 %450, label %.loopexit23, label %.preheader22

.preheader22:                                     ; preds = %445, %.preheader22
  %451 = phi i64 [ %454, %.preheader22 ], [ %446, %445 ]
  %452 = phi i32 [ %457, %.preheader22 ], [ %447, %445 ]
  %453 = phi i64 [ %460, %.preheader22 ], [ 0, %445 ]
  %454 = add nsw i64 %451, -1
  %455 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %454
  %456 = load i8, ptr %455, align 1, !tbaa !2
  %457 = add i32 %452, 1
  %458 = zext i32 %452 to i64
  %459 = getelementptr inbounds i8, ptr %4, i64 %458
  store i8 %456, ptr %459, align 1, !tbaa !2
  %460 = add nuw nsw i64 %453, 1
  %461 = icmp eq i64 %460, %449
  br i1 %461, label %.loopexit23, label %.preheader22, !llvm.loop !24

.loopexit23:                                      ; preds = %.preheader22, %445
  %462 = phi i32 [ undef, %445 ], [ %457, %.preheader22 ]
  %463 = phi i64 [ %446, %445 ], [ %454, %.preheader22 ]
  %464 = phi i32 [ %447, %445 ], [ %457, %.preheader22 ]
  %465 = icmp ult i64 %448, 3
  br i1 %465, label %.loopexit21, label %.preheader20

466:                                              ; preds = %.preheader90, %466
  %467 = phi i64 [ %472, %466 ], [ %.ph, %.preheader90 ]
  %468 = phi i64 [ %469, %466 ], [ %.ph91, %.preheader90 ]
  %469 = add nsw i64 %468, -1
  %470 = getelementptr inbounds [12 x i8], ptr %9, i64 0, i64 %469
  %471 = load i8, ptr %470, align 1, !tbaa !2
  %472 = add nuw nsw i64 %467, 1
  %473 = getelementptr inbounds i8, ptr %4, i64 %467
  store i8 %471, ptr %473, align 1, !tbaa !2
  %474 = icmp eq i64 %469, 0
  br i1 %474, label %.loopexit24, label %466, !llvm.loop !26

.preheader20:                                     ; preds = %.loopexit23, %.preheader20
  %475 = phi i64 [ %495, %.preheader20 ], [ %463, %.loopexit23 ]
  %476 = phi i32 [ %498, %.preheader20 ], [ %464, %.loopexit23 ]
  %477 = add nsw i64 %475, -1
  %478 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %477
  %479 = load i8, ptr %478, align 1, !tbaa !2
  %480 = add i32 %476, 1
  %481 = zext i32 %476 to i64
  %482 = getelementptr inbounds i8, ptr %4, i64 %481
  store i8 %479, ptr %482, align 1, !tbaa !2
  %483 = add nsw i64 %475, -2
  %484 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %483
  %485 = load i8, ptr %484, align 1, !tbaa !2
  %486 = add i32 %476, 2
  %487 = zext i32 %480 to i64
  %488 = getelementptr inbounds i8, ptr %4, i64 %487
  store i8 %485, ptr %488, align 1, !tbaa !2
  %489 = add nsw i64 %475, -3
  %490 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %489
  %491 = load i8, ptr %490, align 1, !tbaa !2
  %492 = add i32 %476, 3
  %493 = zext i32 %486 to i64
  %494 = getelementptr inbounds i8, ptr %4, i64 %493
  store i8 %491, ptr %494, align 1, !tbaa !2
  %495 = add nsw i64 %475, -4
  %496 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %495
  %497 = load i8, ptr %496, align 1, !tbaa !2
  %498 = add i32 %476, 4
  %499 = zext i32 %492 to i64
  %500 = getelementptr inbounds i8, ptr %4, i64 %499
  store i8 %497, ptr %500, align 1, !tbaa !2
  %501 = icmp eq i64 %495, 0
  br i1 %501, label %.loopexit21, label %.preheader20, !llvm.loop !27

.loopexit21:                                      ; preds = %.preheader20, %.loopexit23, %441, %412
  %502 = phi i32 [ %413, %412 ], [ %443, %441 ], [ %462, %.loopexit23 ], [ %498, %.preheader20 ]
  br i1 %340, label %503, label %693

503:                                              ; preds = %.loopexit21
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %11) #6
  br i1 %342, label %504, label %572

504:                                              ; preds = %503
  %505 = icmp eq i32 %375, 8
  br i1 %505, label %579, label %506

506:                                              ; preds = %504
  %507 = sub i32 8, %375
  %508 = and i32 %507, 1
  %509 = icmp eq i32 %375, 7
  br i1 %509, label %.loopexit19, label %510

510:                                              ; preds = %506
  %511 = and i32 %507, -2
  br label %512

512:                                              ; preds = %512, %510
  %513 = phi i32 [ %85, %510 ], [ %548, %512 ]
  %514 = phi i32 [ 0, %510 ], [ %549, %512 ]
  %515 = and i32 %513, 65535
  %516 = lshr i32 %513, 16
  %517 = mul nuw i32 %515, 52429
  %518 = zext i32 %517 to i64
  %519 = mul nuw i32 %515, 52428
  %520 = zext i32 %519 to i64
  %521 = mul nuw i32 %516, 52429
  %522 = zext i32 %521 to i64
  %523 = mul nuw i32 %516, 52428
  %524 = zext i32 %523 to i64
  %525 = add nuw nsw i64 %520, %522
  %526 = shl nuw nsw i64 %525, 16
  %527 = shl nuw i64 %524, 32
  %528 = or disjoint i64 %527, %518
  %529 = add nuw i64 %528, %526
  %530 = lshr i64 %529, 35
  %531 = trunc i64 %530 to i32
  %532 = and i32 %531, 65535
  %533 = lshr i32 %531, 16
  %534 = mul nuw i32 %532, 52429
  %535 = zext i32 %534 to i64
  %536 = mul nuw i32 %532, 52428
  %537 = zext i32 %536 to i64
  %538 = mul nuw nsw i32 %533, 52429
  %539 = zext nneg i32 %538 to i64
  %540 = mul nuw nsw i32 %533, 52428
  %541 = zext nneg i32 %540 to i64
  %542 = add nuw nsw i64 %537, %539
  %543 = shl nuw nsw i64 %542, 16
  %544 = shl nuw nsw i64 %541, 32
  %545 = or disjoint i64 %544, %535
  %546 = add nuw nsw i64 %545, %543
  %547 = lshr i64 %546, 35
  %548 = trunc i64 %547 to i32
  %549 = add i32 %514, 2
  %550 = icmp eq i32 %549, %511
  br i1 %550, label %.loopexit19, label %512

.loopexit19:                                      ; preds = %512, %506
  %551 = phi i32 [ undef, %506 ], [ %548, %512 ]
  %552 = phi i32 [ %85, %506 ], [ %548, %512 ]
  %553 = icmp eq i32 %508, 0
  br i1 %553, label %572, label %554

554:                                              ; preds = %.loopexit19
  %555 = and i32 %552, 65535
  %556 = lshr i32 %552, 16
  %557 = mul nuw i32 %555, 52429
  %558 = zext i32 %557 to i64
  %559 = mul nuw i32 %555, 52428
  %560 = zext i32 %559 to i64
  %561 = mul nuw i32 %556, 52429
  %562 = zext i32 %561 to i64
  %563 = mul nuw i32 %556, 52428
  %564 = zext i32 %563 to i64
  %565 = add nuw nsw i64 %560, %562
  %566 = shl nuw nsw i64 %565, 16
  %567 = shl nuw i64 %564, 32
  %568 = or disjoint i64 %567, %558
  %569 = add nuw i64 %568, %566
  %570 = lshr i64 %569, 35
  %571 = trunc i64 %570 to i32
  br label %572

572:                                              ; preds = %554, %.loopexit19, %503
  %573 = phi i32 [ %85, %503 ], [ %551, %.loopexit19 ], [ %571, %554 ]
  %574 = icmp eq i32 %375, 0
  br i1 %574, label %575, label %579

575:                                              ; preds = %572
  %576 = zext i32 %502 to i64
  %577 = getelementptr inbounds i8, ptr %4, i64 %576
  store i8 46, ptr %577, align 1, !tbaa !2
  %578 = add i32 %502, 1
  br label %.loopexit16

579:                                              ; preds = %572, %504
  %580 = phi i32 [ %573, %572 ], [ %85, %504 ]
  %581 = zext i32 %375 to i64
  br label %582

582:                                              ; preds = %582, %579
  %583 = phi i64 [ 0, %579 ], [ %611, %582 ]
  %584 = phi i32 [ %580, %579 ], [ %601, %582 ]
  %585 = and i32 %584, 65535
  %586 = lshr i32 %584, 16
  %587 = mul nuw i32 %585, 52429
  %588 = zext i32 %587 to i64
  %589 = mul nuw i32 %585, 52428
  %590 = zext i32 %589 to i64
  %591 = mul nuw i32 %586, 52429
  %592 = zext i32 %591 to i64
  %593 = mul nuw i32 %586, 52428
  %594 = zext i32 %593 to i64
  %595 = add nuw nsw i64 %590, %592
  %596 = shl nuw nsw i64 %595, 16
  %597 = shl nuw i64 %594, 32
  %598 = or disjoint i64 %597, %588
  %599 = add nuw i64 %598, %596
  %600 = lshr i64 %599, 35
  %601 = trunc i64 %600 to i32
  %602 = mul i32 %601, 246
  %603 = add i32 %602, %584
  %604 = trunc i32 %603 to i8
  %605 = add i8 %604, 48
  %606 = trunc i64 %583 to i32
  %607 = xor i32 %606, -1
  %608 = add i32 %375, %607
  %609 = zext i32 %608 to i64
  %610 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %609
  store i8 %605, ptr %610, align 1, !tbaa !2
  %611 = add nuw nsw i64 %583, 1
  %612 = icmp eq i64 %611, %581
  br i1 %612, label %613, label %582

613:                                              ; preds = %582
  %614 = zext i32 %502 to i64
  %615 = getelementptr inbounds i8, ptr %4, i64 %614
  store i8 46, ptr %615, align 1, !tbaa !2
  %616 = add i32 %502, 1
  %617 = icmp ult i32 %375, 32
  br i1 %617, label %644, label %618

618:                                              ; preds = %613
  %619 = add nsw i64 %581, -1
  %620 = trunc i64 %619 to i32
  %621 = sub i32 -2, %502
  %622 = icmp ult i32 %621, %620
  %623 = icmp ugt i64 %619, 4294967295
  %624 = or i1 %623, %622
  br i1 %624, label %644, label %625

625:                                              ; preds = %618
  %626 = and i64 %581, 4294967264
  %627 = trunc i64 %626 to i32
  br label %628

628:                                              ; preds = %628, %625
  %629 = phi i64 [ 0, %625 ], [ %639, %628 ]
  %630 = trunc i64 %629 to i32
  %631 = add i32 %616, %630
  %632 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %629
  %633 = getelementptr inbounds i8, ptr %632, i64 16
  %634 = load <16 x i8>, ptr %632, align 1, !tbaa !2
  %635 = load <16 x i8>, ptr %633, align 1, !tbaa !2
  %636 = zext i32 %631 to i64
  %637 = getelementptr inbounds i8, ptr %4, i64 %636
  %638 = getelementptr inbounds i8, ptr %637, i64 16
  store <16 x i8> %634, ptr %637, align 1, !tbaa !2
  store <16 x i8> %635, ptr %638, align 1, !tbaa !2
  %639 = add nuw nsw i64 %629, 32
  %640 = icmp eq i64 %639, %626
  br i1 %640, label %641, label %628, !llvm.loop !28

641:                                              ; preds = %628
  %642 = add i32 %616, %627
  %643 = icmp eq i64 %626, %581
  br i1 %643, label %.loopexit16, label %644

644:                                              ; preds = %641, %618, %613
  %645 = phi i64 [ 0, %618 ], [ 0, %613 ], [ %626, %641 ]
  %646 = phi i32 [ %616, %618 ], [ %616, %613 ], [ %642, %641 ]
  %647 = and i64 %581, 3
  %648 = icmp eq i64 %647, 0
  br i1 %648, label %.loopexit18, label %.preheader17

.preheader17:                                     ; preds = %644, %.preheader17
  %649 = phi i64 [ %656, %.preheader17 ], [ %645, %644 ]
  %650 = phi i32 [ %657, %.preheader17 ], [ %646, %644 ]
  %651 = phi i64 [ %658, %.preheader17 ], [ 0, %644 ]
  %652 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %649
  %653 = load i8, ptr %652, align 1, !tbaa !2
  %654 = zext i32 %650 to i64
  %655 = getelementptr inbounds i8, ptr %4, i64 %654
  store i8 %653, ptr %655, align 1, !tbaa !2
  %656 = add nuw nsw i64 %649, 1
  %657 = add i32 %650, 1
  %658 = add nuw nsw i64 %651, 1
  %659 = icmp eq i64 %658, %647
  br i1 %659, label %.loopexit18, label %.preheader17, !llvm.loop !29

.loopexit18:                                      ; preds = %.preheader17, %644
  %660 = phi i32 [ undef, %644 ], [ %657, %.preheader17 ]
  %661 = phi i64 [ %645, %644 ], [ %656, %.preheader17 ]
  %662 = phi i32 [ %646, %644 ], [ %657, %.preheader17 ]
  %663 = sub nsw i64 %645, %581
  %664 = icmp ugt i64 %663, -4
  br i1 %664, label %.loopexit16, label %.preheader15

.preheader15:                                     ; preds = %.loopexit18, %.preheader15
  %665 = phi i64 [ %689, %.preheader15 ], [ %661, %.loopexit18 ]
  %666 = phi i32 [ %690, %.preheader15 ], [ %662, %.loopexit18 ]
  %667 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %665
  %668 = load i8, ptr %667, align 1, !tbaa !2
  %669 = zext i32 %666 to i64
  %670 = getelementptr inbounds i8, ptr %4, i64 %669
  store i8 %668, ptr %670, align 1, !tbaa !2
  %671 = add nuw nsw i64 %665, 1
  %672 = add i32 %666, 1
  %673 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %671
  %674 = load i8, ptr %673, align 1, !tbaa !2
  %675 = zext i32 %672 to i64
  %676 = getelementptr inbounds i8, ptr %4, i64 %675
  store i8 %674, ptr %676, align 1, !tbaa !2
  %677 = add nuw nsw i64 %665, 2
  %678 = add i32 %666, 2
  %679 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %677
  %680 = load i8, ptr %679, align 1, !tbaa !2
  %681 = zext i32 %678 to i64
  %682 = getelementptr inbounds i8, ptr %4, i64 %681
  store i8 %680, ptr %682, align 1, !tbaa !2
  %683 = add nuw nsw i64 %665, 3
  %684 = add i32 %666, 3
  %685 = getelementptr inbounds [8 x i8], ptr %11, i64 0, i64 %683
  %686 = load i8, ptr %685, align 1, !tbaa !2
  %687 = zext i32 %684 to i64
  %688 = getelementptr inbounds i8, ptr %4, i64 %687
  store i8 %686, ptr %688, align 1, !tbaa !2
  %689 = add nuw nsw i64 %665, 4
  %690 = add i32 %666, 4
  %691 = icmp eq i64 %689, %581
  br i1 %691, label %.loopexit16, label %.preheader15, !llvm.loop !30

.loopexit16:                                      ; preds = %.preheader15, %.loopexit18, %641, %575
  %692 = phi i32 [ %578, %575 ], [ %642, %641 ], [ %660, %.loopexit18 ], [ %690, %.preheader15 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %11) #6
  br label %693

693:                                              ; preds = %.loopexit16, %.loopexit21
  %694 = phi i32 [ %692, %.loopexit16 ], [ %502, %.loopexit21 ]
  br i1 %135, label %695, label %.loopexit

695:                                              ; preds = %693
  %696 = zext i32 %694 to i64
  %697 = getelementptr inbounds i8, ptr %4, i64 %696
  store i8 32, ptr %697, align 1, !tbaa !2
  %698 = add i32 %694, 1
  %699 = zext i32 %2 to i64
  %700 = icmp ult i32 %2, 32
  br i1 %700, label %729, label %701

701:                                              ; preds = %695
  %702 = add i32 %2, -1
  %703 = sub i32 -2, %694
  %704 = icmp ult i32 %703, %702
  br i1 %704, label %729, label %705

705:                                              ; preds = %701
  %706 = zext i32 %698 to i64
  %707 = sub i64 %8, %7
  %708 = add i64 %707, %706
  %709 = icmp ult i64 %708, 32
  br i1 %709, label %729, label %710

710:                                              ; preds = %705
  %711 = and i64 %699, 4294967264
  %712 = trunc i64 %711 to i32
  br label %713

713:                                              ; preds = %713, %710
  %714 = phi i64 [ 0, %710 ], [ %724, %713 ]
  %715 = trunc i64 %714 to i32
  %716 = add i32 %698, %715
  %717 = getelementptr inbounds i8, ptr %1, i64 %714
  %718 = getelementptr inbounds i8, ptr %717, i64 16
  %719 = load <16 x i8>, ptr %717, align 1, !tbaa !2
  %720 = load <16 x i8>, ptr %718, align 1, !tbaa !2
  %721 = zext i32 %716 to i64
  %722 = getelementptr inbounds i8, ptr %4, i64 %721
  %723 = getelementptr inbounds i8, ptr %722, i64 16
  store <16 x i8> %719, ptr %722, align 1, !tbaa !2
  store <16 x i8> %720, ptr %723, align 1, !tbaa !2
  %724 = add nuw nsw i64 %714, 32
  %725 = icmp eq i64 %724, %711
  br i1 %725, label %726, label %713, !llvm.loop !31

726:                                              ; preds = %713
  %727 = add i32 %698, %712
  %728 = icmp eq i64 %711, %699
  br i1 %728, label %.loopexit, label %729

729:                                              ; preds = %726, %705, %701, %695
  %730 = phi i64 [ 0, %705 ], [ 0, %701 ], [ 0, %695 ], [ %711, %726 ]
  %731 = phi i32 [ %698, %705 ], [ %698, %701 ], [ %698, %695 ], [ %727, %726 ]
  %732 = and i64 %699, 3
  %733 = icmp eq i64 %732, 0
  br i1 %733, label %.loopexit14, label %.preheader

.preheader:                                       ; preds = %729, %.preheader
  %734 = phi i64 [ %741, %.preheader ], [ %730, %729 ]
  %735 = phi i32 [ %742, %.preheader ], [ %731, %729 ]
  %736 = phi i64 [ %743, %.preheader ], [ 0, %729 ]
  %737 = getelementptr inbounds i8, ptr %1, i64 %734
  %738 = load i8, ptr %737, align 1, !tbaa !2
  %739 = zext i32 %735 to i64
  %740 = getelementptr inbounds i8, ptr %4, i64 %739
  store i8 %738, ptr %740, align 1, !tbaa !2
  %741 = add nuw nsw i64 %734, 1
  %742 = add i32 %735, 1
  %743 = add nuw nsw i64 %736, 1
  %744 = icmp eq i64 %743, %732
  br i1 %744, label %.loopexit14, label %.preheader, !llvm.loop !32

.loopexit14:                                      ; preds = %.preheader, %729
  %745 = phi i32 [ undef, %729 ], [ %742, %.preheader ]
  %746 = phi i64 [ %730, %729 ], [ %741, %.preheader ]
  %747 = phi i32 [ %731, %729 ], [ %742, %.preheader ]
  %748 = sub nsw i64 %730, %699
  %749 = icmp ugt i64 %748, -4
  br i1 %749, label %.loopexit, label %750

750:                                              ; preds = %.loopexit14
  %751 = getelementptr i8, ptr %1, i64 1
  %752 = getelementptr i8, ptr %1, i64 2
  %753 = getelementptr i8, ptr %1, i64 3
  br label %754

754:                                              ; preds = %754, %750
  %755 = phi i64 [ %746, %750 ], [ %776, %754 ]
  %756 = phi i32 [ %747, %750 ], [ %777, %754 ]
  %757 = getelementptr inbounds i8, ptr %1, i64 %755
  %758 = load i8, ptr %757, align 1, !tbaa !2
  %759 = zext i32 %756 to i64
  %760 = getelementptr inbounds i8, ptr %4, i64 %759
  store i8 %758, ptr %760, align 1, !tbaa !2
  %761 = add i32 %756, 1
  %762 = getelementptr i8, ptr %751, i64 %755
  %763 = load i8, ptr %762, align 1, !tbaa !2
  %764 = zext i32 %761 to i64
  %765 = getelementptr inbounds i8, ptr %4, i64 %764
  store i8 %763, ptr %765, align 1, !tbaa !2
  %766 = add i32 %756, 2
  %767 = getelementptr i8, ptr %752, i64 %755
  %768 = load i8, ptr %767, align 1, !tbaa !2
  %769 = zext i32 %766 to i64
  %770 = getelementptr inbounds i8, ptr %4, i64 %769
  store i8 %768, ptr %770, align 1, !tbaa !2
  %771 = add i32 %756, 3
  %772 = getelementptr i8, ptr %753, i64 %755
  %773 = load i8, ptr %772, align 1, !tbaa !2
  %774 = zext i32 %771 to i64
  %775 = getelementptr inbounds i8, ptr %4, i64 %774
  store i8 %773, ptr %775, align 1, !tbaa !2
  %776 = add nuw nsw i64 %755, 4
  %777 = add i32 %756, 4
  %778 = icmp eq i64 %776, %699
  br i1 %778, label %.loopexit, label %754, !llvm.loop !33

.loopexit:                                        ; preds = %754, %.loopexit14, %726, %693
  %779 = phi i32 [ %694, %693 ], [ %727, %726 ], [ %745, %.loopexit14 ], [ %777, %754 ]
  %780 = zext i32 %779 to i64
  %781 = getelementptr inbounds i8, ptr %4, i64 %780
  store i8 0, ptr %781, align 1, !tbaa !2
  br label %782

782:                                              ; preds = %.loopexit, %374, %133, %6
  %783 = phi i32 [ %779, %.loopexit ], [ 0, %6 ], [ 0, %133 ], [ 0, %374 ]
  call void @llvm.lifetime.end.p0(i64 10, ptr nonnull %10) #6
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %9) #6
  ret i32 %783
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v16i8(<16 x i8>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.or.v8i8(<8 x i8>) #5

attributes #0 = { alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" }
attributes #3 = { alwaysinline nofree norecurse nosync nounwind memory(argmem: read) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" }
attributes #4 = { alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.peeled.count", i32 1}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !8, !9}
!11 = distinct !{!11, !9, !8}
!12 = distinct !{!12, !8, !9}
!13 = distinct !{!13, !8, !9}
!14 = distinct !{!14, !9, !8}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !3, i64 0}
!17 = distinct !{!17, !8, !9}
!18 = distinct !{!18, !8, !9}
!19 = distinct !{!19, !9, !8}
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !3, i64 0}
!22 = distinct !{!22, !8, !9}
!23 = distinct !{!23, !8, !9}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !9, !8}
!27 = distinct !{!27, !8}
!28 = distinct !{!28, !8, !9}
!29 = distinct !{!29, !25}
!30 = distinct !{!30, !8}
!31 = distinct !{!31, !8, !9}
!32 = distinct !{!32, !25}
!33 = distinct !{!33, !8}
