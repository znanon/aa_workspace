class Array

    def span
        min = nil
        max = nil
        if !self.empty?
            min = self[0]
            max = self[0]
            self.each do |el|
                max = el if el > max
                min = el if el < min  
            end
        end
        if min.nil? || max.nil?
            return nil
        end
        max - min
    end

    def average
        if !self.empty?
            self.sum/self.length.to_f
        end
    end

    def median
        if !self.empty?
            sorted_arr = self.sort
            idx_1 = self.size/2
            if self.size % 2 == 0
                idx_2 = idx_1-1
                return (sorted_arr[idx_1] + sorted_arr[idx_2]) / 2.00
            else
                return sorted_arr[idx_1]
            end
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |el|
            hash[el] += 1
        end
        hash
    end

    def my_count(val)
        count = 0
        self.each do |el|
            count +=1 if val == el
        end
        count
    end

    def my_index(val)
        idx = nil
        self.each_with_index do |el, i|
            if val == el
                idx = i
                break
            end
        end
        idx
    end

    def my_uniq
        appeared = []
        self.each do |el|
            appeared << el unless appeared.include?(el)
        end
        appeared
    end


    def my_transpose
        matrix = Array.new(self.size) { [] }
        self.each_with_index do |arr, i|
            arr.each_with_index do |n, j|
                matrix[j] << n
            end
        end
        matrix
    end
end