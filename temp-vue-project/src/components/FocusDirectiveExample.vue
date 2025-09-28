<template>
  <div>
    <h1>Vue Custom Directive Example</h1>
    <input type="text" v-focus placeholder="This should be focused on mount" />
    <br />
    <input type="text" placeholder="This should not be focused" />
  </div>
</template>

<script setup>
// Define the custom directive
const vFocus = {
  mounted: (el) => el.focus()
}
</script>

<style scoped>
div {
  padding: 20px;
}

input {
  margin: 5px;
  padding: 8px;
}
</style>
