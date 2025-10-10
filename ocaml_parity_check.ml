let is_even n =
  n mod 2 = 0

let () =
  let num = 4 in
  if is_even num then
    Printf.printf "%d is even\n" num
  else
    Printf.printf "%d is odd\n" num;
  let num = 7 in
  if is_even num then
    Printf.printf "%d is even\n" num
  else
    Printf.printf "%d is odd\n" num