class Queue
  def initialize
    @items = [] of Int32
  end

  def enqueue(item : Int32)
    @items << item
  end

  def dequeue : Int32?
    @items.shift
  end

  def peek : Int32?
    @items.first?
  end

  def empty? : Bool
    @items.empty?
  end

  def size : Int32
    @items.size
  end

  def to_s
    @items.to_s
  end
end

# Example usage
queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
puts "Queue: #{queue}"
puts "Dequeued: #{queue.dequeue}"
puts "Queue after dequeue: #{queue}"
puts "Peek: #{queue.peek}"
puts "Size: #{queue.size}"
puts "Empty? #{queue.empty?}"