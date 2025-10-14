fn main() {
    // 创建一个字符串
    let s1 = String::from("hello");

    // 将 s1 的所有权移动给 s2
    let s2 = s1;

    // 此时 s1 已经不再有效，下面这行代码会报错
    // println!("{}", s1);

    // 打印 s2 是合法的
    println!("s2: {}", s2);

    // 函数调用示例
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内部

    // s3 在这里不再有效
    // println!("{}", s3); // 这行代码会报错

    let x = 5;
    makes_copy(x); // x 是 Copy 类型，会被复制，而不是移动

    // x 在这里仍然有效
    println!("x: {}", x);
}

fn takes_ownership(some_string: String) {
    println!("some_string: {}", some_string);
    // some_string 在这里离开作用域并被丢弃
}

fn makes_copy(some_integer: i32) {
    println!("some_integer: {}", some_integer);
    // some_integer 在这里离开作用域，但因为是 Copy 类型，所以不会有事
}