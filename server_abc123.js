const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello, World! Express server is running on port 3000');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});