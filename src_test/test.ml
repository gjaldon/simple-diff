let old_lines = [| "I"; "really"; "like"; "icecream" |]
let new_lines = [| "I"; "do"; "not"; "like"; "icecream" |]

module Diff = Simple_diff.Make(String)
open Diff

let expected =
  [ Equal   [| "I"; |];
    Deleted [| "really" |];
    Added [| "do"; "not" |];
    Equal [| "like"; "icecream" |];
  ]

let pp diffs =
  List.fold_left(fun str diff ->
    let content lines = String.concat "," (Array.to_list lines) in
    let new_str = match diff with
      | Equal lines ->
        "Equal: " ^ content lines
      | Deleted lines ->
        "Deleted: " ^ content lines
      | Added lines ->
        "Added: " ^ content lines
    in
    str ^ "\n" ^ new_str
  ) "" diffs

let () =
  let diffs = get_diff old_lines new_lines in
  if diffs = expected then
    Printf.printf "SUCCESS"
  else
    let () = Printf.printf "FAILED!\n\nActual:%s" (pp diffs) in
    Printf.printf "\n\nExpected:%s" (pp expected)
