<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>See the custom directive in the template above.</p>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // Define the custom 'focus' directive
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>