require 'tdd'


describe Array do
  describe '#my_uniq' do
    it "remove duplicates from the array" do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    it 'convert between the row-oriented and column-oriented representations.' do
      expect([ [0, 3, 6], [1, 4, 7], [2, 5, 8] ].my_transpose).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end
  end

  describe "#stock_picker" do 
    it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock" do
      expect([5,1,2,3,6,2].stock_picker).to eq([1,4])
    end
  end
  
end


describe TowerOfHanoi do 
  subject(:tower) {TowerOfHanoi.new}

  describe 'initialize' do

    it "initialize three different towers as empty arrays" do
      expect(tower.t1).to eq([[3],[2],[1]])
      expect(tower.t2).to eq([])
      expect(tower.t3).to eq([])
    end
  end

  describe '#move' do
    it 'should move the top disk to the destination tower' do 
      expect(tower.move([[3],[2]],[])).to eq([[2]])
    end

    it 'raise an error if the current tower is empty' do
      expect { tower.move([], [[1]])}.to raise_error("You're not allowed to move this piece to that tower")
    end

    it 'raise an error if the destination tower top element is greater than the current tower top element' do
      expect { tower.move([[3],[2]],[[1]]) }.to raise_error("You're not allowed to move this piece to that tower")
    end
  end

  describe "#won?" do
    tower2 = TowerOfHanoi.new
    tower2.t3 = [[3],[2],[1]]
    tower2.t1 = []
    
    it 'returns true if the last tower is fill with all disk' do
      expect(tower2.won?).to eq(true)
    end

    it 'returns true if the last tower is fill with all disk' do
      expect(tower.won?).to eq(false)
    end

  end

end