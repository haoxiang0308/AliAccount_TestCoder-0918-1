<template>
  <div class="login-container">
    <form @submit.prevent="onSubmit" class="login-form">
      <h2>Вход</h2>
      <div class="form-group">
        <label for="username">Имя пользователя</label>
        <input
          id="username"
          v-model="username"
          type="text"
          name="username"
          required
          :disabled="loading"
        />
      </div>
      <div class="form-group">
        <label for="password">Пароль</label>
        <input
          id="password"
          v-model="password"
          type="password"
          name="password"
          required
          :disabled="loading"
        />
      </div>
      <button type="submit" :disabled="loading">
        {{ loading ? 'Загрузка...' : 'Войти' }}
      </button>
      <p v-if="error" class="error-message">{{ error }}</p>
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
      loading: false,
      error: ''
    };
  },
  methods: {
    async onSubmit() {
      this.loading = true;
      this.error = '';

      // Имитация асинхронного запроса
      try {
        // await loginService(this.username, this.password);
        await new Promise(resolve => setTimeout(resolve, 1000)); // Задержка для демонстрации
        alert(`Успешный вход для пользователя: ${this.username}`);
      } catch (err) {
        this.error = 'Ошибка входа. Пожалуйста, проверьте свои данные.';
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
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

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.form-group input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
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

.error-message {
  color: red;
  margin-top: 1rem;
  text-align: center;
}
</style>