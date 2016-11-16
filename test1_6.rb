# Module for convertation of string, consisting of 'A', 'B', 'C'
# Rules for convertation
# "AB" => "AA"
# "BA" => "AA"
# "CB" => "CC"
# "BC" => "CC"
# "AA" => "A"
# "CC" => "C"
#
# made on simple implemetation of linked list
# this allow to give O(N) in 'B' * N + 'A', and 'A' + 'B' * N
#
# TODO(Evgeny Lukoyanov) maybe needs to implement in some other variant
# because randomly generated string give us O(N^2) :(
module StringConvertation

  # Class for elements of two-dimensial linked list
  class Node
    attr_accessor :value, :next, :prev

    def initialize(value, opts = {})
      next_node = opts[:next]
      prev_node = opts[:prev]

      @value = value
      @next = next_node
      @prev = prev_node
    end

    def to_s
      "#{@value}"
    end
  end

  # Class for two-dimensial linked list containing Nodes.
  # Include methods "remove_node(node)", "convert(node)", "solution(string)"
  class List
    attr_accessor :head, :tail

    def initialize(str = "")
      @rules = { AB: "AA", BA: "AA", BC: "CC", CB: "CC", AA: "A", CC: "C" }

      if str.empty?
        @head = nil
        @tail = nil
      else
        @head = Node.new(str[0])
        cur = @head

        i = 1
        while i < str.length
          cur.next = Node.new(str[i], prev: cur)
          cur = cur.next
          i += 1;
        end

        @tail = cur
      end
    end

    def to_s
      cur = @head
      res = ""
      until cur.nil?
        res += cur.to_s
        cur = cur.next
      end
      res
    end

    # Removes node from list.
    # arg - node, which will remove
    # Returns resulted list.
    def remove_node(node)
      if node.prev.nil?
        @head = node.next
      else
        node.prev.next = node.next
      end

      if node.next.nil?
        @tail = node.prev
      else
        node.next.prev = node.prev
      end

      self
    end

    # Converts values of current node and next node if needs
    # by the rules, specified in @rules.
    # If resulted string shorter, than string before convertation, removes redundant.
    # arg - deleting node.
    # Returns resulted list.
    def convert(node)
      target_values = @rules["#{node}#{node.next}".to_sym]

      node.value = target_values[0]

      if target_values[1]
        node.next.value = target_values[1]
      else
        self.remove_node(node.next)
      end

      self
    end

    # Converts string by the rules.
    # Returns resulted list.
    def solution
      cur = @head

      until cur.nil?
        if in_rules?(cur)
          convert(cur)
          cur = cur.prev || head
        else
          cur = cur.next
        end
      end

      self.to_s
    end


    private

    def in_rules?(node)
      @rules.include? "#{node}#{node.next}".to_sym
    end

    def empty?
      head.nil?
    end
  end
end

# include "StringConvertation"
# Wrap method for convertation string
def solution(str)
  StringConvertation::List.new(str).solution
end
