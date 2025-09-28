// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获取
    let s1 = String::from("hello"); // s1 绑定到一个字符串，拥有其所有权
    println!("s1: {}", s1); // 打印 s1 的值

    // 2. 移动语义 (Move)
    let s2 = s1; // 将 s1 的所有权移动给 s2
                 // 此时，s1 不再有效，尝试使用 s1 会导致编译错误
    // println!("s1: {}", s1); // 这一行会报错！
    println!("s2: {}", s2); // 打印 s2 的值，它是 "hello"

    // 3. 函数传参和所有权转移
    let s3 = String::from("world");
    take_ownership(s3); // s3 的所有权被转移到函数 `take_ownership` 中
    // println!("{}", s3); // 这一行会报错，因为 s3 已经不再有效

    // 4. 函数返回和所有权转移
    let s4 = gives_ownership(); // `gives_ownership` 函数返回一个值，所有权被转移给 s4
    println!("s4: {}", s4);

    // 5. 引用和借用 (Borrowing) - 不转移所有权
    let len = calculate_length(&s4); // `&s4` 创建一个对 s4 的引用 (借用)
    println!("The length of '{}' is {}.", s4, len); // s4 仍然有效，因为其所有权未被转移
}

// 该函数获取字符串的所有权
fn take_ownership(some_string: String) {
    println!("Got ownership of: {}", some_string);
    // `some_string` 在这里离开作用域，其值 (堆上的内存) 会被释放 (drop)
}

// 该函数返回一个字符串，将所有权转移给调用者
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 返回 some_string，将所有权转移给调用者
}

// 该函数接收一个字符串的引用，不获取所有权
fn calculate_length(s: &String) -> usize { // s 是一个引用
    s.len() // 获取字符串长度
    // `s` 在这里离开作用域，但它不拥有引用的值，所以不会发生任何事情
}