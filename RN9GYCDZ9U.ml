(* OCaml数学模块 *)
module Math = struct
  (* 基本算术运算 *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then failwith "Division by zero"
    else x /. y

  (* 幂运算 *)
  let power base exponent = base ** exponent

  (* 开方运算 *)
  let sqrt x = 
    if x < 0.0 then failwith "Square root of negative number"
    else sqrt x

  (* 绝对值 *)
  let abs x = if x >= 0.0 then x else -. x

  (* 最大值和最小值 *)
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y

  (* 三角函数 *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x

  (* 反三角函数 *)
  let asin x = asin x
  let acos x = acos x
  let atan x = atan x

  (* 对数函数 *)
  let log x = log x  (* 自然对数 *)
  let log10 x = log10 x  (* 以10为底的对数 *)

  (* 圆周率 *)
  let pi = 3.14159265358979323846

  (* 将角度从度转换为弧度 *)
  let deg_to_rad deg = deg *. pi /. 180.0

  (* 将角度从弧度转换为度 *)
  let rad_to_deg rad = rad *. 180.0 /. pi

  (* 阶乘函数 *)
  let factorial n =
    let rec fact acc i =
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in
    if n < 0 then failwith "Factorial of negative number"
    else fact 1 n

  (* 求模运算 *)
  let modulo x y = 
    if y = 0.0 then failwith "Modulo by zero"
    else x -. (floor (x /. y)) *. y
end