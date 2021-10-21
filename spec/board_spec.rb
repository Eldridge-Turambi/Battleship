require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell = Cell.new("A1")
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#create_cells' do
    # @board.create_cells

  #     expected = {
  #  "A1" => Cell.new('A1'),
  #  "A2" => Cell.new('A2'),
  #  "A3" => Cell.new('A3'),
  #  "A4" => Cell.new('A4'),
  #  "B1" => Cell.new('B1'),
  #  "B2" => Cell.new('B2'),
  #  "B3" => Cell.new('B3'),
  #  "B4" => Cell.new('B4'),
  #  "C1" => Cell.new('C1'),
  #  "C2" => Cell.new('C2'),
  #  "C3" => Cell.new('C3'),
  #  "C4" => Cell.new('C4'),
  #  "D1" => Cell.new('D1'),
  #  "D2" => Cell.new('D2'),
  #  "D3" => Cell.new('D3'),
  #  "D4" => Cell.new('D4')
  # }
    expect(@board.cells["A1"]).to be_an_instance_of(Cell)
    #expect(@board.cells['A1']).to have_attributes(:coordinate => 'A1', :ship => nil, :cell_hit_on => false)
  end

  it '#valid_coordinate?' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end
end
