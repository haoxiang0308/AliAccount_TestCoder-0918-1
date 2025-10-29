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
      <div style={{ display: 'flex', marginBottom: '20px' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Add a new task..."
          style={{ flex: 1, padding: '10px', marginRight: '10px' }}
        />
        <button 
          onClick={addTodo}
          style={{ 
            padding: '10px 20px', 
            backgroundColor: '#4CAF50', 
            color: 'white', 
            border: 'none', 
            cursor: 'pointer' 
          }}
        >
          Add
        </button>
      </div>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map(todo => (
          <li 
            key={todo.id} 
            style={{ 
              display: 'flex', 
              justifyContent: 'space-between', 
              alignItems: 'center',
              padding: '10px',
              borderBottom: '1px solid #eee'
            }}
          >
            <span 
              style={{ 
                textDecoration: todo.completed ? 'line-through' : 'none',
                color: todo.completed ? '#888' : '#000'
              }}
            >
              {todo.text}
            </span>
            <div>
              <input
                type="checkbox"
                checked={todo.completed}
                onChange={() => toggleTodo(todo.id)}
                style={{ marginRight: '10px' }}
              />
              <button 
                onClick={() => deleteTodo(todo.id)}
                style={{ 
                  padding: '5px 10px', 
                  backgroundColor: '#f44336', 
                  color: 'white', 
                  border: 'none', 
                  cursor: 'pointer' 
                }}
              >
                Delete
              </button>
            </div>
          </li>
        ))}
      </ul>
      {todos.length === 0 && (
        <p style={{ textAlign: 'center', color: '#888' }}>No tasks yet. Add one above!</p>
      )}
    </div>
  );
};

export default TodoList;