fn main() {
    // --- 基本所有权示例 ---
    println!("--- 基本所有权示例 ---");

    // 创建一个 String（在堆上分配）
    let s1 = String::from("hello");
    println!("s1 = {}", s1);

    // s1 的值被移动到 s2。s1 不再有效。
    let s2 = s1;
    // println!("s1 = {}", s1); // 这一行会导致编译错误！
    println!("s2 = {}", s2);

    // --- 函数中的所有权 ---
    println!("\n--- 函数中的所有权 ---");

    let s3 = String::from("world");
    println!("s3 在移交之前 = {}", s3);
    // s3 的所有权被移交（move）到函数内
    take_ownership(s3);
    // println!("s3 在移交之后 = {}", s3); // 这一行会导致编译错误！

    let x = 5; // i32 是 Copy 类型
    println!("x 在移交之前 = {}", x);
    make_copy(x); // x 的值被复制（copy）到函数内
    println!("x 在移交之后 = {}", x); // 这一行是有效的，因为 x 没有被移动

    // --- 函数返回值和所有权 ---
    println!("\n--- 函数返回值和所有权 ---");

    let s4 = gives_ownership(); // 函数返回一个值，所有权被移动给 s4
    println!("s4 = {}", s4);

    let s5 = String::from("rust");
    println!("s5 = {}", s5);
    // s5 的所有权被移交到函数内，函数返回一个新值，所有权被移交回 s6
    let s6 = takes_and_gives_back(s5);
    println!("s6 = {}", s6);
    // println!("s5 = {}", s5); // s5 不再有效
}

// 这个函数获取一个 String 的所有权
fn take_ownership(some_string: String) {
    println!("函数内部接收到的 some_string = {}", some_string);
    // 函数结束时，some_string 离开作用域，其值被丢弃（drop）
}

// 这个函数获取一个 Copy 类型（i32）的值
fn make_copy(some_integer: i32) {
    println!("函数内部接收到的 some_integer = {}", some_integer);
    // 函数结束时，some_integer 离开作用域。因为它是 Copy 类型，所以不会有特殊操作。
}

// 这个函数返回一个 String，所有权被移动到调用者
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // some_string 的所有权被返回
}

// 这个函数获取一个 String 的所有权，然后返回它
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被返回，所有权被转移
}