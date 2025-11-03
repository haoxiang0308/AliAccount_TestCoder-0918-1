<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <button @click="incrementCounter" class="counter-button">
      Click me! Count: {{ count }}
    </button>
  </div>
</template>

<script>
export default {
  name: 'CounterButton',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    incrementCounter() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-container {
  padding: 20px;
  text-align: center;
}

.counter-button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.counter-button:hover {
  background-color: #369870;
}
</style>