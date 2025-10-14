<template>
  <div class="login-container">
    <form @submit.prevent="onSubmit" class="login-form">
      <h2>Вход</h2>
      <div class="form-group">
        <label for="email">Email:</label>
        <input
          id="email"
          v-model="email"
          type="email"
          required
          :class="{ 'error': errors.email }"
        />
        <span v-if="errors.email" class="error-message">{{ errors.email }}</span>
      </div>
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          id="password"
          v-model="password"
          type="password"
          required
          :class="{ 'error': errors.password }"
        />
        <span v-if="errors.password" class="error-message">{{ errors.password }}</span>
      </div>
      <button type="submit" :disabled="loading">Войти</button>
      <p v-if="message" :class="`message ${messageType}`">{{ message }}</p>
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
      message: '',
      messageType: '', // 'success' or 'error'
      errors: {}
    }
  },
  methods: {
    validateForm() {
      const newErrors = {};
      if (!this.email) {
        newErrors.email = 'Email обязателен.';
      } else if (!/\S+@\S+\.\S+/.test(this.email)) {
        newErrors.email = 'Email недействителен.';
      }
      if (!this.password) {
        newErrors.password = 'Пароль обязателен.';
      } else if (this.password.length < 6) {
        newErrors.password = 'Пароль должен содержать не менее 6 символов.';
      }
      this.errors = newErrors;
      return Object.keys(newErrors).length === 0;
    },
    async onSubmit() {
      if (!this.validateForm()) {
        return;
      }

      this.loading = true;
      this.message = '';
      // Имитация асинхронного запроса
      try {
        await new Promise(resolve => setTimeout(resolve, 1000));
        // Простая проверка для демонстрации
        if (this.email === 'admin@example.com' && this.password === 'password') {
          this.message = 'Успешный вход!';
          this.messageType = 'success';
        } else {
          throw new Error('Неверный email или пароль.');
        }
      } catch (err) {
        this.message = err.message;
        this.messageType = 'error';
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
  background-color: #f0f2f5;
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
}

input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input.error {
  border-color: #ff4d4f;
}

.error-message {
  color: #ff4d4f;
  font-size: 0.875rem;
  margin-top: 0.25rem;
  display: block;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #1890ff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.message {
  margin-top: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  text-align: center;
}

.message.success {
  background-color: #f6ffed;
  color: #52c41a;
  border: 1px solid #b7eb8f;
}

.message.error {
  background-color: #fff2f0;
  color: #ff4d4f;
  border: 1px solid #ffccc7;
}
</style>