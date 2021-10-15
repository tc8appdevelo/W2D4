# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers

def least_common_multiple(num_1, num_2)
    i = num_1
    while !(i % num_1 == 0 && i % num_2 == 0)
        i += 1
    end
    i
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    str.each_char.with_index do |char, idx|
        if idx < str.length - 1
            bigram = char + str[idx + 1]
            hash[bigram] += 1
        end
    end
    hash.key(hash.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each { |k, v| new_hash[v] = k }
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = 0
        self.each_with_index do |num_1, idx_1|
            self.each_with_index do |num_2, idx_2|
                if idx_2 > idx_1
                    if num_1 + num_2 == num
                        pairs += 1
                    end
                end
            end
        end
        pairs
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        did_sort = true
        while did_sort
            did_sort = false
            self.each_with_index do |ele, idx|
            
                if idx + 1 < self.length - 1
                    if prc == nil
                        if self[idx] > self[idx + 1]
                            self[idx], self[idx + 1] = self[idx + 1], self[idx]
                            did_sort = true
                        end
                    else
                        if prc.call(self[idx], self[idx + 1]) == 1
                            self[idx], self[idx + 1] = self[idx + 1], self[idx]
                            did_sort = true
                        end
                    end
                end
            end
        end
        self
    end
end
