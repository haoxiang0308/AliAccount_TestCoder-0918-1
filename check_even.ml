(* Function to check if a number is even *)
let is_even n = 
  n mod 2 = 0

(* Example usage *)
let () =
  let number = 4 in
  if is_even number then
    print_endline (string_of_int number ^ " is even")
  else
    print_endline (string_of_int number ^ " is odd")