<template>
  <div>
    <h1>Simple Counter</h1>
    <p>Button clicked {{ count }} times.</p>
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
      this.count++
    }
  }
}
</script>

<style scoped>
h1 {
  color: #42b883;
}
button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>