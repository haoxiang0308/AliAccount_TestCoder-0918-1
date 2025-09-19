use std::env;
use std::fs::File;
use std::io::Write;

fn main() {
    // 1. 栈上的数据拷贝 (Copy)
    let x = 5;
    let y = x; // i32 实现了 Copy trait，这里发生了拷贝
    println!("x = {}, y = {}", x, y); // x 和 y 都可以继续使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy，这里发生了所有权的转移
    // println!("{}, {}", s1, s2); // 这行代码会编译错误，因为 s1 的所有权已经转移给了 s2
    println!("s2 = {}", s2); // 只有 s2 可以使用

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 深拷贝，堆上的数据也会被复制
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以使用

    // 4. 函数调用与所有权
    let s5 = String::from("function call");
    takes_ownership(s5); // s5 的所有权被移动到函数内部
    // println!("{}", s5); // 这里会编译错误，因为 s5 不再有效

    let x2 = 10;
    makes_copy(x2); // i32 是 Copy 的，所以这里是拷贝
    println!("x2 is still valid: {}", x2); // x2 仍然可以使用

    // 5. 函数返回与所有权
    let s6 = gives_ownership(); // s6 获得了函数返回值的所有权
    println!("s6 got ownership: {}", s6);

    let s7 = String::from("back to you");
    let s8 = takes_and_gives_back(s7); // s7 的所有权移动到函数，然后函数返回值的所有权移动到 s8
    println!("s8 got ownership back: {}", s8);
}

fn takes_ownership(some_string: String) { // some_string 进入作用域
    println!("Received ownership of: {}", some_string);
} // some_string 在这里离开作用域，drop 被调用，内存被释放

fn makes_copy(some_integer: i32) { // some_integer 进入作用域
    println!("Received a copy of: {}", some_integer);
} // some_integer 离开作用域，什么都不会发生，因为它没有所有权

fn gives_ownership() -> String {
    let some_string = String::from("I'm yours!");
    some_string // 返回值所有权被移动给调用者
}

fn takes_and_gives_back(a_string: String) -> String { // a_string 进入作用域
    a_string // 返回值所有权被移动给调用者
} // a_string 离开作用域