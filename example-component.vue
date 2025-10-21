<template>
  <div class="container">
    <h2>Vue 自定义聚焦指令示例</h2>
    
    <!-- 基本用法：自动聚焦 -->
    <div class="input-group">
      <label>基本聚焦输入框：</label>
      <input 
        v-focus 
        type="text" 
        placeholder="这个输入框会自动获得焦点" 
      />
    </div>
    
    <!-- 使用对象参数：自动聚焦并全选文本 -->
    <div class="input-group">
      <label>聚焦并全选文本：</label>
      <input 
        v-focus="{ selectAll: true }"
        type="text" 
        value="这段文字会被全选"
      />
    </div>
    
    <!-- 条件聚焦 -->
    <div class="input-group">
      <label>条件聚焦：</label>
      <input 
        v-focus="shouldFocus"
        type="text" 
        placeholder="根据条件决定是否聚焦" 
      />
      <button @click="toggleFocus">切换聚焦状态</button>
    </div>
    
    <!-- 普通输入框（无指令） -->
    <div class="input-group">
      <label>普通输入框：</label>
      <input 
        type="text" 
        placeholder="这个输入框不会自动获得焦点" 
      />
    </div>
  </div>
</template>

<script>
import FocusDirective from './focus-directive-plugin.js';

export default {
  name: 'ExampleComponent',
  directives: {
    focus: FocusDirective
  },
  data() {
    return {
      shouldFocus: true
    };
  },
  methods: {
    toggleFocus() {
      this.shouldFocus = !this.shouldFocus;
      if (this.shouldFocus) {
        // 在切换为聚焦状态时，强制更新以触发指令
        this.$forceUpdate();
      }
    }
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
  max-width: 500px;
  margin: 0 auto;
}

.input-group {
  margin-bottom: 20px;
}

input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 300px;
}

button {
  padding: 8px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-left: 10px;
}

button:hover {
  background-color: #0056b3;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}
</style>