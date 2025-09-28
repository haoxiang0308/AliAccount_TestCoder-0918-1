import { useState } from 'react';

interface Todo {
  id: number;
  text: string;
  done: boolean;
}

function App() {
  const [todos, setTodos] = useState<Todo[]>([
    { id: 1, text: 'Изучить React', done: true },
    { id: 2, text: 'Создать список дел', done: false },
    { id: 3, text: 'Настроить Vite', done: false },
  ]);
  const [inputValue, setInputValue] = useState('');

  const addTodo = () => {
    if (inputValue.trim() !== '') {
      setTodos([...todos, { id: Date.now(), text: inputValue, done: false }]);
      setInputValue('');
    }
  };

  const toggleTodo = (id: number) => {
    setTodos(
      todos.map(todo => 
        todo.id === id ? { ...todo, done: !todo.done } : todo
      )
    );
  };

  return (
    <div style={{ padding: '20px' }}>
      <h1>Список дел</h1>
      <div>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={(e) => e.key === 'Enter' && addTodo()}
          placeholder="Добавить задачу..."
        />
        <button onClick={addTodo}>Добавить</button>
      </div>
      <ul>
        {todos.map(todo => (
          <li key={todo.id} style={{ textDecoration: todo.done ? 'line-through' : 'none' }}>
            <label>
              <input
                type="checkbox"
                checked={todo.done}
                onChange={() => toggleTodo(todo.id)}
              />
              {todo.text}
            </label>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;