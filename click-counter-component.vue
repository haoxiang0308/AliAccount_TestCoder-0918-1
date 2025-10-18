<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <p>Button has been clicked: {{ count }} times</p>
    <button @click="incrementCount" class="counter-button">Click Me!</button>
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
    incrementCount() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-container {
  padding: 20px;
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 8px;
  max-width: 300px;
  margin: 20px auto;
}

.counter-button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 4px;
}

.counter-button:hover {
  background-color: #45a049;
}
</style>