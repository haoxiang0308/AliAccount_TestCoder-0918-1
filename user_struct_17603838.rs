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