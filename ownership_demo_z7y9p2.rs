// Rust 所有权演示代码

fn main() {
    // 1. 变量绑定与所有权
    println!("--- 1. 变量绑定与所有权 ---");
    let s1 = String::from("Hello"); // s1 绑定到字符串 "Hello"，拥有其所有权
    println!("s1: {}", s1); // 打印 s1 的值

    // 2. 移动语义 (Move)
    println!("\n--- 2. 移动语义 (Move) ---");
    let s2 = s1; // 将 s1 的所有权移动给 s2
    // println!("s1: {}", s1); // 这行代码会报错！因为 s1 不再拥有数据
    println!("s2: {}", s2); // s2 现在拥有数据
    println!("s1 被移动后，不能再使用。");

    // 3. 克隆 (Clone)
    println!("\n--- 3. 克隆 (Clone) ---");
    let s3 = String::from("World");
    let s4 = s3.clone(); // 显式克隆堆上的数据，s3 和 s4 各自拥有独立的数据
    println!("s3: {}", s3); // s3 仍然有效
    println!("s4: {}", s4); // s4 是 s3 的一个副本

    // 4. 函数传参 (传递所有权)
    println!("\n--- 4. 函数传参 (传递所有权) ---");
    let s5 = String::from("Rust");
    takes_ownership(s5); // s5 的所有权被转移到函数内部
    // println!("s5: {}", s5); // 这行代码会报错！因为 s5 的所有权已被转移

    // 5. 函数传参 (不传递所有权 - 引用)
    println!("\n--- 5. 函数传参 (不传递所有权 - 引用) ---");
    let s6 = String::from("Ownership");
    let len = calculate_length(&s6); // 传递 s6 的引用，不转移所有权
    println!("字符串 '{}' 的长度是 {}。", s6, len); // s6 在此处仍然有效

    // 6. 可变引用
    println!("\n--- 6. 可变引用 ---");
    let mut s7 = String::from("Hi");
    println!("修改前: {}", s7);
    change(&mut s7); // 传递可变引用
    println!("修改后: {}", s7);
}

// 这个函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("接收的字符串是: {}", some_string);
} // some_string 在这里离开作用域并被丢弃 (dropped)

// 这个函数获取一个字符串切片的引用，不获取所有权
fn calculate_length(s: &String) -> usize { // s 是一个指向 String 的引用
    s.len() // 返回字符串的长度
} // s 离开作用域，但它指向的数据不属于 s，所以不会被丢弃

// 这个函数修改一个可变引用指向的数据
fn change(some_string: &mut String) {
    some_string.push_str(", world!"); // push_str() 将文本追加到字符串末尾
} // some_string 离开作用域，它指向的数据被修改，但不被丢弃