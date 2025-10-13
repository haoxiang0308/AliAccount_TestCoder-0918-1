/// Структура, представляющая пользователя
pub struct User {
    /// Имя пользователя
    pub name: String,
    /// Возраст пользователя
    pub age: u32,
}

impl User {
    /// Создает нового пользователя
    ///
    /// # Arguments
    ///
    /// * `name` - Имя пользователя
    /// * `age` - Возраст пользователя
    ///
    /// # Returns
    ///
    /// * `User` - Новый экземпляр структуры User
    pub fn new(name: String, age: u32) -> User {
        User { name, age }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_user_creation() {
        let user = User::new("Alice".to_string(), 30);
        assert_eq!(user.name, "Alice");
        assert_eq!(user.age, 30);
    }
}