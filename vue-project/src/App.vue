<template>
  <div id="app">
    <h1>Custom Focus Directive Demo</h1>
    <form>
      <label for="input1">Input 1 (Normal):</label>
      <input type="text" id="input1" placeholder="I will not be focused">

      <label for="input2">Input 2 (With v-focus):</label>
      <input type="text" id="input2" v-focus placeholder="I will be focused on page load">

      <label for="input3">Input 3 (Normal):</label>
      <input type="text" id="input3" placeholder="I will not be focused">
    </form>
  </div>
</template>

<script>
export default {
  name: 'App'
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
}
input {
  padding: 8px;
  font-size: 16px;
}
</style>