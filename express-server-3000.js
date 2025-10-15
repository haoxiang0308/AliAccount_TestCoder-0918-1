const express = require('express');
const app = express();
const PORT = 3000;

// Simple middleware
app.use(express.json());

// Simple route
app.get('/', (req, res) => {
  res.send('Hello, World! Express server is running on port 3000');
});

// Another route for testing
app.get('/test', (req, res) => {
  res.json({ message: 'This is a test route', timestamp: new Date() });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});