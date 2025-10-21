<template>
  <div>
    <h2>Vue Focus Directive Example</h2>
    <input v-focus type="text" placeholder="This input will be focused on mount" />
    <br><br>
    <input type="text" placeholder="This input will not be focused" />
    <br><br>
    <input v-focus-on-demand type="text" placeholder="This input will be focused when component updates" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
  directives: {
    // Global focus directive
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // Directive that focuses on component update
    'focus-on-demand': {
      mounted(el) {
        // Focus after a delay to demonstrate update behavior
        setTimeout(() => {
          el.focus();
        }, 1000);
      }
    }
  },
  data() {
    return {
      // Example data if needed
    };
  }
};
</script>

<style scoped>
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>