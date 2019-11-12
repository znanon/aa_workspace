class Hand
  def initialize(cards, pot)
    # @cards = cards
    # @pot = pot
    @all_cards = cards + pot
    @suits = Hash.new(0)
    @values = Hash.new(0)
  end

  def royal_flush?

  end
  
  def poker?
    return true if values.values.any?{|val| val == 4}
    false
  end

  def flush?
    all_cards.each do |card|
      suits[card.suit] += 1
    end
    return true if suits.values.any? {|val| val >= 5}
    false
  end

  def straight?
    arr = values.keys        
  end

  def full_house?
    self.three_of_kind? && self.pair?
  end

  def three_of_kind?
    return true if values.values.any?{|val| val == 3}
    false
  end

  def pair?
    return true if values.values.any?{|val| val == 2}
    false
  end

  private
  attr_accessor :cards, :suits, :values

end