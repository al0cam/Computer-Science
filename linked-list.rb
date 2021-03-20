# frozen_string_literal: true

class Node
  attr_accessor :value, :next_el
end

class LinkedList
  attr_accessor :first_el, :last_el
  @size = nil

  def initialize
    @first_el = Node.new
    @last_el = @first_el
    @size = 0
  end

  def size
    @size
  end
  def head
    @first_el
  end
  def tail
    @last_el
  end
  def next(node)
    begin
      node.next_el
    rescue
      puts "Argument must be a node"
    end
  end
  def previous(node)
    previous = first_el
    return previous.value if @size == 1
    begin
      @size.times do
        if previous.next_el == node
          return previous
        else
          previous = previous.next_el
        end
      end
    rescue
      puts "Argument must be a node"
    end
  end
  def getValue(node)
    begin
      node.value
    rescue
      puts 'Argument must be a node'
    end
  end
  def append(value)
    if @first_el.value.nil?
      @first_el.value = value
      @size += 1
    elsif @first_el.next_el.nil?
      @last_el = Node.new
      @first_el.next_el = @last_el
      @last_el.value = value
      @size += 1
    else
      new_el = Node.new
      @last_el.next_el = new_el
      @last_el = new_el
      @last_el.value = value
      @size += 1
    end
  end
  def prepend(value)
    if @first_el.value.nil?
      @first_el.value = value
      @size += 1
    else
      new_el = Node.new
      new_el.next_el = @first_el
      @first_el = new_el
      @first_el.value = value
      @size += 1
    end
  end

  def pop
    if @size == 0
      "the list is empty"
    elsif @size == 1
      @first_el.value = nil
      @size -= 1
    else
      previous = previous(@last_el)
      previous.next_el = nil
      @last_el.value = nil
      @last_el.next_el = nil
      @last_el = previous
      @size -= 1
    end
  end
  def contains?(value)
    current = @first_el
    @size.times do
      return true if current.value == value
    end
    false
  end
  def at(index)
    if index >= @size
      return "the index is smaller than the size of the list"
    elsif index == (@size-1)
      return @last_el
    elsif index == 0
      return @first_el
    else
      current = @first_el
      index.times do
        current = current.next_el
      end
      return current
    end
  end

  def to_s
    return_string = ''
    current = @first_el
    @size.times do
      return_string += "(#{current.value}) -> "
      current = current.next_el
    end
    return_string += "nil"
  end

end


list = LinkedList.new
list.append(3)
list.append(2)
print list.to_s

list.pop
puts list.to_s
list.prepend(2)
puts list.to_s

puts list.getValue(list.next(list.head))
