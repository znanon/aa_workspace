# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        min = nil
        max = nil
        if !self.empty?
            min = self[0]
            max = self[0]
            self.each do |ele|
                if ele > max
                    max = ele
                end
                if ele < min
                    min = ele
                end
            end
        end
        if max == nil || min == nil
            return nil
        end
        return max-min
    end

    def average
        if !self.empty?
            sum = self.inject {|s, n| s += n}
            return sum/= (self.length*1.00)
        end
        nil
    end

    def median
        if !self.empty?
            sorted_arr = self.sort
            idx1 = self.length/2
            if self.length % 2 == 0
                idx2 = idx1-1
                return (sorted_arr[idx1]+sorted_arr[idx2])/2.00
            else 
                return sorted_arr[idx1]
            end
        end
        nil
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end

    def my_count(val)
        count = 0
        self.each do |ele|
            if val == ele
                count += 1
            end
        end
        count
    end

    def my_index(val)
        idx = nil
        self.each.with_index do |ele, i|
            if val == ele
                idx = i
                break
            end
        end
        idx
    end

    def my_uniq
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end

        new_arr = []
        hash.each do |k, v|
            new_arr << k
        end

        new_arr
    end

    def my_transpose
        matrix = []
        p self
        self.each.with_index do |arr, i|
            arr.each.with_index do |n, j|
                if i == 0
                    matrix[j] = [n]
                else
                    matrix[j] << n
                end
            end
        end
        matrix
    end
end