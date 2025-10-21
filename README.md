# Vue 自定义聚焦指令

这个项目包含一个Vue自定义指令，用于自动聚焦输入框元素。

## 文件说明

- `focus-directive-plugin.js` - 自定义聚焦指令的实现
- `example-component.vue` - 使用该指令的示例组件
- `focus-input-directive.vue` - 早期的简单实现

## 自定义指令功能

`v-focus` 指令提供了以下功能：

1. **基本聚焦** - 使用 `v-focus` 让元素自动获得焦点
2. **条件聚焦** - 使用 `v-focus="condition"` 根据条件决定是否聚焦
3. **聚焦并全选** - 使用 `v-focus="{ selectAll: true }"` 聚焦并全选文本

## 使用方法

### 方法一：在组件中局部注册

```javascript
import FocusDirective from './focus-directive-plugin.js';

export default {
  directives: {
    focus: FocusDirective
  }
}
```

在模板中使用：
```html
<input v-focus type="text" placeholder="自动聚焦" />
<input v-focus="{ selectAll: true }" type="text" value="聚焦并全选" />
<input v-focus="shouldFocus" type="text" placeholder="条件聚焦" />
```

### 方法二：全局注册为插件

```javascript
import { FocusDirectivePlugin } from './focus-directive-plugin.js';

app.use(FocusDirectivePlugin);
```

## 指令实现细节

指令在 `mounted` 和 `updated` 钩子中处理聚焦逻辑，并使用 `setTimeout` 确保DOM完全渲染后再执行聚焦操作。支持传入参数来控制聚焦行为。