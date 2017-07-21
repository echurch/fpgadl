; ModuleID = 'net.cl'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir"

%struct.NetParam = type { float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

define spir_kernel void @dataLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca %struct.NetParam addrspace(1)*, align 4
  %4 = alloca i32 addrspace(1)*, align 4
  %loadDataCounterScale = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %3, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %4, align 4
  %5 = call spir_func i32 @_Z13get_global_idj(i32 0)
  %6 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %7 = mul i32 %5, %6
  %8 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %9 = mul i32 %7, %8
  %10 = call spir_func i32 @_Z13get_global_idj(i32 1)
  %11 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %12 = mul i32 %10, %11
  %13 = add i32 %9, %12
  %14 = call spir_func i32 @_Z13get_global_idj(i32 2)
  %15 = add i32 %13, %14
  store i32 %15, i32* %loadDataCounterScale, align 4
  br label %16

; <label>:16                                      ; preds = %22, %0
  %17 = load i32* %loadDataCounterScale, align 4
  %18 = load %struct.NetParam addrspace(1)** %3, align 4
  %19 = getelementptr inbounds %struct.NetParam addrspace(1)* %18, i32 0, i32 11
  %20 = load i32 addrspace(1)* %19, align 4
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %41

; <label>:22                                      ; preds = %16
  %23 = load i32* %loadDataCounterScale, align 4
  %24 = load float addrspace(1)** %1, align 4
  %25 = getelementptr inbounds float addrspace(1)* %24, i32 %23
  %26 = load float addrspace(1)* %25, align 4
  %27 = load %struct.NetParam addrspace(1)** %3, align 4
  %28 = getelementptr inbounds %struct.NetParam addrspace(1)* %27, i32 0, i32 0
  %29 = load float addrspace(1)* %28, align 4
  %30 = fmul float %26, %29
  %31 = load i32* %loadDataCounterScale, align 4
  %32 = load float addrspace(1)** %2, align 4
  %33 = getelementptr inbounds float addrspace(1)* %32, i32 %31
  store float %30, float addrspace(1)* %33, align 4
  %34 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %35 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %36 = mul i32 %34, %35
  %37 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %38 = mul i32 %36, %37
  %39 = load i32* %loadDataCounterScale, align 4
  %40 = add i32 %39, %38
  store i32 %40, i32* %loadDataCounterScale, align 4
  br label %16

; <label>:41                                      ; preds = %16
  ret void
}

declare spir_func i32 @_Z13get_global_idj(i32)

declare spir_func i32 @_Z15get_global_sizej(i32)

define spir_kernel void @paddingLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca %struct.NetParam addrspace(1)*, align 4
  %4 = alloca i32 addrspace(1)*, align 4
  %zero = alloca i8, align 1
  %channelCounter = alloca i32, align 4
  %heightCounter = alloca i32, align 4
  %widthCounter = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %3, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %4, align 4
  store i8 0, i8* %zero, align 1
  %5 = call spir_func i32 @_Z13get_global_idj(i32 0)
  store i32 %5, i32* %channelCounter, align 4
  br label %6

; <label>:6                                       ; preds = %125, %0
  %7 = load i32* %channelCounter, align 4
  %8 = load %struct.NetParam addrspace(1)** %3, align 4
  %9 = getelementptr inbounds %struct.NetParam addrspace(1)* %8, i32 0, i32 8
  %10 = load i32 addrspace(1)* %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %129

; <label>:12                                      ; preds = %6
  %13 = call spir_func i32 @_Z13get_global_idj(i32 1)
  store i32 %13, i32* %heightCounter, align 4
  br label %14

; <label>:14                                      ; preds = %121, %12
  %15 = load i32* %heightCounter, align 4
  %16 = load %struct.NetParam addrspace(1)** %3, align 4
  %17 = getelementptr inbounds %struct.NetParam addrspace(1)* %16, i32 0, i32 9
  %18 = load i32 addrspace(1)* %17, align 4
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %125

; <label>:20                                      ; preds = %14
  %21 = call spir_func i32 @_Z13get_global_idj(i32 2)
  store i32 %21, i32* %widthCounter, align 4
  br label %22

; <label>:22                                      ; preds = %97, %20
  %23 = load i32* %widthCounter, align 4
  %24 = load %struct.NetParam addrspace(1)** %3, align 4
  %25 = getelementptr inbounds %struct.NetParam addrspace(1)* %24, i32 0, i32 10
  %26 = load i32 addrspace(1)* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %121

; <label>:28                                      ; preds = %22
  %29 = load i32* %heightCounter, align 4
  %30 = load %struct.NetParam addrspace(1)** %3, align 4
  %31 = getelementptr inbounds %struct.NetParam addrspace(1)* %30, i32 0, i32 3
  %32 = load i32 addrspace(1)* %31, align 4
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %62, label %34

; <label>:34                                      ; preds = %28
  %35 = load i32* %widthCounter, align 4
  %36 = load %struct.NetParam addrspace(1)** %3, align 4
  %37 = getelementptr inbounds %struct.NetParam addrspace(1)* %36, i32 0, i32 3
  %38 = load i32 addrspace(1)* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %62, label %40

; <label>:40                                      ; preds = %34
  %41 = load %struct.NetParam addrspace(1)** %3, align 4
  %42 = getelementptr inbounds %struct.NetParam addrspace(1)* %41, i32 0, i32 10
  %43 = load i32 addrspace(1)* %42, align 4
  %44 = load i32* %widthCounter, align 4
  %45 = sub nsw i32 %43, %44
  %46 = sub nsw i32 %45, 1
  %47 = load %struct.NetParam addrspace(1)** %3, align 4
  %48 = getelementptr inbounds %struct.NetParam addrspace(1)* %47, i32 0, i32 3
  %49 = load i32 addrspace(1)* %48, align 4
  %50 = icmp slt i32 %46, %49
  br i1 %50, label %62, label %51

; <label>:51                                      ; preds = %40
  %52 = load %struct.NetParam addrspace(1)** %3, align 4
  %53 = getelementptr inbounds %struct.NetParam addrspace(1)* %52, i32 0, i32 9
  %54 = load i32 addrspace(1)* %53, align 4
  %55 = load i32* %heightCounter, align 4
  %56 = sub nsw i32 %54, %55
  %57 = sub nsw i32 %56, 1
  %58 = load %struct.NetParam addrspace(1)** %3, align 4
  %59 = getelementptr inbounds %struct.NetParam addrspace(1)* %58, i32 0, i32 3
  %60 = load i32 addrspace(1)* %59, align 4
  %61 = icmp slt i32 %57, %60
  br label %62

; <label>:62                                      ; preds = %51, %40, %34, %28
  %63 = phi i1 [ true, %40 ], [ true, %34 ], [ true, %28 ], [ %61, %51 ]
  %64 = zext i1 %63 to i8
  store i8 %64, i8* %zero, align 1
  %65 = load i8* %zero, align 1
  %66 = trunc i8 %65 to i1
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %62
  br label %97

; <label>:68                                      ; preds = %62
  %69 = load i32* %channelCounter, align 4
  %70 = load %struct.NetParam addrspace(1)** %3, align 4
  %71 = getelementptr inbounds %struct.NetParam addrspace(1)* %70, i32 0, i32 6
  %72 = load i32 addrspace(1)* %71, align 4
  %73 = mul nsw i32 %69, %72
  %74 = load %struct.NetParam addrspace(1)** %3, align 4
  %75 = getelementptr inbounds %struct.NetParam addrspace(1)* %74, i32 0, i32 7
  %76 = load i32 addrspace(1)* %75, align 4
  %77 = mul nsw i32 %73, %76
  %78 = load i32* %heightCounter, align 4
  %79 = load %struct.NetParam addrspace(1)** %3, align 4
  %80 = getelementptr inbounds %struct.NetParam addrspace(1)* %79, i32 0, i32 3
  %81 = load i32 addrspace(1)* %80, align 4
  %82 = sub nsw i32 %78, %81
  %83 = load %struct.NetParam addrspace(1)** %3, align 4
  %84 = getelementptr inbounds %struct.NetParam addrspace(1)* %83, i32 0, i32 7
  %85 = load i32 addrspace(1)* %84, align 4
  %86 = mul nsw i32 %82, %85
  %87 = add nsw i32 %77, %86
  %88 = load i32* %widthCounter, align 4
  %89 = load %struct.NetParam addrspace(1)** %3, align 4
  %90 = getelementptr inbounds %struct.NetParam addrspace(1)* %89, i32 0, i32 3
  %91 = load i32 addrspace(1)* %90, align 4
  %92 = sub nsw i32 %88, %91
  %93 = add nsw i32 %87, %92
  %94 = load float addrspace(1)** %1, align 4
  %95 = getelementptr inbounds float addrspace(1)* %94, i32 %93
  %96 = load float addrspace(1)* %95, align 4
  br label %97

; <label>:97                                      ; preds = %68, %67
  %98 = phi float [ 0.000000e+00, %67 ], [ %96, %68 ]
  %99 = load i32* %channelCounter, align 4
  %100 = load %struct.NetParam addrspace(1)** %3, align 4
  %101 = getelementptr inbounds %struct.NetParam addrspace(1)* %100, i32 0, i32 9
  %102 = load i32 addrspace(1)* %101, align 4
  %103 = mul nsw i32 %99, %102
  %104 = load %struct.NetParam addrspace(1)** %3, align 4
  %105 = getelementptr inbounds %struct.NetParam addrspace(1)* %104, i32 0, i32 10
  %106 = load i32 addrspace(1)* %105, align 4
  %107 = mul nsw i32 %103, %106
  %108 = load i32* %heightCounter, align 4
  %109 = load %struct.NetParam addrspace(1)** %3, align 4
  %110 = getelementptr inbounds %struct.NetParam addrspace(1)* %109, i32 0, i32 10
  %111 = load i32 addrspace(1)* %110, align 4
  %112 = mul nsw i32 %108, %111
  %113 = add nsw i32 %107, %112
  %114 = load i32* %widthCounter, align 4
  %115 = add nsw i32 %113, %114
  %116 = load float addrspace(1)** %2, align 4
  %117 = getelementptr inbounds float addrspace(1)* %116, i32 %115
  store float %98, float addrspace(1)* %117, align 4
  %118 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %119 = load i32* %widthCounter, align 4
  %120 = add i32 %119, %118
  store i32 %120, i32* %widthCounter, align 4
  br label %22

; <label>:121                                     ; preds = %22
  %122 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %123 = load i32* %heightCounter, align 4
  %124 = add i32 %123, %122
  store i32 %124, i32* %heightCounter, align 4
  br label %14

; <label>:125                                     ; preds = %14
  %126 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %127 = load i32* %channelCounter, align 4
  %128 = add i32 %127, %126
  store i32 %128, i32* %channelCounter, align 4
  br label %6

; <label>:129                                     ; preds = %6
  ret void
}

define spir_kernel void @poolingLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca %struct.NetParam addrspace(1)*, align 4
  %4 = alloca i32 addrspace(1)*, align 4
  %maxValue = alloca float, align 4
  %_temp = alloca float, align 4
  %channelCounter = alloca i32, align 4
  %heightCounter = alloca i32, align 4
  %widthCounter = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %3, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %4, align 4
  %5 = call spir_func i32 @_Z13get_global_idj(i32 0)
  store i32 %5, i32* %channelCounter, align 4
  br label %6

; <label>:6                                       ; preds = %147, %0
  %7 = load i32* %channelCounter, align 4
  %8 = load %struct.NetParam addrspace(1)** %3, align 4
  %9 = getelementptr inbounds %struct.NetParam addrspace(1)* %8, i32 0, i32 8
  %10 = load i32 addrspace(1)* %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %151

; <label>:12                                      ; preds = %6
  %13 = call spir_func i32 @_Z13get_global_idj(i32 1)
  store i32 %13, i32* %heightCounter, align 4
  br label %14

; <label>:14                                      ; preds = %143, %12
  %15 = load i32* %heightCounter, align 4
  %16 = load %struct.NetParam addrspace(1)** %3, align 4
  %17 = getelementptr inbounds %struct.NetParam addrspace(1)* %16, i32 0, i32 9
  %18 = load i32 addrspace(1)* %17, align 4
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %147

; <label>:20                                      ; preds = %14
  %21 = call spir_func i32 @_Z13get_global_idj(i32 2)
  store i32 %21, i32* %widthCounter, align 4
  br label %22

; <label>:22                                      ; preds = %119, %20
  %23 = load i32* %widthCounter, align 4
  %24 = load %struct.NetParam addrspace(1)** %3, align 4
  %25 = getelementptr inbounds %struct.NetParam addrspace(1)* %24, i32 0, i32 10
  %26 = load i32 addrspace(1)* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %143

; <label>:28                                      ; preds = %22
  %29 = load i32* %channelCounter, align 4
  %30 = load %struct.NetParam addrspace(1)** %3, align 4
  %31 = getelementptr inbounds %struct.NetParam addrspace(1)* %30, i32 0, i32 6
  %32 = load i32 addrspace(1)* %31, align 4
  %33 = mul nsw i32 %29, %32
  %34 = load %struct.NetParam addrspace(1)** %3, align 4
  %35 = getelementptr inbounds %struct.NetParam addrspace(1)* %34, i32 0, i32 7
  %36 = load i32 addrspace(1)* %35, align 4
  %37 = mul nsw i32 %33, %36
  %38 = load i32* %heightCounter, align 4
  %39 = load %struct.NetParam addrspace(1)** %3, align 4
  %40 = getelementptr inbounds %struct.NetParam addrspace(1)* %39, i32 0, i32 1
  %41 = load i32 addrspace(1)* %40, align 4
  %42 = mul nsw i32 %38, %41
  %43 = load %struct.NetParam addrspace(1)** %3, align 4
  %44 = getelementptr inbounds %struct.NetParam addrspace(1)* %43, i32 0, i32 7
  %45 = load i32 addrspace(1)* %44, align 4
  %46 = mul nsw i32 %42, %45
  %47 = add nsw i32 %37, %46
  %48 = load i32* %widthCounter, align 4
  %49 = load %struct.NetParam addrspace(1)** %3, align 4
  %50 = getelementptr inbounds %struct.NetParam addrspace(1)* %49, i32 0, i32 1
  %51 = load i32 addrspace(1)* %50, align 4
  %52 = mul nsw i32 %48, %51
  %53 = add nsw i32 %47, %52
  %54 = load float addrspace(1)** %1, align 4
  %55 = getelementptr inbounds float addrspace(1)* %54, i32 %53
  %56 = load float addrspace(1)* %55, align 4
  store float %56, float* %maxValue, align 4
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %116, %28
  %58 = load i32* %i, align 4
  %59 = load %struct.NetParam addrspace(1)** %3, align 4
  %60 = getelementptr inbounds %struct.NetParam addrspace(1)* %59, i32 0, i32 2
  %61 = load i32 addrspace(1)* %60, align 4
  %62 = icmp slt i32 %58, %61
  br i1 %62, label %63, label %119

; <label>:63                                      ; preds = %57
  store i32 0, i32* %j, align 4
  br label %64

; <label>:64                                      ; preds = %112, %63
  %65 = load i32* %j, align 4
  %66 = load %struct.NetParam addrspace(1)** %3, align 4
  %67 = getelementptr inbounds %struct.NetParam addrspace(1)* %66, i32 0, i32 2
  %68 = load i32 addrspace(1)* %67, align 4
  %69 = icmp slt i32 %65, %68
  br i1 %69, label %70, label %115

; <label>:70                                      ; preds = %64
  %71 = load i32* %channelCounter, align 4
  %72 = load %struct.NetParam addrspace(1)** %3, align 4
  %73 = getelementptr inbounds %struct.NetParam addrspace(1)* %72, i32 0, i32 6
  %74 = load i32 addrspace(1)* %73, align 4
  %75 = mul nsw i32 %71, %74
  %76 = load %struct.NetParam addrspace(1)** %3, align 4
  %77 = getelementptr inbounds %struct.NetParam addrspace(1)* %76, i32 0, i32 7
  %78 = load i32 addrspace(1)* %77, align 4
  %79 = mul nsw i32 %75, %78
  %80 = load i32* %heightCounter, align 4
  %81 = load %struct.NetParam addrspace(1)** %3, align 4
  %82 = getelementptr inbounds %struct.NetParam addrspace(1)* %81, i32 0, i32 1
  %83 = load i32 addrspace(1)* %82, align 4
  %84 = mul nsw i32 %80, %83
  %85 = load i32* %i, align 4
  %86 = add nsw i32 %84, %85
  %87 = load %struct.NetParam addrspace(1)** %3, align 4
  %88 = getelementptr inbounds %struct.NetParam addrspace(1)* %87, i32 0, i32 7
  %89 = load i32 addrspace(1)* %88, align 4
  %90 = mul nsw i32 %86, %89
  %91 = add nsw i32 %79, %90
  %92 = load i32* %widthCounter, align 4
  %93 = load %struct.NetParam addrspace(1)** %3, align 4
  %94 = getelementptr inbounds %struct.NetParam addrspace(1)* %93, i32 0, i32 1
  %95 = load i32 addrspace(1)* %94, align 4
  %96 = mul nsw i32 %92, %95
  %97 = load i32* %j, align 4
  %98 = add nsw i32 %96, %97
  %99 = add nsw i32 %91, %98
  %100 = load float addrspace(1)** %1, align 4
  %101 = getelementptr inbounds float addrspace(1)* %100, i32 %99
  %102 = load float addrspace(1)* %101, align 4
  store float %102, float* %_temp, align 4
  %103 = load float* %maxValue, align 4
  %104 = load float* %_temp, align 4
  %105 = fcmp ogt float %103, %104
  br i1 %105, label %106, label %108

; <label>:106                                     ; preds = %70
  %107 = load float* %maxValue, align 4
  br label %110

; <label>:108                                     ; preds = %70
  %109 = load float* %_temp, align 4
  br label %110

; <label>:110                                     ; preds = %108, %106
  %111 = phi float [ %107, %106 ], [ %109, %108 ]
  store float %111, float* %maxValue, align 4
  br label %112

; <label>:112                                     ; preds = %110
  %113 = load i32* %j, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %j, align 4
  br label %64

; <label>:115                                     ; preds = %64
  br label %116

; <label>:116                                     ; preds = %115
  %117 = load i32* %i, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %i, align 4
  br label %57

; <label>:119                                     ; preds = %57
  %120 = load float* %maxValue, align 4
  %121 = load i32* %channelCounter, align 4
  %122 = load %struct.NetParam addrspace(1)** %3, align 4
  %123 = getelementptr inbounds %struct.NetParam addrspace(1)* %122, i32 0, i32 9
  %124 = load i32 addrspace(1)* %123, align 4
  %125 = mul nsw i32 %121, %124
  %126 = load %struct.NetParam addrspace(1)** %3, align 4
  %127 = getelementptr inbounds %struct.NetParam addrspace(1)* %126, i32 0, i32 10
  %128 = load i32 addrspace(1)* %127, align 4
  %129 = mul nsw i32 %125, %128
  %130 = load i32* %heightCounter, align 4
  %131 = load %struct.NetParam addrspace(1)** %3, align 4
  %132 = getelementptr inbounds %struct.NetParam addrspace(1)* %131, i32 0, i32 10
  %133 = load i32 addrspace(1)* %132, align 4
  %134 = mul nsw i32 %130, %133
  %135 = add nsw i32 %129, %134
  %136 = load i32* %widthCounter, align 4
  %137 = add nsw i32 %135, %136
  %138 = load float addrspace(1)** %2, align 4
  %139 = getelementptr inbounds float addrspace(1)* %138, i32 %137
  store float %120, float addrspace(1)* %139, align 4
  %140 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %141 = load i32* %widthCounter, align 4
  %142 = add i32 %141, %140
  store i32 %142, i32* %widthCounter, align 4
  br label %22

; <label>:143                                     ; preds = %22
  %144 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %145 = load i32* %heightCounter, align 4
  %146 = add i32 %145, %144
  store i32 %146, i32* %heightCounter, align 4
  br label %14

; <label>:147                                     ; preds = %14
  %148 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %149 = load i32* %channelCounter, align 4
  %150 = add i32 %149, %148
  store i32 %150, i32* %channelCounter, align 4
  br label %6

; <label>:151                                     ; preds = %6
  ret void
}

define spir_kernel void @reluLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca %struct.NetParam addrspace(1)*, align 4
  %4 = alloca i32 addrspace(1)*, align 4
  %reluCounter = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %3, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %4, align 4
  %5 = call spir_func i32 @_Z13get_global_idj(i32 0)
  %6 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %7 = mul i32 %5, %6
  %8 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %9 = mul i32 %7, %8
  %10 = call spir_func i32 @_Z13get_global_idj(i32 1)
  %11 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %12 = mul i32 %10, %11
  %13 = add i32 %9, %12
  %14 = call spir_func i32 @_Z13get_global_idj(i32 2)
  %15 = add i32 %13, %14
  store i32 %15, i32* %reluCounter, align 4
  br label %16

; <label>:16                                      ; preds = %34, %0
  %17 = load i32* %reluCounter, align 4
  %18 = load %struct.NetParam addrspace(1)** %3, align 4
  %19 = getelementptr inbounds %struct.NetParam addrspace(1)* %18, i32 0, i32 11
  %20 = load i32 addrspace(1)* %19, align 4
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %46

; <label>:22                                      ; preds = %16
  %23 = load i32* %reluCounter, align 4
  %24 = load float addrspace(1)** %1, align 4
  %25 = getelementptr inbounds float addrspace(1)* %24, i32 %23
  %26 = load float addrspace(1)* %25, align 4
  %27 = fcmp ogt float %26, 0.000000e+00
  br i1 %27, label %28, label %33

; <label>:28                                      ; preds = %22
  %29 = load i32* %reluCounter, align 4
  %30 = load float addrspace(1)** %1, align 4
  %31 = getelementptr inbounds float addrspace(1)* %30, i32 %29
  %32 = load float addrspace(1)* %31, align 4
  br label %34

; <label>:33                                      ; preds = %22
  br label %34

; <label>:34                                      ; preds = %33, %28
  %35 = phi float [ %32, %28 ], [ 0.000000e+00, %33 ]
  %36 = load i32* %reluCounter, align 4
  %37 = load float addrspace(1)** %2, align 4
  %38 = getelementptr inbounds float addrspace(1)* %37, i32 %36
  store float %35, float addrspace(1)* %38, align 4
  %39 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %40 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %41 = mul i32 %39, %40
  %42 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %43 = mul i32 %41, %42
  %44 = load i32* %reluCounter, align 4
  %45 = add i32 %44, %43
  store i32 %45, i32* %reluCounter, align 4
  br label %16

; <label>:46                                      ; preds = %16
  ret void
}

define spir_kernel void @convLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, float addrspace(1)* %weight, float addrspace(1)* %bias, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca float addrspace(1)*, align 4
  %4 = alloca float addrspace(1)*, align 4
  %5 = alloca %struct.NetParam addrspace(1)*, align 4
  %6 = alloca i32 addrspace(1)*, align 4
  %dilatedKernelSize = alloca i32, align 4
  %result = alloca float, align 4
  %channelCounter = alloca i32, align 4
  %heightCounter = alloca i32, align 4
  %widthCounter = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store float addrspace(1)* %weight, float addrspace(1)** %3, align 4
  store float addrspace(1)* %bias, float addrspace(1)** %4, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %5, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %6, align 4
  %7 = load %struct.NetParam addrspace(1)** %5, align 4
  %8 = getelementptr inbounds %struct.NetParam addrspace(1)* %7, i32 0, i32 2
  %9 = load i32 addrspace(1)* %8, align 4
  %10 = sub nsw i32 %9, 1
  %11 = load %struct.NetParam addrspace(1)** %5, align 4
  %12 = getelementptr inbounds %struct.NetParam addrspace(1)* %11, i32 0, i32 4
  %13 = load i32 addrspace(1)* %12, align 4
  %14 = mul nsw i32 %10, %13
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %dilatedKernelSize, align 4
  %16 = call spir_func i32 @_Z13get_global_idj(i32 0)
  store i32 %16, i32* %channelCounter, align 4
  br label %17

; <label>:17                                      ; preds = %183, %0
  %18 = load i32* %channelCounter, align 4
  %19 = load %struct.NetParam addrspace(1)** %5, align 4
  %20 = getelementptr inbounds %struct.NetParam addrspace(1)* %19, i32 0, i32 8
  %21 = load i32 addrspace(1)* %20, align 4
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %187

; <label>:23                                      ; preds = %17
  %24 = call spir_func i32 @_Z13get_global_idj(i32 1)
  store i32 %24, i32* %heightCounter, align 4
  br label %25

; <label>:25                                      ; preds = %179, %23
  %26 = load i32* %heightCounter, align 4
  %27 = load %struct.NetParam addrspace(1)** %5, align 4
  %28 = getelementptr inbounds %struct.NetParam addrspace(1)* %27, i32 0, i32 9
  %29 = load i32 addrspace(1)* %28, align 4
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %183

; <label>:31                                      ; preds = %25
  %32 = call spir_func i32 @_Z13get_global_idj(i32 2)
  store i32 %32, i32* %widthCounter, align 4
  br label %33

; <label>:33                                      ; preds = %149, %31
  %34 = load i32* %widthCounter, align 4
  %35 = load %struct.NetParam addrspace(1)** %5, align 4
  %36 = getelementptr inbounds %struct.NetParam addrspace(1)* %35, i32 0, i32 10
  %37 = load i32 addrspace(1)* %36, align 4
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %179

; <label>:39                                      ; preds = %33
  store float 0.000000e+00, float* %result, align 4
  store i32 0, i32* %c, align 4
  br label %40

; <label>:40                                      ; preds = %146, %39
  %41 = load i32* %c, align 4
  %42 = load %struct.NetParam addrspace(1)** %5, align 4
  %43 = getelementptr inbounds %struct.NetParam addrspace(1)* %42, i32 0, i32 5
  %44 = load i32 addrspace(1)* %43, align 4
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %149

; <label>:46                                      ; preds = %40
  store i32 0, i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %142, %46
  %48 = load i32* %i, align 4
  %49 = load %struct.NetParam addrspace(1)** %5, align 4
  %50 = getelementptr inbounds %struct.NetParam addrspace(1)* %49, i32 0, i32 2
  %51 = load i32 addrspace(1)* %50, align 4
  %52 = icmp slt i32 %48, %51
  br i1 %52, label %53, label %145

; <label>:53                                      ; preds = %47
  store i32 0, i32* %j, align 4
  br label %54

; <label>:54                                      ; preds = %138, %53
  %55 = load i32* %j, align 4
  %56 = load %struct.NetParam addrspace(1)** %5, align 4
  %57 = getelementptr inbounds %struct.NetParam addrspace(1)* %56, i32 0, i32 2
  %58 = load i32 addrspace(1)* %57, align 4
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %141

; <label>:60                                      ; preds = %54
  %61 = load i32* %c, align 4
  %62 = load %struct.NetParam addrspace(1)** %5, align 4
  %63 = getelementptr inbounds %struct.NetParam addrspace(1)* %62, i32 0, i32 6
  %64 = load i32 addrspace(1)* %63, align 4
  %65 = mul nsw i32 %61, %64
  %66 = load %struct.NetParam addrspace(1)** %5, align 4
  %67 = getelementptr inbounds %struct.NetParam addrspace(1)* %66, i32 0, i32 7
  %68 = load i32 addrspace(1)* %67, align 4
  %69 = mul nsw i32 %65, %68
  %70 = load i32* %heightCounter, align 4
  %71 = load %struct.NetParam addrspace(1)** %5, align 4
  %72 = getelementptr inbounds %struct.NetParam addrspace(1)* %71, i32 0, i32 1
  %73 = load i32 addrspace(1)* %72, align 4
  %74 = mul nsw i32 %70, %73
  %75 = load i32* %i, align 4
  %76 = load %struct.NetParam addrspace(1)** %5, align 4
  %77 = getelementptr inbounds %struct.NetParam addrspace(1)* %76, i32 0, i32 4
  %78 = load i32 addrspace(1)* %77, align 4
  %79 = mul nsw i32 %75, %78
  %80 = add nsw i32 %74, %79
  %81 = load %struct.NetParam addrspace(1)** %5, align 4
  %82 = getelementptr inbounds %struct.NetParam addrspace(1)* %81, i32 0, i32 7
  %83 = load i32 addrspace(1)* %82, align 4
  %84 = mul nsw i32 %80, %83
  %85 = add nsw i32 %69, %84
  %86 = load i32* %widthCounter, align 4
  %87 = load %struct.NetParam addrspace(1)** %5, align 4
  %88 = getelementptr inbounds %struct.NetParam addrspace(1)* %87, i32 0, i32 1
  %89 = load i32 addrspace(1)* %88, align 4
  %90 = mul nsw i32 %86, %89
  %91 = load i32* %j, align 4
  %92 = load %struct.NetParam addrspace(1)** %5, align 4
  %93 = getelementptr inbounds %struct.NetParam addrspace(1)* %92, i32 0, i32 4
  %94 = load i32 addrspace(1)* %93, align 4
  %95 = mul nsw i32 %91, %94
  %96 = add nsw i32 %90, %95
  %97 = add nsw i32 %85, %96
  %98 = load float addrspace(1)** %1, align 4
  %99 = getelementptr inbounds float addrspace(1)* %98, i32 %97
  %100 = load float addrspace(1)* %99, align 4
  %101 = load i32* %channelCounter, align 4
  %102 = load %struct.NetParam addrspace(1)** %5, align 4
  %103 = getelementptr inbounds %struct.NetParam addrspace(1)* %102, i32 0, i32 2
  %104 = load i32 addrspace(1)* %103, align 4
  %105 = mul nsw i32 %101, %104
  %106 = load %struct.NetParam addrspace(1)** %5, align 4
  %107 = getelementptr inbounds %struct.NetParam addrspace(1)* %106, i32 0, i32 2
  %108 = load i32 addrspace(1)* %107, align 4
  %109 = mul nsw i32 %105, %108
  %110 = load %struct.NetParam addrspace(1)** %5, align 4
  %111 = getelementptr inbounds %struct.NetParam addrspace(1)* %110, i32 0, i32 5
  %112 = load i32 addrspace(1)* %111, align 4
  %113 = mul nsw i32 %109, %112
  %114 = load i32* %c, align 4
  %115 = load %struct.NetParam addrspace(1)** %5, align 4
  %116 = getelementptr inbounds %struct.NetParam addrspace(1)* %115, i32 0, i32 2
  %117 = load i32 addrspace(1)* %116, align 4
  %118 = mul nsw i32 %114, %117
  %119 = load %struct.NetParam addrspace(1)** %5, align 4
  %120 = getelementptr inbounds %struct.NetParam addrspace(1)* %119, i32 0, i32 2
  %121 = load i32 addrspace(1)* %120, align 4
  %122 = mul nsw i32 %118, %121
  %123 = add nsw i32 %113, %122
  %124 = load i32* %i, align 4
  %125 = load %struct.NetParam addrspace(1)** %5, align 4
  %126 = getelementptr inbounds %struct.NetParam addrspace(1)* %125, i32 0, i32 2
  %127 = load i32 addrspace(1)* %126, align 4
  %128 = mul nsw i32 %124, %127
  %129 = add nsw i32 %123, %128
  %130 = load i32* %j, align 4
  %131 = add nsw i32 %129, %130
  %132 = load float addrspace(1)** %3, align 4
  %133 = getelementptr inbounds float addrspace(1)* %132, i32 %131
  %134 = load float addrspace(1)* %133, align 4
  %135 = fmul float %100, %134
  %136 = load float* %result, align 4
  %137 = fadd float %136, %135
  store float %137, float* %result, align 4
  br label %138

; <label>:138                                     ; preds = %60
  %139 = load i32* %j, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %j, align 4
  br label %54

; <label>:141                                     ; preds = %54
  br label %142

; <label>:142                                     ; preds = %141
  %143 = load i32* %i, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %i, align 4
  br label %47

; <label>:145                                     ; preds = %47
  br label %146

; <label>:146                                     ; preds = %145
  %147 = load i32* %c, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %c, align 4
  br label %40

; <label>:149                                     ; preds = %40
  %150 = load i32* %channelCounter, align 4
  %151 = load float addrspace(1)** %4, align 4
  %152 = getelementptr inbounds float addrspace(1)* %151, i32 %150
  %153 = load float addrspace(1)* %152, align 4
  %154 = load float* %result, align 4
  %155 = fadd float %154, %153
  store float %155, float* %result, align 4
  %156 = load float* %result, align 4
  %157 = load i32* %channelCounter, align 4
  %158 = load %struct.NetParam addrspace(1)** %5, align 4
  %159 = getelementptr inbounds %struct.NetParam addrspace(1)* %158, i32 0, i32 9
  %160 = load i32 addrspace(1)* %159, align 4
  %161 = mul nsw i32 %157, %160
  %162 = load %struct.NetParam addrspace(1)** %5, align 4
  %163 = getelementptr inbounds %struct.NetParam addrspace(1)* %162, i32 0, i32 10
  %164 = load i32 addrspace(1)* %163, align 4
  %165 = mul nsw i32 %161, %164
  %166 = load i32* %heightCounter, align 4
  %167 = load %struct.NetParam addrspace(1)** %5, align 4
  %168 = getelementptr inbounds %struct.NetParam addrspace(1)* %167, i32 0, i32 10
  %169 = load i32 addrspace(1)* %168, align 4
  %170 = mul nsw i32 %166, %169
  %171 = add nsw i32 %165, %170
  %172 = load i32* %widthCounter, align 4
  %173 = add nsw i32 %171, %172
  %174 = load float addrspace(1)** %2, align 4
  %175 = getelementptr inbounds float addrspace(1)* %174, i32 %173
  store float %156, float addrspace(1)* %175, align 4
  %176 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %177 = load i32* %widthCounter, align 4
  %178 = add i32 %177, %176
  store i32 %178, i32* %widthCounter, align 4
  br label %33

; <label>:179                                     ; preds = %33
  %180 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %181 = load i32* %heightCounter, align 4
  %182 = add i32 %181, %180
  store i32 %182, i32* %heightCounter, align 4
  br label %25

; <label>:183                                     ; preds = %25
  %184 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %185 = load i32* %channelCounter, align 4
  %186 = add i32 %185, %184
  store i32 %186, i32* %channelCounter, align 4
  br label %17

; <label>:187                                     ; preds = %17
  ret void
}

define spir_kernel void @outputLayer(float addrspace(1)* %inputFeatureMap, float addrspace(1)* %outputFeatureMap, %struct.NetParam addrspace(1)* %param, i32 addrspace(1)* %phase) nounwind {
  %1 = alloca float addrspace(1)*, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca %struct.NetParam addrspace(1)*, align 4
  %4 = alloca i32 addrspace(1)*, align 4
  %loadDataCounter = alloca i32, align 4
  store float addrspace(1)* %inputFeatureMap, float addrspace(1)** %1, align 4
  store float addrspace(1)* %outputFeatureMap, float addrspace(1)** %2, align 4
  store %struct.NetParam addrspace(1)* %param, %struct.NetParam addrspace(1)** %3, align 4
  store i32 addrspace(1)* %phase, i32 addrspace(1)** %4, align 4
  %5 = call spir_func i32 @_Z13get_global_idj(i32 0)
  %6 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %7 = mul i32 %5, %6
  %8 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %9 = mul i32 %7, %8
  %10 = call spir_func i32 @_Z13get_global_idj(i32 1)
  %11 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %12 = mul i32 %10, %11
  %13 = add i32 %9, %12
  %14 = call spir_func i32 @_Z13get_global_idj(i32 2)
  %15 = add i32 %13, %14
  store i32 %15, i32* %loadDataCounter, align 4
  br label %16

; <label>:16                                      ; preds = %22, %0
  %17 = load i32* %loadDataCounter, align 4
  %18 = load %struct.NetParam addrspace(1)** %3, align 4
  %19 = getelementptr inbounds %struct.NetParam addrspace(1)* %18, i32 0, i32 11
  %20 = load i32 addrspace(1)* %19, align 4
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %37

; <label>:22                                      ; preds = %16
  %23 = load i32* %loadDataCounter, align 4
  %24 = load float addrspace(1)** %1, align 4
  %25 = getelementptr inbounds float addrspace(1)* %24, i32 %23
  %26 = load float addrspace(1)* %25, align 4
  %27 = load i32* %loadDataCounter, align 4
  %28 = load float addrspace(1)** %2, align 4
  %29 = getelementptr inbounds float addrspace(1)* %28, i32 %27
  store float %26, float addrspace(1)* %29, align 4
  %30 = call spir_func i32 @_Z15get_global_sizej(i32 0)
  %31 = call spir_func i32 @_Z15get_global_sizej(i32 1)
  %32 = mul i32 %30, %31
  %33 = call spir_func i32 @_Z15get_global_sizej(i32 2)
  %34 = mul i32 %32, %33
  %35 = load i32* %loadDataCounter, align 4
  %36 = add i32 %35, %34
  store i32 %36, i32* %loadDataCounter, align 4
  br label %16

; <label>:37                                      ; preds = %16
  ret void
}

!opencl.kernels = !{!0, !6, !7, !8, !9, !15}

!0 = metadata !{void (float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @dataLayer, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"dType*", metadata !"dType*", metadata !"NetParam*", metadata !"BOOL*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"inputFeatureMap", metadata !"outputFeatureMap", metadata !"param", metadata !"phase"}
!6 = metadata !{void (float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @paddingLayer, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!7 = metadata !{void (float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @poolingLayer, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!8 = metadata !{void (float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @reluLayer, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!9 = metadata !{void (float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @convLayer, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14}
!10 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!11 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!12 = metadata !{metadata !"kernel_arg_type", metadata !"dType*", metadata !"dType*", metadata !"dType*", metadata !"dType*", metadata !"NetParam*", metadata !"BOOL*"}
!13 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"const", metadata !""}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"inputFeatureMap", metadata !"outputFeatureMap", metadata !"weight", metadata !"bias", metadata !"param", metadata !"phase"}
!15 = metadata !{void (float addrspace(1)*, float addrspace(1)*, %struct.NetParam addrspace(1)*, i32 addrspace(1)*)* @outputLayer, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
