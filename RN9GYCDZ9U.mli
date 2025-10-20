(* OCaml数学模块接口 *)
module Math : sig
  (* 基本算术运算 *)
  val add : float -> float -> float
  val subtract : float -> float -> float
  val multiply : float -> float -> float
  val divide : float -> float -> float

  (* 幂运算 *)
  val power : float -> float -> float

  (* 开方运算 *)
  val sqrt : float -> float

  (* 绝对值 *)
  val abs : float -> float

  (* 最大值和最小值 *)
  val max : float -> float -> float
  val min : float -> float -> float

  (* 三角函数 *)
  val sin : float -> float
  val cos : float -> float
  val tan : float -> float

  (* 反三角函数 *)
  val asin : float -> float
  val acos : float -> float
  val atan : float -> float

  (* 对数函数 *)
  val log : float -> float  (* 自然对数 *)
  val log10 : float -> float  (* 以10为底的对数 *)

  (* 圆周率 *)
  val pi : float

  (* 将角度从度转换为弧度 *)
  val deg_to_rad : float -> float

  (* 将角度从弧度转换为度 *)
  val rad_to_deg : float -> float

  (* 阶乘函数 *)
  val factorial : int -> int

  (* 求模运算 *)
  val modulo : float -> float -> float
end