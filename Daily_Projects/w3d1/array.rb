class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i]) if prc != nil
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        new_arr = []
        self.my_each do |item|
            if item.is_a? Array
                new_arr += item.my_flatten
            else
                new_arr << item
            end
        end
        new_arr
    end

    def my_zip(*arrays)
        new_arr = Array.new(self.length) {Array.new(arrays.length+1)}
        idx = 0
        self.my_each do |item|
            new_arr[idx] = [item]
            idx += 1
        end
        i = 0
        while i < arrays.length
            j = 0
            while j < self.length
                new_arr[j] << arrays[i][j] if arrays[i] != nil
                j += 1
            end
            i += 1
        end
        new_arr
    end

    def my_rotate(num=1)
        new_arr = []
        new_arr += self
        while num < 0
            new_arr.unshift(new_arr.pop())
            num += 1
        end
        while num > 0
            new_arr.push(new_arr.shift())
            num -= 1
        end
        new_arr
    end

    def my_join(separator="")
        new_str = ""
        i = 0
        self.my_each do |str|
            new_str += separator if i != 0
            new_str += str
            i+=1
        end
        new_str
    end

    def my_reverse
        i = self.length-1
        new_arr = []
        while i >= 0
            new_arr << self[i] 
            i -= 1
        end
        new_arr
    end
end