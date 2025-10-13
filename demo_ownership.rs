// Rust 所有权示例

fn main() {
    // --- 示例 1: 基本所有权转移 ---
    println!("--- 示例 1: 基本所有权转移 ---");
    {
        let s1 = String::from("hello"); // s1 拥有这个字符串
        println!("s1 创建: {}", s1);

        let s2 = s1; // 所有权从 s1 转移到 s2
        // println!("s1 现在无法访问: {}", s1); // 这行代码会报错！因为 s1 不再有效
        println!("s2 接管了所有权: {}", s2);
    } // s2 在这里离开作用域并被丢弃

    // --- 示例 2: 函数调用中的所有权转移 ---
    println!("\n--- 示例 2: 函数调用中的所有权转移 ---");
    {
        let s3 = String::from("world");
        println!("传递给函数前 s3: {}", s3);
        takes_ownership(s3); // s3 的所有权被转移到函数内部
        // println!("函数调用后 s3: {}", s3); // 这行代码会报错！
    }

    // --- 示例 3: 克隆 ---
    println!("\n--- 示例 3: 克隆 (Clone) ---");
    {
        let s4 = String::from("clone me");
        println!("克隆前 s4: {}", s4);
        let s5 = s4.clone(); // 创建一个全新的、独立的副本
        println!("克隆后 s4: {}, s5: {}", s4, s5); // 两者都可以使用
    }
}

// 此函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到的字符串: {}", some_string);
} // some_string 在这里离开作用域并被丢弃