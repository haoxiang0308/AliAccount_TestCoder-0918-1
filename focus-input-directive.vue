<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input 
      type="text" 
      v-focus 
      placeholder="这个输入框会在挂载时自动获得焦点"
    />
    <br><br>
    <input 
      type="text" 
      placeholder="这个输入框没有聚焦指令"
    />
    <br><br>
    <input 
      type="text" 
      v-focus:delay="1000"
      placeholder="这个输入框会在1秒后获得焦点"
    />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 自定义聚焦指令
    focus: {
      // 指令的定义
      mounted(el, binding) {
        if (binding.arg === 'delay') {
          // 如果传递了delay参数，则延迟聚焦
          setTimeout(() => {
            el.focus();
          }, binding.value || 0);
        } else {
          // 默认情况下，直接聚焦
          el.focus();
        }
      },
      // 更新时也聚焦
      updated(el, binding) {
        if (!binding.arg) {
          el.focus();
        }
      }
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
  font-family: Arial, sans-serif;
}

input {
  padding: 8px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>