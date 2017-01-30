require "pry"

class InsertionSort

  def sort(array)
    first_element = array.shift
    @sorted = [first_element]
    
    until array.empty?
      sorted_index = 0
      element = array[0]
      inserted = false
      until inserted
        if element <= @sorted[sorted_index]
          element = array.shift
          @sorted.insert(sorted_index, element)
          inserted = true
        else
          if sorted_index == @sorted.length - 1
            element = array.shift
            @sorted.push(element)
            inserted = true
          elsif element < @sorted[sorted_index + 1]
            element = array.shift
            @sorted.insert(sorted_index + 1, element)
            inserted = true
          else 
            sorted_index += 1
          end
        end
      end
    end
    @sorted
  end
end


sorter = InsertionSort.new
# => #<InsertionSort:0x007f81a19e94e8>
puts sorter.sort(["d", "b", "a", "c"])
# => ["a", "b", "c", "d"]

sorter2 = InsertionSort.new
puts sorter2.sort([83, 93, 2, 43, 9])