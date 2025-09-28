fn main() {
    // 基本所有权示例
    println!("--- 基本所有权示例 ---");
    {
        let s1 = String::from("hello"); // s1 获得 "hello" 字符串的所有权
        println!("s1: {}", s1); // 打印 s1 的值

        let s2 = s1; // 将 s1 的所有权移动给 s2，s1 不再有效
        // println!("s1: {}", s1); // 这行代码会报错！因为 s1 已被移动
        println!("s2: {}", s2); // 打印 s2 的值，此时 s2 拥有字符串
    } // s2 在这里离开作用域，其值被丢弃 (dropped)

    // 函数所有权示例
    println!("\n--- 函数所有权示例 ---");
    {
        let s3 = String::from("world");
        println!("转移所有权前 s3: {}", s3);
        take_ownership(s3); // s3 的所有权被转移到函数内部
        // println!("{}", s3); // 这行代码会报错！因为 s3 的所有权已被转移

        let x = 5; // 整数类型 (Copy trait) 的所有权转移
        println!("转移所有权前 x: {}", x);
        make_copy(x); // 传递 x 的副本
        println!("转移所有权后 x: {}", x); // x 依然有效，因为它是 Copy 类型
    }

    // 返回值所有权示例
    println!("\n--- 返回值所有权示例 ---");
    {
        let s4 = gives_ownership(); // 函数返回的值的所有权被赋给 s4
        println!("gives_ownership 函数返回的 s4: {}", s4);

        let s5 = String::from("rust");
        println!("转移所有权前 s5: {}", s5);
        let s6 = takes_and_gives_back(s5); // s5 的所有权被转移，然后所有权被返回并赋给 s6
        // println!("{}", s5); // 这行代码会报错！因为 s5 的所有权已被转移
        println!("takes_and_gives_back 函数返回的 s6: {}", s6);
    }
}

// 该函数获取 String 的所有权
fn take_ownership(some_string: String) {
    println!("在函数内部接收到的字符串: {}", some_string);
    // some_string 在这里离开作用域，其内存被释放
}

// 该函数接收一个 Copy 类型的值（如整数），不会转移所有权，而是进行复制
fn make_copy(some_integer: i32) {
    println!("在函数内部接收到的整数: {}", some_integer);
    // some_integer 在这里离开作用域，但因为是 Copy 类型，所以没有特别操作
}

// 该函数返回一个 String，所有权被转移到调用者
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 将 some_string 的所有权返回给调用者
}

// 该函数接收一个 String，然后返回其所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 的所有权被返回给调用者
}