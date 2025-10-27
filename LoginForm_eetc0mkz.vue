<template>
  <div class="login-form-container">
    <form @submit.prevent="onSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          type="email" 
          id="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
        />
      </div>
      
      <div class="form-group checkbox-group">
        <label>
          <input 
            type="checkbox" 
            v-model="rememberMe"
          />
          Запомнить меня
        </label>
      </div>
      
      <button type="submit" class="submit-btn">Войти</button>
      
      <div class="form-footer">
        <a href="#" @click.prevent="forgotPassword">Забыли пароль?</a>
        <p>или</p>
        <a href="#" @click.prevent="register">Создать аккаунт</a>
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
      rememberMe: false
    }
  },
  methods: {
    async onSubmit() {
      // Basic validation
      if (!this.email || !this.password) {
        alert('Пожалуйста, заполните все поля');
        return;
      }
      
      // In a real application, you would send the data to your authentication API
      console.log('Login attempt with:', {
        email: this.email,
        password: this.password,
        rememberMe: this.rememberMe
      });
      
      try {
        // Simulate API call
        await this.performLogin();
        console.log('Login successful');
        // Here you would typically redirect the user or update the app state
      } catch (error) {
        console.error('Login failed:', error);
        alert('Ошибка входа. Пожалуйста, проверьте свои данные.');
      }
    },
    async performLogin() {
      // This is a mock function - in a real app, you would make an API call
      return new Promise((resolve) => {
        setTimeout(() => resolve(), 1000);
      });
    },
    forgotPassword() {
      console.log('Forgot password clicked');
      // Implement forgot password functionality
    },
    register() {
      console.log('Register clicked');
      // Implement registration functionality
    }
  }
}
</script>

<style scoped>
.login-form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
}

.login-form {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.login-form h2 {
  text-align: center;
  margin-bottom: 24px;
  color: #333;
}

.form-group {
  margin-bottom: 16px;
}

.form-group label {
  display: block;
  margin-bottom: 6px;
  font-weight: 500;
  color: #555;
}

.form-group input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input {
  width: auto;
  margin-right: 8px;
}

.submit-btn {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover {
  background-color: #0056b3;
}

.form-footer {
  text-align: center;
  margin-top: 20px;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
  font-size: 14px;
}

.form-footer a:hover {
  text-decoration: underline;
}

.form-footer p {
  margin: 10px 0;
  color: #666;
}
</style>