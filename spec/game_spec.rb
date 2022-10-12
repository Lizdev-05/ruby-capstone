require 'rspec'
require_relative '../classes/game'

RSpec.describe 'Game class' do
  before :each do
    @game = Game.new(true, '2022-10-12', '2022-12-12')
  end

  describe 'Game class instance attributes' do
    it 'should return correct value for multiplayer' do
      expect(@game.multiplayer).to eq true
    end
  
    it 'should return correct value for game last played date' do
      expect(@game.last_played_at.to_s).to eq '2022-10-12'
    end
  
    it 'should return correct value for game publish date' do
      expect(@game.publish_date.to_s).to eq '2022-12-12'
    end
  end 
end


