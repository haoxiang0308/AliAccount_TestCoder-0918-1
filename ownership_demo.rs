// Rust所有权概念演示

fn main() {
    println!("=== Rust所有权概念演示 ===");
    
    // 1. 所有权和移动(move)
    println!("\n1. 所有权和移动(move):");
    let s1 = String::from("hello");
    let s2 = s1; // s1的所有权转移给s2，s1不再有效
    println!("s2 = {}", s2);
    // println!("s1 = {}", s1); // 这行会编译错误，因为s1已不再有效
    
    // 2. 克隆(Clone)
    println!("\n2. 克隆(Clone):");
    let s3 = String::from("world");
    let s4 = s3.clone(); // 深拷贝，s3和s4都有效
    println!("s3 = {}, s4 = {}", s3, s4);
    
    // 3. 借用(Borrowing) - 不可变引用
    println!("\n3. 借用 - 不可变引用:");
    let s5 = String::from("borrowing");
    let len = calculate_length(&s5); // 传递引用，不转移所有权
    println!("'{}' 的长度是 {}.", s5, len);
    
    // 4. 可变借用(Mutable borrowing)
    println!("\n4. 可变借用:");
    let mut s6 = String::from("hello");
    println!("修改前: {}", s6);
    change(&mut s6); // 传递可变引用
    println!("修改后: {}", s6);
    
    // 5. 限制：不能同时拥有可变和不可变引用
    println!("\n5. 可变和不可变引用的限制:");
    let mut s7 = String::from("限制");
    let r1 = &s7; // 不可变引用
    let r2 = &s7; // 不可变引用
    println!("{} 和 {}", r1, r2);
    // 此时不能使用可变引用
    let r3 = &mut s7; // 可变引用
    println!("{}", r3);
    // 注意：不能再使用r1和r2，因为r3是可变引用
}

// 接受不可变引用的函数
fn calculate_length(s: &String) -> usize {
    s.len() // 不获取所有权，只借用
}

// 接受可变引用的函数
fn change(s: &mut String) {
    s.push_str(", world"); // 修改借用的值
}