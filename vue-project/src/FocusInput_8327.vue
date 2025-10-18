<template>
  <div class="container">
    <h3>Vue自定义聚焦指令示例</h3>
    <input v-focus type="text" placeholder="自动聚焦的输入框" />
    <br><br>
    <input type="text" placeholder="普通输入框" />
  </div>
</template>

<script>
export default {
  name: 'FocusInput',
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
  font-family: Arial, sans-serif;
}

input {
  padding: 10px;
  margin: 10px;
  border: 2px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
}

input:focus {
  border-color: #007bff;
  outline: none;
}
</style>