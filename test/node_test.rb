require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("Burke")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_attributes
    assert_equal "Burke", @node.surname
    assert_nil @node.next_node
  end

  def test_last_returns_true_if_next_node_is_nil
    assert_equal @node.tail?, true
  end

  def test_next_node_can_change_node_state
    @node.next_node = 'grain'

    assert_equal 'grain', @node.next_node
  end
end
