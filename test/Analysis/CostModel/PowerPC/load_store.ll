; RUN: opt < %s  -cost-model -analyze -mtriple=powerpc64-unknown-linux-gnu -mcpu=pwr7 | FileCheck %s
target datalayout = "E-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f128:128:128-v128:128:128-n32:64"
target triple = "powerpc64-unknown-linux-gnu"

define i32 @stores(i32 %arg) {

  ; CHECK: cost of 1 {{.*}} store
  store i8 undef, i8* undef, align 4
  ; CHECK: cost of 1 {{.*}} store
  store i16 undef, i16* undef, align 4
  ; CHECK: cost of 1 {{.*}} store
  store i32 undef, i32* undef, align 4
  ; CHECK: cost of 2 {{.*}} store
  store i64 undef, i64* undef, align 4
  ; CHECK: cost of 4 {{.*}} store
  store i128 undef, i128* undef, align 4

  ret i32 undef
}
define i32 @loads(i32 %arg) {
  ; CHECK: cost of 1 {{.*}} load
  load i8* undef, align 4
  ; CHECK: cost of 1 {{.*}} load
  load i16* undef, align 4
  ; CHECK: cost of 1 {{.*}} load
  load i32* undef, align 4
  ; CHECK: cost of 2 {{.*}} load
  load i64* undef, align 4
  ; CHECK: cost of 4 {{.*}} load
  load i128* undef, align 4

  ret i32 undef
}

