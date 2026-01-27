/** @type {import('jest').Config} */
const config = {
  testEnvironment: 'jsdom',
  testMatch: ['**/*.test.jsx'],
  moduleFileExtensions: ['jsx', 'js'],
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
};

module.exports = config;
