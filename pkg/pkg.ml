#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "simple-diff" @@ fun c ->
  Ok [
    Pkg.mllib "src/simple_diff.mllib";
    Pkg.test "src_test/test";
  ]
