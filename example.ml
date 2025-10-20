(* 示例文件，演示如何使用数学模块 *)
open RN9GYCDZ9U

let () =
  (* 基本算术运算 *)
  let result1 = Math.add 5.0 3.0 in
  Printf.printf "5 + 3 = %f\n" result1;

  let result2 = Math.multiply 4.0 6.0 in
  Printf.printf "4 * 6 = %f\n" result2;

  (* 幂运算 *)
  let result3 = Math.power 2.0 8.0 in
  Printf.printf "2^8 = %f\n" result3;

  (* 开方运算 *)
  let result4 = Math.sqrt 16.0 in
  Printf.printf "sqrt(16) = %f\n" result4;

  (* 三角函数 *)
  let result5 = Math.sin (Math.pi /. 2.0) in
  Printf.printf "sin(pi/2) = %f\n" result5;

  (* 角度转换 *)
  let result6 = Math.deg_to_rad 180.0 in
  Printf.printf "180 degrees = %f radians\n" result6;

  (* 阶乘 *)
  let result7 = Math.factorial 5 in
  Printf.printf "5! = %d\n" result7;

  (* 对数 *)
  let result8 = Math.log 2.718281828 in
  Printf.printf "ln(2.718...) = %f\n" result8;

  (* 最大值和最小值 *)
  let result9 = Math.max 10.5 7.3 in
  Printf.printf "max(10.5, 7.3) = %f\n" result9;

  let result10 = Math.min 10.5 7.3 in
  Printf.printf "min(10.5, 7.3) = %f\n" result10