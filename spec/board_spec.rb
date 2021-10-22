require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell = Cell.new("A1")
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#has cells' do
    expect(@board.cells["A1"]).to be_an_instance_of(Cell)
    expect(@board.cells["D4"]).to be_an_instance_of(Cell)
  end

  it '#valid_coordinate?' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  describe '#valid_placement' do
    it 'checks if ship length is valid' do

      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    end

    it '#horizontal_check' do
      example_1 = [["A", "1"], ["A", "2"]]
      example_2 = [["A", "1"], ["A", "2"], ["A", "4"]]

      expect(@board.horizontal_check(example_1)).to eq(true)
      expect(@board.horizontal_check(example_2)).to eq(false)
    end

    it 'vertical_check' do
      example_1 = [["A", "1"], ["B", "1"]]
      example_2 = [["A", "1"], ["B", "1"], ["D", "1"]]

      expect(@board.vertical_check(example_1)).to eq(true)
      expect(@board.vertical_check(example_2)).to eq(false)
    end

    it 'checks if coordinates are consecutive' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A1", "B2"])).to be(true)
      # expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
      # expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
    end
  end

  describe '#place_ship' do
    it 'places a ship' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]
      expect(cell_1.ship).to eq(@cruiser)
  
  end
  end



end
