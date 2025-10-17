# Crystal class for managing a queue
class Crystal
  def initialize
    @queue = [] of String
  end

  # Add an element to the back of the queue
  def enqueue(element : String)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue : String?
    @queue.shift
  end

  # Return the front element without removing it
  def peek : String?
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
  def to_a : Array(String)
    @queue.dup
  end
end

# Example usage:
# crystal = Crystal.new
# crystal.enqueue("first")
# crystal.enqueue("second")
# puts crystal.dequeue # => "first"
# puts crystal.peek    # => "second"