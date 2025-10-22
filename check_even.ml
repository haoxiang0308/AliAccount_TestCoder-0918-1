(* Function to check if a number is even *)
let is_even n = 
  n mod 2 = 0

(* Example usage *)
let () =
  let num = 4 in
  if is_even num then
    print_endline (string_of_int num ^ " is even")
  else
    print_endline (string_of_int num ^ " is odd")