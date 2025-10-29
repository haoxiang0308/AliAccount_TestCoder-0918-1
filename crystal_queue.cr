class Crystal
  def initialize
    @queue = [] of Int32
  end

  def enqueue(element)
    @queue << element
  end

  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.shift
    end
  end

  def peek
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.first
    end
  end

  def size
    @queue.size
  end

  def empty?
    @queue.empty?
  end

  def display
    puts @queue
  end
end

# Example usage
queue = Crystal.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
puts "Queue contents:"
queue.display
puts "Size: #{queue.size}"
puts "Peek: #{queue.peek}"
puts "Dequeued: #{queue.dequeue}"
puts "Queue after dequeue:"
queue.display