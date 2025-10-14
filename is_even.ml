let is_even n =
  n mod 2 = 0

let () =
  let test_num = 4 in
  if is_even test_num then
    Printf.printf "%d is even.\n" test_num
  else
    Printf.printf "%d is odd.\n" test_num;
  let test_num2 = 7 in
  if is_even test_num2 then
    Printf.printf "%d is even.\n" test_num2
  else
    Printf.printf "%d is odd.\n" test_num2