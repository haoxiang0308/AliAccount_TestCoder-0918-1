(* OCaml module for mathematical functions *)
module Math = struct
  (* Basic arithmetic operations *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then failwith "Division by zero"
    else x /. y
  
  (* Power function *)
  let power base exponent = base ** exponent
  
  (* Square root function *)
  let sqrt x = 
    if x < 0.0 then failwith "Square root of negative number"
    else Stdlib.sqrt x
  
  (* Absolute value *)
  let abs x = if x < 0.0 then -.x else x
  
  (* Factorial function *)
  let factorial n =
    if n < 0 then failwith "Factorial of negative number"
    else
      let rec fact acc i =
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in
      fact 1 n
  
  (* Greatest Common Divisor *)
  let gcd a b =
    let rec gcd_inner a b =
      if b = 0 then a
      else gcd_inner b (a mod b)
    in
    gcd_inner (abs a) (abs b)
  
  (* Least Common Multiple *)
  let lcm a b =
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)
  
  (* Constants *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536
  
  (* Trigonometric functions *)
  let sin x = Stdlib.sin x
  let cos x = Stdlib.cos x
  let tan x = Stdlib.tan x
  let asin x = Stdlib.asin x
  let acos x = Stdlib.acos x
  let atan x = Stdlib.atan x
  let atan2 y x = Stdlib.atan2 y x
  
  (* Logarithmic functions *)
  let log x = Stdlib.log x
  let log10 x = Stdlib.log10 x
  let exp x = Stdlib.exp x
  
  (* Ceiling and floor *)
  let ceil x = Stdlib.ceil x
  let floor x = Stdlib.floor x
  
  (* Minimum and maximum *)
  let min x y = if x < y then x else y
  let max x y = if x > y then x else y
end