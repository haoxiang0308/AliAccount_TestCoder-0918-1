<template>
  <div>
    <h2>Vue自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus-on-demand type="text" placeholder="点击按钮后这个输入框会获得焦点" />
    <button @click="focusInput">聚焦输入框</button>
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
  directives: {
    // 全局聚焦指令 - 页面加载时自动聚焦
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 条件聚焦指令 - 可以通过事件触发聚焦
    'focus-on-demand': {
      mounted(el) {
        // 初始化时并不聚焦
      },
      updated(el) {
        // 当指令的值更新时聚焦
        if (this.shouldFocus) {
          el.focus();
        }
      }
    }
  },
  data() {
    return {
      shouldFocus: false
    }
  },
  methods: {
    focusInput() {
      this.shouldFocus = true;
      // 强制更新组件以触发指令更新
      this.$forceUpdate();
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