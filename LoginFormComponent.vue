<template>
  <div class="login-form">
    <h2>Вход в систему</h2>
    <form @submit.prevent="handleLogin">
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input 
          type="text" 
          id="username" 
          v-model="username" 
          required 
          placeholder="Введите имя пользователя"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите пароль"
        />
      </div>
      
      <button type="submit" :disabled="isLoading">
        <span v-if="isLoading">Вход...</span>
        <span v-else>Войти</span>
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
      username: '',
      password: '',
      isLoading: false,
      errorMessage: ''
    }
  },
  methods: {
    async handleLogin() {
      this.isLoading = true;
      this.errorMessage = '';
      
      try {
        // Здесь будет логика аутентификации
        // Например, вызов API:
        // const response = await fetch('/api/login', {
        //   method: 'POST',
        //   headers: { 'Content-Type': 'application/json' },
        //   body: JSON.stringify({ username: this.username, password: this.password })
        // });
        
        // Имитация API вызова
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // Для демонстрации, считаем, что логин "admin" и пароль "123456" верные
        if (this.username === 'admin' && this.password === '123456') {
          this.$emit('login-success', this.username);
        } else {
          this.errorMessage = 'Неверное имя пользователя или пароль';
        }
      } catch (error) {
        this.errorMessage = 'Произошла ошибка при входе. Попробуйте позже.';
      } finally {
        this.isLoading = false;
      }
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
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
}
</style>