<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>Try clicking outside the input and see it get focused again.</p>
  </div>
</template>

<script>
export default {
  name: 'FocusExample',
  directives: {
    // 定义一个名为 'focus' 的自定义指令
    focus: {
      // 在绑定元素的父组件被挂载后调用
      mounted(el) {
        // 聚焦元素
        el.focus();
      },
      // 每次元素更新后调用
      updated(el) {
        // 为了演示，每次更新也聚焦（实际应用中可能不需要）
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 10px;
  font-size: 16px;
}
</style>
