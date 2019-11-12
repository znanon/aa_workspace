class Deck
  VALUES = (1..13).to_a
  SUITES = ["Hearts","Diamonds","Spades","Clubs"]
  attr_accessor :deck
  def initialize
    @deck = Array.new(52) 
    VALUES.each do |val|
      SUITES.each do |suit|
        @deck << Card.new(val, suit)
      end
    end
    @deck.shuffle!
  end
 
  def draw(num_cards)
    drawn_cards = []
    num_cards.times do
      drawn_cards << deck.pop
    end
    drawn_cards
  end
end