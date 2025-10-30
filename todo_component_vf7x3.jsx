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
    setTodos(
      todos.map(todo =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    );
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
    <div style={{ padding: '20px', maxWidth: '400px', margin: '0 auto' }}>
      <h2>Todo List</h2>
      <div style={{ display: 'flex', marginBottom: '10px' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Add a new task..."
          style={{ flex: 1, padding: '8px', marginRight: '10px' }}
        />
        <button 
          onClick={addTodo}
          style={{ 
            padding: '8px 15px', 
            backgroundColor: '#4CAF50', 
            color: 'white', 
            border: 'none', 
            borderRadius: '4px',
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
              alignItems: 'center',
              padding: '10px',
              borderBottom: '1px solid #eee',
              textDecoration: todo.completed ? 'line-through' : 'none',
              color: todo.completed ? '#888' : '#000'
            }}
          >
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleTodo(todo.id)}
              style={{ marginRight: '10px' }}
            />
            <span style={{ flex: 1 }}>{todo.text}</span>
            <button
              onClick={() => deleteTodo(todo.id)}
              style={{
                backgroundColor: '#f44336',
                color: 'white',
                border: 'none',
                padding: '5px 10px',
                borderRadius: '4px',
                cursor: 'pointer'
              }}
            >
              Delete
            </button>
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