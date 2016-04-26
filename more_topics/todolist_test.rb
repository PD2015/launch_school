require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")  
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
  assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todos[0], @list.first)
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    # assert_equal(@todo1, @list.shift)
    # assert_equal(2, @list.size)

    # official:
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @list.mark_all_done!
    assert(@list.done?)
  end

  def test_add
    assert_raises(TypeError) {@list.add('string')}
    assert_raises(TypeError) {@list.add(5)}
    assert_raises(TypeError) {@list.add([])}
    assert_raises(TypeError) {@list.add({})}
  end

  def test_add_alias
    todo4 = Todo.new('Wash up')
    @list <<(todo4)
    # this line is required why?
    # something to do with altering the @todos instance variable outwith this method scope.
    todos = @todos << todo4
  end

  def test_item_at
    assert_raises(ArgumentError) {@list.item_at}
    assert_raises(IndexError) { @list.item_at(100) }
     assert_equal(@todo1, @list.item_at(0))
     assert_equal(@todo2, @list.item_at(1))
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
    assert_equal(nil, @list.find_by_title('unknown'))
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert(@todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(ArgumentError) {@list.mark_done_at}
    assert_raises(IndexError) {@list.mark_done_at(100)}
  end

  def test_mark_undone_at
    @list.mark_undone_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(ArgumentError) {@list.mark_undone_at}
    assert_raises(IndexError) {@list.mark_undone_at(100)}
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
    assert(@list.all_done!)
  end

  def test_mark_done_by_title_bang
    assert_equal(false, @todo1.done?)
    @list.mark_done('Buy milk')
    assert(@todo1.done?)
  end

  def test_mark_all_undone
    @list.done!
    assert(@list.all_done!)
    @list.mark_all_undone!
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(100)}
    item0 = @list.remove_at(0)
    assert_equal(@todo1, item0)
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(ArgumentError) {@list.remove_at}
  end

  def test_to_s
  output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT
  assert_equal(output, @list.to_s)
  end

  def test_to_s_2
  @list.mark_done_at(0)
  output2 = <<-OUTPUT2.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [X] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT2
  assert_equal(output2, @list.to_s)
  end

  def test_to_s_3
  @list.mark_all_done!
  output2 = <<-OUTPUT2.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [X] Buy milk
  [X] Clean room
  [X] Go to gym
  OUTPUT2
  assert_equal(output2, @list.to_s)
  end

  def test_each
    assert_equal(@list, @list.each { |todo| nil })
    @list.all_not_done!
    @list.each {|todo| todo.done!}
    assert(@list.done?)
  end

  def test_select
    new_list = TodoList.new(@list.title).to_s
    original = @list.select {|todo| nil }.to_s
    assert_equal(new_list, original)
    @todo1.done!
    new_list << @todo1.to_s
    original_with_selection = @list.select { |todo| todo.done?}.to_s
    assert_equal(new_list, original_with_selection)
  end
end


















