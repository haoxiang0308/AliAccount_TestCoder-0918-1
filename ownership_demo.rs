// Rust所有权概念演示

fn main() {
    // 1. 基本所有权转移
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1; // 所有权从s1转移到s2
    // println!("{}", s1); // 这行会报错，因为s1的所有权已经被转移
    
    println!("s2 = {}", s2);

    // 2. 函数参数的所有权转移
    println!("\n=== 函数参数的所有权转移 ===");
    let s3 = String::from("world");
    take_ownership(s3); // 所有权转移到函数内部
    // println!("{}", s3); // 这行会报错，因为s3的所有权已经被转移

    // 3. 返回值的所有权转移
    println!("\n=== 返回值的所有权转移 ===");
    let s4 = give_ownership();
    println!("s4 = {}", s4);

    // 4. 克隆（深拷贝）
    println!("\n=== 克隆（深拷贝） ===");
    let s5 = String::from("clone");
    let s6 = s5.clone(); // 克隆数据，而不是转移所有权
    println!("s5 = {}, s6 = {}", s5, s6); // 两个变量都可以使用

    // 5. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("reference");
    let len = calculate_length(&s7); // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);

    // 6. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8); // 传递可变引用
    println!("After change: {}", s8);

    // 7. 垂直作用域中的所有权
    println!("\n=== 垂直作用域中的所有权 ===");
    let s9 = String::from("scope");
    {
        let s10 = s9; // s9的所有权转移到s10
        println!("Inside scope: {}", s10);
    } // s10离开作用域，被drop
    // println!("Outside scope: {}", s9); // 这行会报错

    // 8. 所有权与复制trait
    println!("\n=== 所有权与复制trait ===");
    let x = 5;
    let y = x; // i32实现了Copy trait，所以这里是复制而不是移动
    println!("x = {}, y = {}", x, y); // 两个变量都可以使用
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("函数内部接收到: {}", some_string);
    // some_string在这里离开作用域并被drop
}

// 函数返回所有权
fn give_ownership() -> String {
    String::from("returned from function")
}

// 函数借用（不获取所有权）
fn calculate_length(s: &String) -> usize {
    s.len() // 返回字符串长度，但不获取所有权
}

// 函数修改可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}