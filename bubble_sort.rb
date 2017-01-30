require "pry"

class BubbleSort
  def sort(collection)
            binding.pry
    n = collection.length
    next_index = 0
    n.times do 
      index = n - n
      next_index = n - n + 1
      until next_index == collection.length
        if collection[index] > collection[next_index]
          unordered_val = collection.slice!(next_index)
          collection.insert(index,unordered_val)
        end
        index += 1
        next_index += 1
      end
    end
    collection
  end
end


sorter = BubbleSort.new
puts sorter.sort(["d", "b", "a", "c"])
# => ["a", "b", "c", "d"]