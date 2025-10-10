let is_even n =
  n mod 2 = 0

(* Пример использования *)
let () =
  print_endline (string_of_bool (is_even 4));  (* true *)
  print_endline (string_of_bool (is_even 5))   (* false *)