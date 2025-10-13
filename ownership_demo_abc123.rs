fn main() {
    // --- Ownership Demo ---

    // 1. Variable Binding and Ownership
    println!("=== 1. Variable Binding and Ownership ===");
    let s1 = String::from("hello"); // `s1` owns the string data
    println!("s1: {}", s1);
    println!("Address of s1's data: {:p}", s1.as_ptr());

    // 2. Move Semantics
    println!("\n=== 2. Move Semantics ===");
    let s2 = s1; // Ownership of the data is moved from `s1` to `s2`
                 // `s1` is no longer valid and will cause a compile-time error if used
    println!("s2: {}", s2);
    println!("Address of s2's data: {:p}", s2.as_ptr());
    // println!("s1: {}", s1); // This line would cause a compile error!

    // 3. Functions and Ownership
    println!("\n=== 3. Functions and Ownership ===");
    let s3 = String::from("world");
    println!("Before function call, s3: {}", s3);
    takes_ownership(s3); // `s3` is moved into the function
    // println!("After function call, s3: {}", s3); // This line would cause a compile error!

    let x = 5; // `x` is an integer, which implements the `Copy` trait
    println!("Before function call, x: {}", x);
    makes_copy(x); // `x` is copied, not moved
    println!("After function call, x: {}", x); // This is fine, `x` is still valid
}

// This function takes ownership of a `String`
fn takes_ownership(some_string: String) {
    println!("The function took ownership and will print: {}", some_string);
    // `some_string` goes out of scope here and `drop` is called
    // The memory is freed
}

// This function takes a copy of a value that implements `Copy`
fn makes_copy(some_integer: i32) {
    println!("The function took a copy of an integer: {}", some_integer);
    // `some_integer` goes out of scope, but nothing happens because `i32` implements `Copy`
}