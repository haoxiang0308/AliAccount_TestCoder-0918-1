<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <p>Button clicked: <strong>{{ count }}</strong> times</p>
    <button @click="increment">Click Me!</button>
  </div>
</template>

<script>
export default {
  name: 'CounterComponent',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++;
    }
  }
}
</script>

<style scoped>
.counter-container {
  padding: 20px;
  border: 1px solid #ccc;
  text-align: center;
  max-width: 300px;
  margin: 20px auto;
}

button {
  padding: 10px 15px;
  font-size: 16px;
  cursor: pointer;
}
</style>