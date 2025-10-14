// Rust 所有权示例

fn main() {
    // 1. 变量绑定和所有权
    // 字符串字面量 "hello" 是静态的，s1 拥有其在堆上分配的 String 数据。
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. 移动 (Move)
    // 将 s1 的值赋给 s2。这会将堆上的数据的所有权从 s1 移动到 s2。
    // s1 不再有效，不能再使用。如果取消注释下一行，编译器会报错。
    let s2 = s1;
    // println!("s1: {}", s1); // 这行会导致编译错误
    println!("s2: {}", s2);

    // 3. 克隆 (Clone)
    // 如果我们想让 s1 和 s3 都拥有相同的数据，需要显式克隆。
    let s3 = s2.clone();
    println!("s2: {}", s2);
    println!("s3: {}", s3);

    // 4. 函数传参和所有权
    // 将 s3 的所有权传递给函数 `takes_ownership`。
    takes_ownership(s3);
    // 此时 s3 不再有效。

    // s2 的所有权传递给函数 `gives_ownership`，然后返回值被 s4 获取。
    let s4 = gives_ownership(s2);
    println!("s4 (returned from function): {}", s4);

    // 5. 借用 (Borrowing)
    // 通过引用 (&) 传递 s4，不转移所有权。
    let len = calculate_length(&s4);
    println!("The length of '{}' is {}.", s4, len);

    // 6. 可变借用 (Mutable Borrowing)
    // 创建一个可变变量，并借用其可变引用。
    let mut s5 = String::from("hi");
    println!("s5 before change: {}", s5);
    change_string(&mut s5);
    println!("s5 after change: {}", s5);
}

// 此函数获取一个 String 的所有权。
fn takes_ownership(some_string: String) {
    println!("Took ownership and will print: {}", some_string);
    // `some_string` 在这里离开作用域，`drop` 函数被调用，内存被释放。
}

// 此函数获取一个 String 的所有权，并返回一个新的所有权。
fn gives_ownership(some_string: String) -> String {
    // `some_string` 被移入函数内部。
    some_string // `some_string` 被返回，所有权被移出函数。
}

// 此函数获取一个字符串的引用，不获取所有权。
fn calculate_length(s: &String) -> usize {
    s.len() // `s` 是一个引用，它不拥有该值，所以它离开作用域时不会被丢弃。
}

// 此函数获取一个可变字符串的可变引用。
fn change_string(s: &mut String) {
    s.push_str(", world"); // `push_str()` 将一个字符串追加到另一个字符串。
    // `s` 是一个可变引用，所以我们可以修改它所指向的值。
}