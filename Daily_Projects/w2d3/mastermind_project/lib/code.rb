class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  def self.valid_pegs?(arr)
    arr.all? {|ele| POSSIBLE_PEGS.has_key?(ele.upcase)}
  end

  def initialize(arr)
    raise unless Code.valid_pegs?(arr)
    @pegs = arr.map {|ele| ele.upcase}
  end

  def self.random(len)
    new_arr = []
    POSSIBLE_PEGS.each_key {|k| new_arr << k}
    Code.new(Array.new(len) {new_arr.sample})
  end

  def self.from_string(string)
    colors = string.split("")
    Code.new(colors)
  end 

  def [](index)
    @pegs[index]
  end 

  def length
    @pegs.length 
  end 

  def num_exact_matches(code)
    count = 0 
    code.pegs.each_with_index do |color, i|
      if color == @pegs[i]
        count += 1
      end 
    end 
    count 
  end 

  def num_near_matches(code)
    count = 0 
    code.pegs.each_with_index do |color, i|
      if @pegs.include?(color) && @pegs[i] != color
        count += 1
      end 
    end 
    count 
  end 

  def ==(code)
    num_exact_matches(code) == code.pegs.length 
  end 


end
