let old_value = "Foo bar baz\nTesticles\nmurder\nshe\nwrote\nend"
let new_value = "Foo bar baz\nTest\nmurder\nshe\nwrote\ntrip"
let new_lines = Re_str.split (Re_str.regexp "\n") new_value |> Array.of_list
let old_lines = Re_str.split (Re_str.regexp "\n") old_value |> Array.of_list

include Simple_diff

let expected =
  [ Equal   [| "Foo bar baz"; |];
    Deleted [| "Testicle"; |];
    Added   [| "Test"; |];
    Equal   [| "murder"; "she"; "wrote"; |];
    Deleted [| "end"; |];
    Added   [| "trip"; |];
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
