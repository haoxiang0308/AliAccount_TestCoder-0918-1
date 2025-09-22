(* Function to check if a number is even *)
let is_even n =
  n mod 2 = 0

(* List of test numbers *)
let test_numbers = [0; 1; 2; 10; 15; 20; 21; 100; 101; -1; -2; -10; -15]

(* Test the function with multiple numbers *)
let () =
  List.iter (fun n ->
    if is_even n then
      Printf.printf "%d is even\n" n
    else
      Printf.printf "%d is odd\n" n
  ) test_numbers