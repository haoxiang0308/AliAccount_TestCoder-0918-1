(* Define an algebraic data type for shapes *)
type shape = 
  | Circle of float (* radius *)
  | Rectangle of float * float (* width * height *)
  | Triangle of float * float * float (* three sides *)
  | Square of float (* side length *)
  | Pentagon of float (* side length *)

(* Example functions using the shape type *)
let area = function
  | Circle r -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Square s -> s *. s
  | Triangle (a, b, c) -> 
      let s = (a +. b +. c) /. 2.0 in
      sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))
  | Pentagon side -> 
      (5.0 /. 4.0) *. (side *. side) /. (tan (3.14159 /. 5.0))

let perimeter = function
  | Circle r -> 2.0 *. 3.14159 *. r
  | Rectangle (w, h) -> 2.0 *. (w +. h)
  | Square s -> 4.0 *. s
  | Triangle (a, b, c) -> a +. b +. c
  | Pentagon side -> 5.0 *. side

(* Example usage *)
let () =
  let my_shapes = [
    Circle 5.0;
    Rectangle (4.0, 6.0);
    Square 3.0;
    Triangle (3.0, 4.0, 5.0);
    Pentagon 2.0
  ] in
  List.iter (fun shape -> 
    Printf.printf "Area: %.2f, Perimeter: %.2f\n" (area shape) (perimeter shape)
  ) my_shapes