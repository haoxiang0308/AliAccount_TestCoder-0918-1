<template>
  <div>
    <h1>Simple Counter</h1>
    <p>Button clicked: {{ count }} times</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'SimpleCounter',
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
  font-family: Arial, sans-serif;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
</style>