require 'pry'
# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def to_s
    text = "#{'-'*4} #{title} #{'-'*4}\n"
    text << todos.map { |todo| todo.to_s }.join("\n")
    text
  end

  def add(todo)
    # could use todo.instance_of?(Todo)
    if todo.class == Todo
      todos << todo
      return to_s
    else
      raise TypeError, 'Can only add Todo objects'
    end
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def item_at(position)
    todos.fetch(position)
  end

  def mark_done_at(position)
    todos.fetch(position).done!
    # could do :  then would need to write a list.done! method
    # item_at(position).done!
  end

  def mark_undone_at(position)
    todos.fetch(position).undone!
    #  could do :  then would need to write a list.undone! method
    # item_at(position).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

   def done?
    @todos.all? {|todo| todo.done? }
  end

  def remove_at(position)
    todos.delete(item_at(position))
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  # or
  #  def each
  #   @todos.each do |todo|
  #     yield(todo)
  #   end
  # end

  # def select
  #   counter = 0
  #   results = [ ]
  #   while counter < todos.size
  #     if yield(todos[counter])
  #       results << todos[counter]
  #     end
  #     counter += 1
  #   end
  #   results    
  # end

  def select
    list = TodoList.new(title)
    todos.each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def to_a
    todos
  end

  def done!
    todos.each_index do |index|
      mark_done_at(index)
    end
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.first 
  end

  def all_done!
    select {|todo| todo.done? }
  end

  def all_not_done!
    select { |todo| todo.undone! }
  end

  def mark_done(title)!
    find_by_title(title).done!
  end

  def mark_all_done!
    each { |todo| todo.done! }
  end

  def mark_all_undone!
    each { |todo| todo.undone! }
  end

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")




# ---- Adding to the list -----

# # add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"


# todo1.done!
# list.find_by_title('Buy milk')

# list.all_not_done
# list.mark_done('Go to gym')
# list.all_done!
# puts list
# list.mark_all_done!
# puts list
# list.mark_all_undone!
 # list.to_s

 list.mark_done_at(1)


# # <<
# # same behavior as add
# list <<(todo1)

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # ---- Deleting from the the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
