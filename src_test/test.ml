let old_value = "Foo bar baz\nTesticles\nmurder\nshe\nwrote\nend"
let new_value = "Foo bar baz\nTest\nmurder\nshe\nwrote\ntrip"
let new_lines = Re_str.split (Re_str.regexp "\n") new_value |> Array.of_list
let old_lines = Re_str.split (Re_str.regexp "\n") old_value |> Array.of_list

module SimpleDiffTest = (struct
  type t = Main.diff list

  let pp diffs =
    List.fold_left (fun str diff ->
      let new_content = match diff with
        | Main.Deleted lines ->
          let lines = String.concat "\n" (Array.to_list lines) in
          Printf.sprintf "Deleted lines:\n%s" lines
        | Main.Added lines ->
          let lines = String.concat "\n" (Array.to_list lines) in
          Printf.sprintf "Added lines:\n%s" lines
        | Main.Equal lines ->
          let lines = String.concat "\n" (Array.to_list lines) in
          Printf.sprintf "Equal lines:\n%s" lines
      in
      str ^ "\n" ^ new_content
    ) "" diffs

  let equal diffs_1 diffs_2 =
    if List.length diffs_1 = List.length diffs_2 then
      List.for_all2 (fun diff1 diff2 ->
        diff1 = diff2
      ) diffs_1 diffs_2
    else
      false

end : Alcotest.TESTABLE)

let diff () =
  Alcotest.check "Foo" [] (Main.get_diff old_lines new_lines)

let test_set = [
  "Simple diff", `Quick, diff;
]

let () =
  Alcotest.run "Initial tests" [
    "test_set", test_set;
  ]
