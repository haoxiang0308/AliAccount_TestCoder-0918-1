<template>
  <div>
    <h2>Vue自定义指令示例 - 自动聚焦输入框</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框不会自动获得焦点" />
    <br><br>
    <button @click="toggleFocus">切换聚焦到第一个输入框</button>
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义自定义指令
    focus: {
      // 当被绑定的元素挂载到DOM中时...
      mounted(el) {
        // 聚焦元素
        el.focus();
      },
      // 当更新时重新聚焦（可选）
      updated(el) {
        // 可以根据需要添加更新逻辑
      }
    }
  },
  methods: {
    toggleFocus() {
      // 使用指令的元素可以通过ref来访问
      this.$refs.focusInput && this.$refs.focusInput.focus();
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
}

input {
  padding: 8px;
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 8px 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>