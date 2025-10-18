<template>
  <div class="counter-container">
    <h2>Click Counter</h2>
    <button @click="incrementCount" class="counter-button">
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
    incrementCount() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-container {
  text-align: center;
  padding: 20px;
}

.counter-button {
  background-color: #42b983;
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
  background-color: #359c6d;
}
</style>