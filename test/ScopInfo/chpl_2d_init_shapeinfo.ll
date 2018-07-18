;RUN: opt %loadPolly -polly-only-func=test_chpl -polly-scops -polly-invariant-load-hoisting -analyze < %s
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

%array_ty = type { i64, %array_ptr*, i8 }
%array_ptr = type { [2 x i64], [2 x i64], [2 x i64], i64, double*, double*, i8 }

; Function Attrs: readnone
define internal i64 @polly_array_index(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5) #0 {
  %tmp = mul nsw i64 %arg4, %arg2
  %tmp8 = add nsw i64 %tmp, %arg1
  %tmp9 = mul nsw i64 %arg5, %arg3
  %tmp10 = add nsw i64 %tmp8, %tmp9
  ret i64 %tmp10
}


; Function Attrs: noinline
define weak dso_local void @test_chpl(%array_ty* nonnull %arg) #1 {
bb:
  br label %bb23

bb23:                                             ; preds = %bb, %bb37
  %.0 = phi i64 [ 0, %bb ], [ %tmp38, %bb37 ]
  br label %bb24

bb24:                                             ; preds = %bb23, %bb24
  %.01 = phi i64 [ 0, %bb23 ], [ %tmp36, %bb24 ]
  %tmp25 = getelementptr inbounds %array_ty, %array_ty* %arg, i64 0, i32 1
  %tmp26 = load %array_ptr*, %array_ptr** %tmp25, align 8
  %tmp27 = getelementptr inbounds %array_ptr, %array_ptr* %tmp26, i64 0, i32 1, i64 1
  store i64 1, i64* %tmp27, align 8
  %tmp28 = getelementptr inbounds %array_ptr, %array_ptr* %tmp26, i64 0, i32 1, i64 0
  %tmp29 = load i64, i64* %tmp28, align 8
  %tmp30 = call i64 @polly_array_index(i64 0, i64 %tmp29, i64 1, i64 %.0, i64 %.01)
  %tmp31 = getelementptr inbounds %array_ptr, %array_ptr* %tmp26, i64 0, i32 5
  %tmp32 = load double*, double** %tmp31, align 8
  %tmp33 = getelementptr inbounds double, double* %tmp32, i64 %tmp30
  %tmp34 = add nuw nsw i64 %.01, %.0
  %tmp35 = sitofp i64 %tmp34 to double
  store double %tmp35, double* %tmp33, align 8
  %tmp36 = add nuw nsw i64 %.01, 1
  %exitcond = icmp ne i64 %tmp36, 1000
  br i1 %exitcond, label %bb24, label %bb37

bb37:                                             ; preds = %bb24
  %tmp38 = add nuw nsw i64 %.0, 1
  %exitcond8 = icmp ne i64 %tmp38, 1000
  br i1 %exitcond8, label %bb23, label %bb39

bb39:                                             ; preds = %bb37
  ret void
}

attributes #0 = { readnone }
attributes #1 = { noinline }
