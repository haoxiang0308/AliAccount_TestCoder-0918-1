(* OCaml模块：封装数学函数 *)
module Math = struct
  (* 基本算术运算 *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y

  (* 幂运算 *)
  let power base exp = base ** exp
  
  (* 平方根 *)
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x

  (* 绝对值 *)
  let abs x = if x >= 0.0 then x else -. x

  (* 最大值和最小值 *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y

  (* 三角函数 *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x

  (* 对数函数 *)
  let log x = 
    if x <= 0.0 then 
      failwith "Logarithm of non-positive number"
    else 
      log x
  let log10 x = 
    if x <= 0.0 then 
      failwith "Log10 of non-positive number"
    else 
      log10 x

  (* 圆周率 *)
  let pi = 3.14159265358979323846

  (* 将角度转换为弧度 *)
  let deg_to_rad deg = deg *. pi /. 180.0

  (* 将弧度转换为角度 *)
  let rad_to_deg rad = rad *. 180.0 /. pi
end