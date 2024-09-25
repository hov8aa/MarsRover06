require_relative '../moverover'

RSpec.describe 'Move' do
    it "moves rover as per the requirement" do
        move = Move.new(1, 2, 'N')
        move.run_commands('LMLMLMLMM')
        expect(move.position).to eq([1, 3, 'N'])
    end

    it "handles turning and moving in various directions" do
        move = Move.new(0, 0, 'E')
        move.run_commands('MMRMMRMRRM')
        expect(move.position).to eq([2, -2, 'E'])
    end
      
    it "raises an error for invalid direction" do
        expect { Move.new(1, 2, 'X') }.to raise_error(ArgumentError, /Invalid direction/)
    end

    it "raises an error for empty direction" do
       expect { Move.new(1, 2, '') }.to raise_error(ArgumentError, /Invalid direction/)
    end

    it "raises an error for nil direction" do
        expect { Move.new(1, 2, nil) }.to raise_error(ArgumentError, /Invalid direction/)
    end
end