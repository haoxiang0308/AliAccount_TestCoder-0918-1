// Rust 所有权演示

fn main() {
    // 1. 变量绑定到值 (String) 时获得所有权
    let s1 = String::from("hello");

    // 2. 移动 (Move): 将 s1 的所有权转移给 s2
    // 此时 s1 不再有效，不能再使用
    let s2 = s1;

    // println!("{}", s1); // 这行代码会报错！因为 s1 已被移动

    // s2 现在拥有这个字符串
    println!("s2 = {}", s2);

    // 3. 克隆 (Clone): 创建一个全新的、独立的副本
    let s3 = s2.clone();
    println!("s2 = {}, s3 = {}", s2, s3); // 此时 s2 和 s3 都可以使用

    // 4. 函数参数的所有权
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被转移到函数内部
    // println!("{}", s4); // 这里 s4 已经无效

    // 5. 返回值的所有权
    let s5 = gives_ownership(); // 函数返回的值的所有权被移动给 s5
    println!("s5 = {}", s5);

    let s6 = String::from("bye");
    // 传递 s6 的所有权给函数，并接收返回的所有权
    let s7 = takes_and_gives_back(s6);
    // println!("{}", s6); // s6 已经无效
    println!("s7 = {}", s7); // s7 是有效的
}

// 这个函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Got ownership of: {}", some_string);
    // some_string 在此作用域结束时被丢弃 (drop)
}

// 这个函数创建一个 String 并将其所有权返回给调用者
fn gives_ownership() -> String {
    String::from("hello from function")
}

// 这个函数接收一个 String 的所有权，并将其返回给调用者
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 返回所有权
}