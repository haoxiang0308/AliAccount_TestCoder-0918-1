import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

// Register the global custom directive `v-focus`
app.directive('focus', {
  // When the bound element is mounted into the DOM...
  mounted(el) {
    // Focus the element
    el.focus()
  }
})

app.mount('#app')