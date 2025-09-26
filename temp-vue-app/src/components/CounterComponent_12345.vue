<template>
  <div>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'CounterComponent_12345',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++
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
  background-color: #f9f9f9;
}

button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>