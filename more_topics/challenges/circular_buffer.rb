
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
    raise BufferFullException if @buffer.size >= @size
    @buffer << element unless element == nil
  end

  def write!(element)
    return write(element) if @buffer.size < @size
    if @buffer.size >= @size && !(element == nil)
      @buffer.shift
      @buffer << element 
    end
  end

  def clear
    @buffer = []
  end

end








