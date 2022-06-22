module Enumerable
  # Your code goes here
end
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    if block_given?
      for item in self
        yield (item)
      end
    else
      return self 
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      for item in self
        yield item, i
        i += 1
      end
    else
      return self
    end
  end

  def my_select
    selected = []
    if block_given?
      for item in self
        if yield item
          selected.push(item)
        end
      end
      return selected
    else
      return self
    end
  end

  def my_all?
    checked = [] 
    if block_given?
      for item in self
        if yield item
        else
          return false
        end
      end
      return true
    end
  end

  def my_any?
    if block_given?
      for item in self
        if yield item
          return true
        end
      end
      return false
    end
  end

  def my_none?
    if block_given?
      for item in self
        if yield item
          return false
        end
      end
      return true
    end
  end

  def my_count
    count = 0
    if block_given?
      for item in self
        if yield item
          count += 1
        end
      end
    else
      for item in self
        count += 1
      end
    end
    return count
  end

  def my_map
    mapped_array = []
    if block_given?
      for item in self
        mapped = yield item
        mapped_array.push(mapped)
      end
    end
    return mapped_array
  end

  def my_each_with_index
    if block_given?
      i = 0
      for item in self
        yield item, i
        i += 1
      end
    else
      return self
    end
  end

  def my_inject(acc)
    if block_given?
      i = 0
      total = acc
      for item in self
        total = yield total, self[i]
        i += 1
      end
      return total
    end
  end

end

# arr = [1, 1, 2, 3, 5, 8, 13, 21, 34]

# res = arr.my_inject(0) { |sum, value| sum + value }

# res = arr.my_inject(1) { |prod, value| prod * value }

# puts res

# arr.my_each_with_index do |_element, _index|
  # puts "hey! #{_element}, #{_index}"
# end

# arr.my_select { |value| value > 10 }

# out = arr.my_none? { |value| value == 1 }

# p out

# yo = arr.my_map

# p yo