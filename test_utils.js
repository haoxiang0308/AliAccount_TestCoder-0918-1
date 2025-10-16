// Simple utility to generate a random string for test file names
export const generateRandomTestFileName = () => {
  const randomString = Math.random().toString(36).substring(2, 10);
  return `/workspace/${randomString}.test.js`;
};