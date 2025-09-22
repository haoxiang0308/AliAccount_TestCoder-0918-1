<template>
  <div id="app">
    <h1>Custom Directive Example</h1>
    <p>Page loaded at: {{ loadedAt }}</p>
    <form>
      <label for="input1">Input 1 (Normal):</label>
      <input id="input1" type="text" placeholder="I will not be focused">

      <label for="input2">Input 2 (With v-focus):</label>
      <input id="input2" type="text" v-focus placeholder="I will be focused on page load">

      <label for="input3">Input 3 (Normal):</label>
      <input id="input3" type="text" placeholder="I will not be focused">
    </form>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      loadedAt: new Date().toLocaleTimeString()
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  padding: 20px;
}
form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-top: 20px;
}
input {
  padding: 8px;
  font-size: 16px;
}
</style>