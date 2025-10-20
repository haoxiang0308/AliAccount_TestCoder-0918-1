<template>
  <div class="focus-directive-demo">
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会在页面加载时自动聚焦" />
    <br><br>
    <input v-focus-once type="text" placeholder="这个输入框只在第一次渲染时聚焦" />
    <br><br>
    <button @click="toggleInput = !toggleInput">切换输入框</button>
    <input v-if="toggleInput" v-focus type="text" placeholder="动态输入框也会自动聚焦" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo',
  data() {
    return {
      toggleInput: false
    }
  },
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 只执行一次的聚焦指令
    focusOnce: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
.focus-directive-demo {
  padding: 20px;
}

input {
  padding: 8px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 8px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
}
</style>