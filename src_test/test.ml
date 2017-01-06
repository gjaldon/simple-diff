let old_value = "Foo bar baz\nTesticles\nmurder\nshe\nwrote\nend"
let new_value = "Foo bar baz\nTest\nmurder\nshe\nwrote\ntrip"
let new_lines = Re_str.split (Re_str.regexp "\n") new_value |> Array.of_list
let old_lines = Re_str.split (Re_str.regexp "\n") old_value |> Array.of_list

module SimpleDiffTest = struct
  include Main

  let pp = Fmt.Dump.list

  let equal diffs_1 diffs_2 =
    if List.length diffs_1 = List.length diffs_2 then
      List.for_all2 (fun diff1 diff2 ->
        diff1 = diff2
      ) diffs_1 diffs_2
    else
      false
end

let diff_t: SimpleDiffTest.t Alcotest.testable = (module SimpleDiffTest)

let diff () =
  Alcotest.(check list diff_t) "Foo" [] (Main.get_diff old_lines new_lines)

let test_set = [
  "Simple diff", `Quick, diff;
]

let () =
  Alcotest.run "Initial tests" [
    "test_set", test_set;
  ]
