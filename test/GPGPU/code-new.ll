; ModuleID = 'kernel_0'
source_filename = "kernel_0"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @kernel_0(i8* %MemRef_out_l_055__phi, i8* %MemRef_out_l_055, i8* %MemRef_c, i32) #0 {
entry:
  %out_l.055.s2a = alloca i32
  %out_l.055.phiops = alloca i32
  %1 = bitcast i8* %MemRef_out_l_055__phi to i32*
  %2 = load i32, i32* %1
  store i32 %2, i32* %out_l.055.phiops
  %3 = bitcast i8* %MemRef_out_l_055 to i32*
  %4 = load i32, i32* %3
  store i32 %4, i32* %out_l.055.s2a
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %b0 = zext i32 %5 to i64
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %t0 = zext i32 %6 to i64
  br label %polly.cond

polly.cond:                                       ; preds = %entry
  %7 = mul nsw i64 32, %b0
  %8 = add nsw i64 %7, %t0
  %9 = icmp sle i64 %8, 48
  br i1 %9, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.merge6
  %10 = bitcast i8* %MemRef_out_l_055__phi to i32*
  %11 = load i32, i32* %out_l.055.phiops
  store i32 %11, i32* %10
  %12 = bitcast i8* %MemRef_out_l_055 to i32*
  %13 = load i32, i32* %out_l.055.s2a
  store i32 %13, i32* %12
  ret void

polly.then:                                       ; preds = %polly.cond
  br label %polly.cond1

polly.cond1:                                      ; preds = %polly.then
  %14 = icmp eq i64 %b0, 1
  %15 = icmp eq i64 %t0, 16
  %16 = and i1 %14, %15
  br i1 %16, label %polly.then3, label %polly.else4

polly.merge2:                                     ; preds = %polly.else4, %polly.stmt.for.cond1.preheader
  %17 = mul nsw i64 32, %b0
  %18 = add nsw i64 %17, %t0
  br label %polly.stmt.for.body17

polly.stmt.for.body17:                            ; preds = %polly.merge2
  %polly.access.cast.MemRef_c = bitcast i8* %MemRef_c to i32*
  %19 = mul nsw i64 32, %b0
  %20 = add nsw i64 %19, %t0
  %21 = add nsw i64 %20, 1
  %polly.access.MemRef_c = getelementptr i32, i32* %polly.access.cast.MemRef_c, i64 %21
  store i32 undef, i32* %polly.access.MemRef_c, align 4
  br label %polly.cond5

polly.cond5:                                      ; preds = %polly.stmt.for.body17
  %22 = icmp eq i64 %b0, 1
  %23 = icmp eq i64 %t0, 16
  %24 = and i1 %22, %23
  br i1 %24, label %polly.then7, label %polly.else8

polly.merge6:                                     ; preds = %polly.else8, %polly.stmt.for.cond15.for.cond12.loopexit_crit_edge
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge

polly.then3:                                      ; preds = %polly.cond1
  br label %polly.stmt.for.cond1.preheader

polly.stmt.for.cond1.preheader:                   ; preds = %polly.then3
  %out_l.055.phiops.reload = load i32, i32* %out_l.055.phiops
  store i32 %out_l.055.phiops.reload, i32* %out_l.055.s2a
  br label %polly.merge2

polly.else4:                                      ; preds = %polly.cond1
  br label %polly.merge2

polly.then7:                                      ; preds = %polly.cond5
  br label %polly.stmt.for.cond15.for.cond12.loopexit_crit_edge

polly.stmt.for.cond15.for.cond12.loopexit_crit_edge: ; preds = %polly.then7
  %out_l.055.s2a.reload = load i32, i32* %out_l.055.s2a
  %polly.access.cast.MemRef_c9 = bitcast i8* %MemRef_c to i32*
  %polly.access.MemRef_c10 = getelementptr i32, i32* %polly.access.cast.MemRef_c9, i64 49
  %tmp_p_scalar_ = load i32, i32* %polly.access.MemRef_c10, align 4
  %p_add78 = add nsw i32 %tmp_p_scalar_, %out_l.055.s2a.reload
  store i32 %p_add78, i32* %out_l.055.phiops
  br label %polly.merge6

polly.else8:                                      ; preds = %polly.cond5
  br label %polly.merge6
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { "polly.skip.fn" }
attributes #1 = { nounwind readnone }

!nvvm.annotations = !{!0}

!0 = !{void (i8*, i8*, i8*, i32)* @kernel_0, !"maxntidx", i32 32, !"maxntidy", i32 1, !"maxntidz", i32 1}
; ModuleID = '/home/bollu/llvm/llvm/tools/polly/test/GPGPU/phi-nodes-in-kernel.ll'
source_filename = "/home/bollu/llvm/llvm/tools/polly/test/GPGPU/phi-nodes-in-kernel.ll"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@kernel_0 = private unnamed_addr constant [1179 x i8] c"//\0A// Generated by LLVM NVPTX Back-End\0A//\0A\0A.version 3.2\0A.target sm_30\0A.address_size 64\0A\0A\09// .globl\09kernel_0\0A\0A.visible .entry kernel_0(\0A\09.param .u64 kernel_0_param_0,\0A\09.param .u64 kernel_0_param_1,\0A\09.param .u64 kernel_0_param_2,\0A\09.param .u32 kernel_0_param_3\0A)\0A.maxntid 32, 1, 1\0A{\0A\09.reg .pred \09%p<5>;\0A\09.reg .b32 \09%r<11>;\0A\09.reg .b64 \09%rd<10>;\0A\0A\09ld.param.u64 \09%rd4, [kernel_0_param_0];\0A\09ld.param.u64 \09%rd6, [kernel_0_param_1];\0A\09cvta.to.global.u64 \09%rd2, %rd6;\0A\09cvta.to.global.u64 \09%rd3, %rd4;\0A\09ld.global.u32 \09%r1, [%rd3];\0A\09ld.global.u32 \09%r10, [%rd2];\0A\09mov.u32 \09%r3, %ctaid.x;\0A\09mov.u32 \09%r4, %tid.x;\0A\09cvt.u64.u32 \09%rd7, %r4;\0A\09mul.wide.u32 \09%rd8, %r3, 32;\0A\09add.s64 \09%rd9, %rd8, %rd7;\0A\09setp.lt.u64 \09%p1, %rd9, 49;\0A\09@%p1 bra \09LBB0_3;\0A\09bra.uni \09LBB0_1;\0ALBB0_3:\0A\09setp.eq.s32 \09%p2, %r3, 1;\0A\09setp.eq.s32 \09%p3, %r4, 16;\0A\09and.pred  \09%p4, %p2, %p3;\0A\09mov.u32 \09%r9, %r1;\0A\09@!%p4 bra \09LBB0_2;\0A\09bra.uni \09LBB0_4;\0ALBB0_4:\0A\09ld.param.u64 \09%rd5, [kernel_0_param_2];\0A\09cvta.to.global.u64 \09%rd1, %rd5;\0A\09ld.global.u32 \09%r8, [%rd1+196];\0A\09add.s32 \09%r9, %r8, %r1;\0A\09mov.u32 \09%r10, %r1;\0A\09bra.uni \09LBB0_2;\0ALBB0_1:\0A\09mov.u32 \09%r9, %r1;\0ALBB0_2:\0A\09st.global.u32 \09[%rd3], %r9;\0A\09st.global.u32 \09[%rd2], %r10;\0A\09ret;\0A}\0A\0A\0A\00"
@kernel_0_name = private unnamed_addr constant [9 x i8] c"kernel_0\00"

define void @kernel_dynprog([50 x i32]* %c) {
entry:
  %out_l.055.s2a = alloca i32
  %out_l.055.phiops = alloca i32
  %arrayidx77 = getelementptr inbounds [50 x i32], [50 x i32]* %c, i64 0, i64 49
  %polly_launch_0_params = alloca [4 x i8*]
  %polly_launch_0_param_0 = alloca i8*
  %polly_launch_0_param_1 = alloca i8*
  %polly_launch_0_param_2 = alloca i8*
  %polly_launch_0_param_3 = alloca i32
  %polly_launch_0_params_i8ptr = bitcast [4 x i8*]* %polly_launch_0_params to i8*
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %0 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 1, i64 1)
  %.obit = extractvalue { i64, i1 } %0, 1
  %polly.overflow.state = or i1 false, %.obit
  %.res = extractvalue { i64, i1 } %0, 0
  %1 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %.res)
  %.obit1 = extractvalue { i64, i1 } %1, 1
  %polly.overflow.state2 = or i1 %polly.overflow.state, %.obit1
  %.res3 = extractvalue { i64, i1 } %1, 0
  %2 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %.res3)
  %.obit4 = extractvalue { i64, i1 } %2, 1
  %polly.overflow.state5 = or i1 %polly.overflow.state2, %.obit4
  %.res6 = extractvalue { i64, i1 } %2, 0
  %3 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 1, i64 1)
  %.obit7 = extractvalue { i64, i1 } %3, 1
  %polly.overflow.state8 = or i1 %polly.overflow.state5, %.obit7
  %.res9 = extractvalue { i64, i1 } %3, 0
  %4 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res9, i64 49)
  %.obit10 = extractvalue { i64, i1 } %4, 1
  %polly.overflow.state11 = or i1 %polly.overflow.state8, %.obit10
  %.res12 = extractvalue { i64, i1 } %4, 0
  %5 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %.res12)
  %.obit13 = extractvalue { i64, i1 } %5, 1
  %polly.overflow.state14 = or i1 %polly.overflow.state11, %.obit13
  %.res15 = extractvalue { i64, i1 } %5, 0
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res6, i64 %.res15)
  %.obit16 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state17 = or i1 %polly.overflow.state14, %.obit16
  %.res18 = extractvalue { i64, i1 } %6, 0
  %7 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 1, i64 1)
  %.obit19 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state20 = or i1 %polly.overflow.state17, %.obit19
  %.res21 = extractvalue { i64, i1 } %7, 0
  %8 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %.res21)
  %.obit22 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state23 = or i1 %polly.overflow.state20, %.obit22
  %.res24 = extractvalue { i64, i1 } %8, 0
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.res18, i64 %.res24)
  %.obit25 = extractvalue { i64, i1 } %9, 1
  %polly.overflow.state26 = or i1 %polly.overflow.state23, %.obit25
  %.res27 = extractvalue { i64, i1 } %9, 0
  %10 = icmp sge i64 %.res27, 2621440
  %11 = and i1 true, %10
  %polly.rtc.overflown = xor i1 %polly.overflow.state26, true
  %polly.rtc.result = and i1 %11, %polly.rtc.overflown
  br i1 false, label %polly.start, label %for.cond1.preheader.pre_entry_bb

for.cond1.preheader.pre_entry_bb:                 ; preds = %polly.split_new_and_old
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.pre_entry_bb, %for.cond15.for.cond12.loopexit_crit_edge
  %out_l.055 = phi i32 [ %add78, %for.cond15.for.cond12.loopexit_crit_edge ], [ 0, %for.cond1.preheader.pre_entry_bb ]
  %iter.054 = phi i32 [ %inc80, %for.cond15.for.cond12.loopexit_crit_edge ], [ 0, %for.cond1.preheader.pre_entry_bb ]
  br label %for.body17

for.cond15.for.cond12.loopexit_crit_edge:         ; preds = %for.body17
  %tmp = load i32, i32* %arrayidx77, align 4
  %add78 = add nsw i32 %tmp, %out_l.055
  %inc80 = add nuw nsw i32 %iter.054, 1
  br i1 false, label %for.cond1.preheader, label %polly.merge_new_and_old

for.body17:                                       ; preds = %for.body17, %for.cond1.preheader
  %indvars.iv71 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next72, %for.body17 ]
  %arrayidx69 = getelementptr inbounds [50 x i32], [50 x i32]* %c, i64 0, i64 %indvars.iv71
  store i32 undef, i32* %arrayidx69, align 4
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %lftr.wideiv74 = trunc i64 %indvars.iv.next72 to i32
  %exitcond75 = icmp ne i32 %lftr.wideiv74, 50
  br i1 %exitcond75, label %for.body17, label %for.cond15.for.cond12.loopexit_crit_edge

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.cond15.for.cond12.loopexit_crit_edge
  br label %for.end81

for.end81:                                        ; preds = %polly.merge_new_and_old
  ret void

polly.start:                                      ; preds = %polly.split_new_and_old
  store i32 0, i32* %out_l.055.phiops
  br label %polly.acc.initialize

polly.acc.initialize:                             ; preds = %polly.start
  %12 = call i8* @polly_initContext()
  %p_dev_array_MemRef_out_l_055__phi = call i8* @polly_allocateMemoryForDevice(i64 4)
  %p_dev_array_MemRef_out_l_055 = call i8* @polly_allocateMemoryForDevice(i64 4)
  %p_dev_array_MemRef_c = call i8* @polly_allocateMemoryForDevice(i64 196)
  %13 = bitcast i32* %out_l.055.phiops to i8*
  call void @polly_copyFromHostToDevice(i8* %13, i8* %p_dev_array_MemRef_out_l_055__phi, i64 4)
  %14 = call i8* @polly_getDevicePtr(i8* %p_dev_array_MemRef_out_l_055__phi)
  %15 = getelementptr [4 x i8*], [4 x i8*]* %polly_launch_0_params, i64 0, i64 0
  store i8* %14, i8** %polly_launch_0_param_0
  %16 = bitcast i8** %polly_launch_0_param_0 to i8*
  store i8* %16, i8** %15
  %17 = call i8* @polly_getDevicePtr(i8* %p_dev_array_MemRef_out_l_055)
  %18 = getelementptr [4 x i8*], [4 x i8*]* %polly_launch_0_params, i64 0, i64 1
  store i8* %17, i8** %polly_launch_0_param_1
  %19 = bitcast i8** %polly_launch_0_param_1 to i8*
  store i8* %19, i8** %18
  %20 = call i8* @polly_getDevicePtr(i8* %p_dev_array_MemRef_c)
  %21 = bitcast i8* %20 to i32*
  %22 = getelementptr i32, i32* %21, i64 -1
  %23 = bitcast i32* %22 to i8*
  %24 = getelementptr [4 x i8*], [4 x i8*]* %polly_launch_0_params, i64 0, i64 2
  store i8* %23, i8** %polly_launch_0_param_2
  %25 = bitcast i8** %polly_launch_0_param_2 to i8*
  store i8* %25, i8** %24
  store i32 undef, i32* %polly_launch_0_param_3
  %26 = getelementptr [4 x i8*], [4 x i8*]* %polly_launch_0_params, i64 0, i64 3
  %27 = bitcast i32* %polly_launch_0_param_3 to i8*
  store i8* %27, i8** %26
  %28 = call i8* @polly_getKernel(i8* getelementptr inbounds ([1179 x i8], [1179 x i8]* @kernel_0, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @kernel_0_name, i32 0, i32 0))
  call void @polly_launchKernel(i8* %28, i32 2, i32 1, i32 32, i32 1, i32 1, i8* %polly_launch_0_params_i8ptr)
  call void @polly_freeKernel(i8* %28)
  %29 = bitcast i32* %out_l.055.phiops to i8*
  call void @polly_copyFromDeviceToHost(i8* %p_dev_array_MemRef_out_l_055__phi, i8* %29, i64 4)
  %30 = bitcast i32* %out_l.055.s2a to i8*
  call void @polly_copyFromDeviceToHost(i8* %p_dev_array_MemRef_out_l_055, i8* %30, i64 4)
  %31 = bitcast [50 x i32]* %c to i32*
  %32 = getelementptr i32, i32* %31, i64 1
  %33 = bitcast i32* %32 to i8*
  call void @polly_copyFromDeviceToHost(i8* %p_dev_array_MemRef_c, i8* %33, i64 196)
  call void @polly_freeDeviceMemory(i8* %p_dev_array_MemRef_out_l_055)
  call void @polly_freeDeviceMemory(i8* %p_dev_array_MemRef_out_l_055__phi)
  call void @polly_freeDeviceMemory(i8* %p_dev_array_MemRef_c)
  call void @polly_freeContext(i8* %12)
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.acc.initialize
  br label %polly.merge_new_and_old
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i8* @polly_initContext()

declare i8* @polly_allocateMemoryForDevice(i64)

declare void @polly_copyFromHostToDevice(i8*, i8*, i64)

declare i8* @polly_getDevicePtr(i8*)

declare i8* @polly_getKernel(i8*, i8*)

declare void @polly_launchKernel(i8*, i32, i32, i32, i32, i32, i8*)

declare void @polly_freeKernel(i8*)

declare void @polly_copyFromDeviceToHost(i8*, i8*, i64)

declare void @polly_freeDeviceMemory(i8*)

declare void @polly_freeContext(i8*)

attributes #0 = { nounwind readnone }

