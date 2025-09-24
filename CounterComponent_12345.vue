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
      this.count++;
    }
  }
}
</script>

<style scoped>
h1 {
  color: #42b883;
}
p {
  font-size: 2em;
  margin: 0.5em 0;
}
button {
  font-size: 1.5em;
  padding: 0.5em 1em;
  cursor: pointer;
}
</style>