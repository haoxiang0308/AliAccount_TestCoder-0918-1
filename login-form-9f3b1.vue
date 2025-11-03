<template>
  <div class="login-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          type="email" 
          id="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
          :class="{ 'error': errors.email }"
        />
        <span v-if="errors.email" class="error-message">{{ errors.email }}</span>
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
          :class="{ 'error': errors.password }"
        />
        <span v-if="errors.password" class="error-message">{{ errors.password }}</span>
      </div>
      
      <div class="form-group">
        <label class="checkbox-container">
          <input type="checkbox" v-model="rememberMe" />
          <span class="checkmark"></span>
          Запомнить меня
        </label>
      </div>
      
      <button type="submit" class="submit-btn" :disabled="loading">
        {{ loading ? 'Вход...' : 'Войти' }}
      </button>
      
      <div class="form-footer">
        <a href="#" @click.prevent="$emit('forgot-password')">Забыли пароль?</a>
        <p>Нет аккаунта? <a href="#" @click.prevent="$emit('register')">Зарегистрироваться</a></p>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  emits: ['login', 'forgot-password', 'register'],
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false,
      loading: false,
      errors: {}
    }
  },
  methods: {
    validateForm() {
      this.errors = {}
      
      if (!this.email) {
        this.errors.email = 'Email обязателен'
      } else if (!this.validateEmail(this.email)) {
        this.errors.email = 'Некорректный email'
      }
      
      if (!this.password) {
        this.errors.password = 'Пароль обязателен'
      } else if (this.password.length < 6) {
        this.errors.password = 'Пароль должен содержать не менее 6 символов'
      }
      
      return Object.keys(this.errors).length === 0
    },
    
    validateEmail(email) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      return re.test(email)
    },
    
    async handleSubmit() {
      if (!this.validateForm()) {
        return
      }
      
      this.loading = true
      try {
        // Emit login event with form data
        await this.$emit('login', {
          email: this.email,
          password: this.password,
          rememberMe: this.rememberMe
        })
      } catch (error) {
        console.error('Login error:', error)
      } finally {
        this.loading = false
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
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
  transition: border-color 0.3s;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #42b983;
}

.form-group input.error {
  border-color: #e74c3c;
}

.error-message {
  color: #e74c3c;
  font-size: 14px;
  margin-top: 4px;
  display: block;
}

.checkbox-container {
  display: flex;
  align-items: center;
  cursor: pointer;
  font-size: 14px;
}

.checkbox-container input {
  margin-right: 8px;
  width: auto;
}

.submit-btn {
  width: 100%;
  padding: 12px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #359c6d;
}

.submit-btn:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.form-footer {
  margin-top: 20px;
  text-align: center;
}

.form-footer a {
  color: #42b983;
  text-decoration: none;
}

.form-footer a:hover {
  text-decoration: underline;
}

.form-footer p {
  margin-top: 10px;
  color: #666;
}
</style>