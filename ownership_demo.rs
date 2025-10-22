// Rust所有权概念演示

fn main() {
    // 1. 基本所有权转移
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2
    // println!("{}", s1);  // 这行会报错，因为s1不再有效
    println!("s2: {}", s2);

    // 2. 函数所有权转移
    println!("\n=== 函数所有权转移 ===");
    let s3 = String::from("world");
    takes_ownership(s3);  // s3的所有权转移到函数内
    // println!("{}", s3);  // 这行会报错，因为s3不再有效

    let x = 5;
    makes_copy(x);  // x是Copy类型，值被复制而不是移动
    println!("x is still available: {}", x);  // 这行可以正常执行

    // 3. 返回值所有权
    println!("\n=== 返回值所有权 ===");
    let s4 = gives_ownership();  // 函数返回值的所有权转移给s4
    println!("s4: {}", s4);

    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5);  // s5的所有权转移给函数，然后返回值所有权转移给s6
    println!("s6: {}", s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 通过引用借用s7，不转移所有权
    println!("The length of '{}' is {}.", s7, len);  // s7仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After change: {}", s8);

    // 6. 悬垂引用演示（注释掉，因为这会导致编译错误）
    // let reference_to_nothing = dangle();  // 这会报错
    let no_dangle_result = no_dangle();
    println!("No dangle result: {}", no_dangle_result);
}

// 函数获取所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// 函数接收Copy类型（不会转移所有权）
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但因为是Copy类型，所以没有特殊操作
}

// 函数返回值转移所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权转移给调用者
}

// 函数接收所有权并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 返回传入字符串的所有权
}

// 使用引用计算长度（不获取所有权）
fn calculate_length(s: &String) -> usize {
    s.len()  // 通过引用访问，不获取所有权
}  // 引用离开作用域，但不丢弃引用指向的值

// 修改通过可变引用传入的字符串
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

// 演示悬垂引用问题（此函数会产生编译错误，所以注释掉）
/*
fn dangle() -> &String {
    let s = String::from("hello");
    &s  // 尝试返回局部变量的引用，会导致悬垂引用
}
*/

// 正确的版本：返回所有权而不是引用
fn no_dangle() -> String {
    let s = String::from("hello");
    s  // 返回所有权
}