// focus-directive-plugin.js
// Vue 自定义聚焦指令插件

const FocusDirective = {
  mounted(el, binding) {
    // 检查是否传入了参数来控制是否聚焦
    const shouldFocus = binding.value !== false;
    
    if (shouldFocus) {
      // 延迟聚焦，确保DOM已完全渲染
      setTimeout(() => {
        el.focus();
        
        // 如果指定了选择全部文本的选项
        if (binding.value && typeof binding.value === 'object' && binding.value.selectAll) {
          el.select();
        }
      }, 0);
    }
  },
  updated(el, binding) {
    // 如果绑定的值发生变化，重新处理聚焦
    const shouldFocus = binding.value !== false;
    
    if (shouldFocus) {
      setTimeout(() => {
        el.focus();
        
        if (binding.value && typeof binding.value === 'object' && binding.value.selectAll) {
          el.select();
        }
      }, 0);
    }
  }
};

// 导出指令对象
export default FocusDirective;

// 也可以作为插件安装
export const FocusDirectivePlugin = {
  install(app) {
    app.directive('focus', FocusDirective);
  }
};