/**
 * Interface representing a User.
 */
interface User {
  /** Unique identifier for the user. */
  id: number;

  /** The user's full name. */
  name: string;

  /** The user's email address. */
  email: string;
}

// Example usage:
// const user: User = {
//   id: 1,
//   name: "John Doe",
//   email: "john.doe@example.com"
// };