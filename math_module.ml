(* OCaml模块：封装数学函数 *)
module Math = struct
  (* 计算平方 *)
  let square x = x *. x

  (* 计算立方 *)
  let cube x = x *. x *. x

  (* 计算两个数的最大值 *)
  let max a b = if a > b then a else b

  (* 计算两个数的最小值 *)
  let min a b = if a < b then a else b

  (* 计算绝对值 *)
  let abs x = if x >= 0.0 then x else -.x

  (* 计算n次方 *)
  let power base exp = 
    if exp = 0 then 1.0
    else 
      let rec pow acc n = 
        if n = 0 then acc
        else pow (acc *. base) (n - 1)
      in pow 1.0 exp

  (* 计算阶乘 *)
  let factorial n = 
    let rec fact acc i = 
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in fact 1 n

  (* 判断一个数是否为质数 *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisor d =
        if d * d > n then true
        else if n mod d = 0 then false
        else check_divisor (d + 2)
      in check_divisor 3

  (* 计算斐波那契数列第n项 *)
  let fibonacci n =
    let rec fib a b i =
      if i = 0 then a
      else fib b (a + b) (i - 1)
    in fib 0 1 n
end