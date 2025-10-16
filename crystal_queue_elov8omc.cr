# Crystal class for managing a queue
class Queue
  def initialize
    @items = [] of Int32 | String | Float64 | Nil
  end

  # Add an item to the rear of the queue
  def enqueue(item)
    @items << item
  end

  # Remove an item from the front of the queue
  def dequeue
    if empty?
      raise "Queue is empty"
    else
      @items.shift
    end
  end

  # Check if the queue is empty
  def empty?
    @items.size == 0
  end

  # Get the size of the queue
  def size
    @items.size
  end

  # Peek at the front item without removing it
  def front
    if empty?
      nil
    else
      @items.first
    end
  end

  # Display all items in the queue
  def display
    @items
  end
end

# Example usage:
# queue = Queue.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# puts queue.display # => [1, 2, 3]
# puts queue.dequeue # => 1
# puts queue.front   # => 2