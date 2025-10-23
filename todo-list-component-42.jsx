import React, { useState } from 'react';

const TodoList = () => {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');

  const addTodo = () => {
    if (inputValue.trim() !== '') {
      setTodos([...todos, { id: Date.now(), text: inputValue, completed: false }]);
      setInputValue('');
    }
  };

  const toggleTodo = (id) => {
    setTodos(todos.map(todo =>
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ));
  };

  const deleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      addTodo();
    }
  };

  return (
    <div style={{ padding: '20px', maxWidth: '500px', margin: '0 auto' }}>
      <h1>Todo List</h1>
      <div style={{ display: 'flex', marginBottom: '10px' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Add a new task..."
          style={{ flex: 1, padding: '8px', marginRight: '10px' }}
        />
        <button onClick={addTodo} style={{ padding: '8px 15px' }}>Add</button>
      </div>
      <ul style={{ listStyle: 'none', padding: 0 }}>
        {todos.map(todo => (
          <li
            key={todo.id}
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              padding: '10px',
              borderBottom: '1px solid #eee',
              textDecoration: todo.completed ? 'line-through' : 'none'
            }}
          >
            <span
              onClick={() => toggleTodo(todo.id)}
              style={{ cursor: 'pointer', flex: 1 }}
            >
              {todo.text}
            </span>
            <button
              onClick={() => deleteTodo(todo.id)}
              style={{ padding: '5px 10px', backgroundColor: '#ff6b6b', color: 'white', border: 'none', borderRadius: '3px' }}
            >
              Delete
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;