<template>
  <div>
    <h1>Click Counter</h1>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
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
div {
  padding: 20px;
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 4px;
  max-width: 300px;
  margin: 20px auto;
}

button {
  padding: 10px 15px;
  font-size: 16px;
}
</style>