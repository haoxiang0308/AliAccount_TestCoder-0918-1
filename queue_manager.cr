# Crystal class to manage a queue
class Crystal
  def initialize
    @queue = [] of String
  end

  # Add an item to the back of the queue
  def enqueue(item : String)
    @queue << item
  end

  # Remove and return the front item from the queue
  def dequeue : String?
    if @queue.empty?
      nil
    else
      @queue.shift
    end
  end

  # Return the front item without removing it
  def peek : String?
    if @queue.empty?
      nil
    else
      @queue.first
    end
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Return the size of the queue
  def size : Int32
    @queue.size
  end

  # Display the current queue
  def display
    puts "Current queue: #{@queue}"
  end
end

# Example usage
crystal_queue = Crystal.new
crystal_queue.enqueue("First")
crystal_queue.enqueue("Second")
crystal_queue.enqueue("Third")
crystal_queue.display

puts "Dequeued: #{crystal_queue.dequeue}"
crystal_queue.display

puts "Peek: #{crystal_queue.peek}"
puts "Size: #{crystal_queue.size}"