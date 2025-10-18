// Rust Ownership Demonstration

fn main() {
    // 1. Basic ownership
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    
    // The following line would cause a compile-time error:
    // println!("{}", s1); // Error: value borrowed here after move
    
    println!("s2: {}", s2);

    // 2. Ownership with functions
    let s3 = String::from("world");
    take_ownership(s3); // s3 is moved into the function
    // println!("{}", s3); // Error: value borrowed here after move

    // 3. Ownership returned from functions
    let s4 = gives_ownership(); // s4 receives the ownership
    println!("s4: {}", s4);

    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5); // s5 is moved to function, s6 receives ownership
    println!("s6: {}", s6);

    // 4. References and borrowing
    let s7 = String::from("ownership");
    let len = calculate_length(&s7); // &s7 creates a reference to s7
    println!("The length of '{}' is {}.", s7, len);

    // 5. Mutable references
    let mut s8 = String::from("hello");
    println!("Before mutation: {}", s8);
    change(&mut s8); // Pass a mutable reference
    println!("After mutation: {}", s8);

    // 6. Multiple immutable references OR one mutable reference
    let mut s9 = String::from("multiple");
    {
        let r1 = &s9; // immutable reference
        let r2 = &s9; // immutable reference
        println!("r1: {}, r2: {}", r1, r2);
    } // r1 and r2 go out of scope

    let r3 = &mut s9; // mutable reference
    println!("r3: {}", r3);
    // println!("{}", s9); // This would cause an error - can't use s9 while r3 exists
}

fn take_ownership(s: String) {
    println!("Taking ownership of: {}", s);
} // s goes out of scope and is dropped

fn gives_ownership() -> String {
    let s = String::from("from function");
    s // return ownership to caller
}

fn takes_and_gives_back(s: String) -> String {
    s // return ownership to caller
}

fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope but nothing happens since it doesn't own the value

fn change(s: &mut String) {
    s.push_str(", world!"); // modify the string through mutable reference
}