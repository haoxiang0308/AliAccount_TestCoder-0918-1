<template>
  <div class="login-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input
          id="email"
          type="email"
          v-model="email"
          required
          placeholder="Введите ваш email"
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          id="password"
          type="password"
          v-model="password"
          required
          placeholder="Введите ваш пароль"
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <button type="submit" :disabled="loading" class="submit-btn">
          {{ loading ? 'Вход...' : 'Войти' }}
        </button>
      </div>
      
      <div v-if="error" class="error-message">
        {{ error }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      email: '',
      password: '',
      loading: false,
      error: ''
    }
  },
  methods: {
    async handleSubmit() {
      this.loading = true;
      this.error = '';
      
      try {
        // Валидация данных
        if (!this.email || !this.password) {
          this.error = 'Пожалуйста, заполните все поля';
          return;
        }
        
        // Здесь можно добавить логику аутентификации
        // Например, вызов API для входа
        console.log('Данные для входа:', { email: this.email, password: this.password });
        
        // Имитация асинхронного запроса
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // В реальном приложении здесь будет проверка ответа от сервера
        alert(`Успешный вход как ${this.email}`);
      } catch (err) {
        this.error = 'Ошибка входа. Пожалуйста, проверьте данные.';
        console.error('Ошибка входа:', err);
      } finally {
        this.loading = false;
      }
    }
  }
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
}

.login-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

.form-input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.submit-btn {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.2s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.error-message {
  color: #dc3545;
  text-align: center;
  margin-top: 1rem;
  padding: 0.5rem;
  background-color: #f8d7da;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
}
</style>