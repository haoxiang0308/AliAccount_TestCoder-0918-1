<template>
  <div>
    <h2>Lista Filtrada</h2>
    <ul>
      <li v-for="item in filteredList" :key="item.id">
        {{ item.name }} - {{ item.category }}
      </li>
    </ul>
    <button @click="saveToFile">Salvar Lista Filtrada em Arquivo</button>
  </div>
</template>

<script>
import { computed } from 'vue';

export default {
  name: 'VueComputedFilter',
  setup() {
    // Lista de exemplo
    const items = [
      { id: 1, name: 'Produto A', category: 'eletrônicos', price: 100 },
      { id: 2, name: 'Produto B', category: 'vestuário', price: 50 },
      { id: 3, name: 'Produto C', category: 'eletrônicos', price: 200 },
      { id: 4, name: 'Produto D', category: 'livros', price: 30 },
      { id: 5, name: 'Produto E', category: 'vestuário', price: 80 }
    ];

    // Propriedade computada para filtrar itens por categoria
    const filteredList = computed(() => {
      return items.filter(item => item.category === 'eletrônicos');
    });

    // Função para gerar nome de arquivo aleatório
    const generateRandomFileName = () => {
      const prefix = 'filtered_list_';
      const randomString = Math.random().toString(36).substring(2, 10);
      const timestamp = Date.now();
      return `${prefix}${randomString}_${timestamp}.json`;
    };

    // Função para salvar a lista filtrada em um arquivo
    const saveToFile = () => {
      const fileName = generateRandomFileName();
      const dataStr = JSON.stringify(filteredList.value, null, 2);
      const dataUri = 'data:application/json;charset=utf-8,'+ encodeURIComponent(dataStr);
      
      const linkElement = document.createElement('a');
      linkElement.setAttribute('href', dataUri);
      linkElement.setAttribute('download', fileName);
      linkElement.click();
    };

    return {
      filteredList,
      saveToFile
    };
  }
};
</script>

<style scoped>
div {
  padding: 20px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  padding: 5px 0;
  border-bottom: 1px solid #eee;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
}

button:hover {
  background-color: #45a049;
}
</style>