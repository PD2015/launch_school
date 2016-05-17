class TableException < StandardError; end

class Table

  def initialize
    raise TableException, 'this is the message error'
  end
end

# t = Table.new
