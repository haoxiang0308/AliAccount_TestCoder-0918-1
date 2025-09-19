<template>
  <div class="click-counter">
    <h2>Vue Click Counter</h2>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
    <button @click="reset">Reset</button>
  </div>
</template>

<script>
export default {
  name: 'ClickCounter',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++
    },
    reset() {
      this.count = 0
    }
  }
}
</script>

<style scoped>
.click-counter {
  text-align: center;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
  max-width: 300px;
  margin: 20px auto;
}

button {
  margin: 5px;
  padding: 10px 15px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #369870;
}
</style>