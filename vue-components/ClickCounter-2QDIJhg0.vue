<template>
  <div class="click-counter">
    <button @click="incrementCounter">Clicked {{ count }} times</button>
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
    incrementCounter() {
      this.count++
    }
  }
}
</script>

<style scoped>
.click-counter {
  text-align: center;
  margin: 20px;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
}

button:hover {
  background-color: #359c6d;
}
</style>