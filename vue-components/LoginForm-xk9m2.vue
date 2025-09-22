<template>
  <div class="login-form">
    <h2>Вход в систему</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input 
          type="text" 
          id="username" 
          v-model="form.username" 
          required 
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="form.password" 
          required 
        />
      </div>
      
      <button type="submit" :disabled="isSubmitting">
        {{ isSubmitting ? 'Вход...' : 'Войти' }}
      </button>
      
      <div v-if="errorMessage" class="error-message">
        {{ errorMessage }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      form: {
        username: '',
        password: ''
      },
      isSubmitting: false,
      errorMessage: ''
    }
  },
  methods: {
    handleSubmit() {
      // Простая валидация
      if (!this.form.username || !this.form.password) {
        this.errorMessage = 'Пожалуйста, заполните все поля'
        return
      }
      
      // Сброс ошибки
      this.errorMessage = ''
      this.isSubmitting = true
      
      // Имитация API вызова
      setTimeout(() => {
        this.isSubmitting = false
        // В реальном приложении здесь будет логика аутентификации
        console.log('Форма отправлена:', this.form)
        alert(`Добро пожаловать, ${this.form.username}!`)
      }, 1500)
    }
  }
}
</script>

<style scoped>
.login-form {
  max-width: 400px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  font-family: Arial, sans-serif;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:hover:not(:disabled) {
  background-color: #0056b3;
}

button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.error-message {
  color: #dc3545;
  margin-top: 15px;
  text-align: center;
}
</style>