<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <button @click="incrementCounter" class="counter-button">
      Clicked {{ count }} times
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
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.counter-button:hover {
  background-color: #359c6d;
}
</style>