<template>
  <div>
    <h2>Vue自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框应该自动聚焦" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
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

<style scoped>
div {
  padding: 20px;
}

input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>