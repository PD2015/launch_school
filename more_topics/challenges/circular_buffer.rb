
require 'pry'
class CircularBuffer

class BufferEmptyException < StandardError; end
class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    # @buffer.shift || raise BufferEmptyException
    # creates syntax error?? 
    # raise BufferEmptyException unless @buffer.shift
    # produces nil .... ?
    last_element = @buffer.shift
    if last_element == nil
      raise BufferEmptyException
    else
      return last_element
    end
  end

  def write(element)
    update_buffer(element) { raise BufferFullException }
  end

  def write!(element)
    update_buffer(element) { @buffer.shift }
  end
  
  def clear
    @buffer = []
  end

  def update_buffer(element)
    return if element == nil
    yield if @buffer.size >= @size 
    @buffer << element 
  end

end








