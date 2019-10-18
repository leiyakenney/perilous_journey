require 'minitest/autorun'
require 'minitest/pride'
require "./lib/linked_list"
require 'pry'

class LinkedListTest < Minitest::Test

  def setup
    @list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @list
  end

  def test_list_head
    assert_nil @list.head
  end

  def test_list_append_adds_new_node_to_end_of_list
    @list.append('West')

    assert_instance_of Node, @list.head
    assert_equal 'West', @list.head.surname
  end

  def test_count_of_nodes
    assert_equal 0, @list.count

    @list.append("West")
    assert_equal 1, @list.count
  end

  def test_string
    @list.append("West")
    assert_equal "The West family", @list.to_string
  end

  def test_rhodes_family
    @list.append('Rhodes')

    assert_equal 'Rhodes', @list.head.surname
    assert_nil @list.head.next_node
  end

  def test_last_node_returns_the_last
    @list.append('Rhodes')
    assert_equal 'Rhodes', @list.last_node(@list.head).surname
  end

  def test_empty_returns_true_when_head_is_nil
    assert_equal true, @list.empty?
  end

  def test_empty_returns_false_when_head_is_not_nil
    @list.append('Rhodes')

    assert_equal false, @list.empty?
  end

  def test_new_node_returns_a_new_node
    assert_equal 'Rhodes', @list.new_node('Rhodes').surname
  end


  def test_append_two_nodes
    @list.append('Rhodes')
    @list.append('Hardy')

    assert_equal 'Hardy', @list.head.next_node.surname
    assert_equal 2, @list.count
    assert_equal "The Rhodes family, followed by the Hardy family", @list.to_string
  end

  def test_append_three_nodes
    @list.append('Rhodes')
    @list.append('Hardy')
    @list.append('Smith')

    assert_equal 'Smith', @list.head.next_node.next_node.surname
    assert_equal 3, @list.count
  end

  def test_insert_and_prepend
    @list.append("Brooks")
    assert_equal "The Brooks family", @list.to_string

    @list.append("Henderson")
    @list.prepend("McKinney")
    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", @list.to_string
    assert_equal 3, @list.count

    @list.insert(1, "Lawson")
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", @list.to_string
  end
end
