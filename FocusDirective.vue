<template>
  <div>
    <h1>Vue 自定义指令示例</h1>
    <input v-focus type="text" placeholder="这个输入框应该自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个不会自动获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
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
  padding: 10px;
  margin: 5px;
}
</style>