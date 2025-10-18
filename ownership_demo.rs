// Rust 所有权概念演示

fn main() {
    println!("=== Rust 所有权概念演示 ===\n");

    // 1. 基本所有权转移
    println!("1. 基本所有权转移:");
    let s1 = String::from("hello");
    println!("创建 s1: {}", s1);

    let s2 = s1; // 所有权从 s1 转移到 s2
    // println!("s1: {}", s1); // 这行会报错，因为 s1 的所有权已经转移
    println!("s2 接管了所有权: {}", s2);
    println!("s1 已经无效\n");

    // 2. 函数参数的所有权转移
    println!("2. 函数参数的所有权转移:");
    let s3 = String::from("world");
    println!("函数调用前 s3: {}", s3);
    take_ownership(s3); // s3 的所有权转移到函数内部
    // println!("函数调用后 s3: {}", s3); // 这行会报错
    println!("s3 的所有权已转移给函数\n");

    // 3. 返回值的所有权转移
    println!("3. 返回值的所有权转移:");
    let s4 = give_ownership(); // 从函数获取所有权
    println!("从函数获取所有权 s4: {}", s4);
    let s5 = String::from("rust");
    println!("s5: {}", s5);
    let s6 = take_and_give_back(s5); // 转移所有权给函数，再返回
    println!("返回后的 s6: {}", s6);
    println!();

    // 4. 引用和借用
    println!("4. 引用和借用:");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // 传入引用，不转移所有权
    println!("字符串 '{}' 的长度是: {}", s7, len); // s7 仍然有效
    println!();

    // 5. 可变引用
    println!("5. 可变引用:");
    let mut s8 = String::from("hello");
    println!("修改前: {}", s8);
    change(&mut s8); // 传入可变引用
    println!("修改后: {}", s8);
    println!();

    // 6. 借用规则演示
    println!("6. 借用规则:");
    let mut s9 = String::from("hello");
    
    // 可以有多个不可变引用
    let r1 = &s9;
    let r2 = &s9;
    println!("r1: {}, r2: {} (多个不可变引用)", r1, r2);
    
    // 但不能同时有可变和不可变引用
    // let r3 = &mut s9; // 这会报错
    // println!("r3: {}", r3);
    
    // 在不可变引用作用域结束后，可以创建可变引用
    {
        println!("在新作用域中创建可变引用:");
        let r3 = &mut s9;
        println!("r3 (可变引用): {}", r3);
    } // r3 在这里离开作用域
    
    println!("s9: {}", s9); // 现在可以安全使用 s9
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("接收所有权的函数: {}", some_string);
    // some_string 在这里离开作用域并被丢弃
}

// 函数返回所有权
fn give_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 返回字符串，转移所有权
}

// 函数接收并返回所有权
fn take_and_give_back(a_string: String) -> String {
    a_string // 返回传入的字符串，转移所有权回来
}

// 使用引用（借用），不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len() // s 是引用，不拥有所有权，所以不会在函数结束时被丢弃
}

// 使用可变引用修改数据
fn change(some_string: &mut String) {
    some_string.push_str(", world!"); // 修改引用的数据
}