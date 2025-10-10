<template>
  <div>
    <input v-focus type="text" placeholder="This input will be focused on render" />
    <input type="text" placeholder="This input will not be focused" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style>
input {
  display: block;
  margin: 10px;
}
</style>