#!/usr/bin/env ruby

# file: dependency_builder.rb

# description: Builds a dependency tree (inside out) from clusters of 
#              dependencies (outside in) in a string format with 
#              indented (2 spaces) branches.


require 'line-tree'


class DependencyBuilder

  attr_reader :to_s

  def initialize(s)

    a = LineTree.new(s).to_a
    items = a.flatten.uniq

    h = Hash[items.zip([[]] * items.length)]

    a.each do |x|

      head, *tail = x

      # check each child
      tail.flatten.each {|x2| h[x2]  += [head] }

    end

    # reject items without dependencies
    h2 = h.reject {|k,v| v.empty?}

    h2.keys.each do |item|

      key, _ = h2.find {|x| x[-1].grep(item).any? }

      next unless h2[key]
      index = h2[key].index item
      next unless index
      h2[key][index] = {item => h2[item]}
      h2.delete item
      
    end

    @to_s = treeize(h2)

  end

  private

  def treeize(obj, indent=0)

    case obj
    when Hash

      i = indent + 1
      obj.map {|k,v| '  ' * indent + k + "\n" + treeize(v, i.clone)}.join("\n")

    when Array

      obj.map {|x| treeize(x, indent)}.join("\n")

    else

      '  ' * indent + obj

    end
  end

end