<template>
  <div>
    <h1>Vue 自定义指令示例</h1>
    <input v-focus type="text" placeholder="这个输入框应该在挂载时自动聚焦">
    <br><br>
    <input type="text" placeholder="这个不会自动聚焦">
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // 定义一个名为 'focus' 的局部自定义指令
    focus: {
      // 在绑定元素的父组件被挂载后调用
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  }
}
</script>

<style>
input {
  padding: 8px;
  margin: 4px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>