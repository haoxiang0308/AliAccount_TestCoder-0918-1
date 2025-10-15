(* 数学函数模块 *)
module Math = struct
  (* 计算平方 *)
  let square x = x *. x

  (* 计算立方 *)
  let cube x = x *. x *. x

  (* 计算绝对值 *)
  let abs x = if x >= 0.0 then x else ~-.x

  (* 计算两个数的最大值 *)
  let max x y = if x > y then x else y

  (* 计算两个数的最小值 *)
  let min x y = if x < y then x else y

  (* 计算幂次方 *)
  let pow base exponent = base ** exponent

  (* 计算平方根 *)
  let sqrt x = x ** 0.5

  (* 计算阶乘 *)
  let factorial n =
    let rec fact acc i =
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in
    fact 1 n

  (* 计算圆的面积 *)
  let circle_area radius = 3.141592653589793 *. (radius *. radius)

  (* 计算圆的周长 *)
  let circle_circumference radius = 2.0 *. 3.141592653589793 *. radius

  (* 判断一个数是否为质数 *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let limit = int_of_float (sqrt (float_of_int n)) in
      let rec check_divisor i =
        if i > limit then true
        else if n mod i = 0 then false
        else check_divisor (i + 2)
      in
      check_divisor 3
end

(* 使用示例 *)
let () =
  print_endline "数学函数模块示例：";
  Printf.printf "2的平方: %f\n" (Math.square 2.0);
  Printf.printf "3的立方: %f\n" (Math.cube 3.0);
  Printf.printf "绝对值 |-5.5|: %f\n" (Math.abs (-5.5));
  Printf.printf "最大值 max(3.2, 7.8): %f\n" (Math.max 3.2 7.8);
  Printf.printf "最小值 min(3.2, 7.8): %f\n" (Math.min 3.2 7.8);
  Printf.printf "2的5次方: %f\n" (Math.pow 2.0 5.0);
  Printf.printf "16的平方根: %f\n" (Math.sqrt 16.0);
  Printf.printf "5的阶乘: %d\n" (Math.factorial 5);
  Printf.printf "半径为3的圆面积: %f\n" (Math.circle_area 3.0);
  Printf.printf "半径为3的圆周长: %f\n" (Math.circle_circumference 3.0);
  Printf.printf "17是质数吗: %b\n" (Math.is_prime 17)