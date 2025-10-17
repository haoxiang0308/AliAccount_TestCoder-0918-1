# Crystal class for managing a queue
class QueueManager(T)
  def initialize
    @queue = [] of T
  end

  # Add an element to the back of the queue
  def enqueue(element : T)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue : T?
    @queue.shift
  end

  # Return the front element without removing it
  def peek : T?
    @queue.first?
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Clear the queue
  def clear : Nil
    @queue.clear
  end

  # Get a copy of the queue array
  def to_a : Array(T)
    @queue.dup
  end
end

# Example usage:
# queue = QueueManager(String).new
# queue.enqueue("first")
# queue.enqueue("second")
# puts queue.dequeue # => "first"
# puts queue.peek    # => "second"