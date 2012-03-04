
#rps_spec.rb

require './rps.rb'

describe "#Simple game" do
  it "Same strategies #1" do
    strategies = [ ['Petia', 'S'], ['Vasia', 'S'] ]
    rps_game_winner(strategies).should == strategies[0]
  end

  it "Same strategies #2" do
    strategies = [ ['Anna', 'p'], ['Nadia', 'P'] ]
    rps_game_winner(strategies).should == strategies[0]
  end

  it "Same strategies #3" do
    strategies = [ ['Eugene', 'R'], ['Vasia', 'r'] ]
    rps_game_winner(strategies).should == strategies[0]
  end
  
  it "PS dominant" do
    strategy = [ ["Armando", "P"], ["Dave", "S"] ]
    rps_game_winner(strategy).should == strategy[1]
  end

  it "SP dominant" do
    strategy = [ ["Armando", "S"], ["Dave", "P"] ]
    rps_game_winner(strategy).should == strategy[0]
  end

  it "RS dominant" do
    strategy = [ ["Armando", "R"], ["Dave", "S"] ]
    rps_game_winner(strategy).should == strategy[0]
  end

  it "SR dominant" do
    strategy = [ ["Armando", "S"], ["Dave", "R"] ]
    rps_game_winner(strategy).should == strategy[1]
  end

  it "RP dominant" do
    strategy = [ ["Armando", "R"], ["Dave", "P"] ]
    rps_game_winner(strategy).should == strategy[1]
  end

  it "PR dominant" do
    strategy = [ ["Armando", "P"], ["Dave", "R"] ]
    rps_game_winner(strategy).should == strategy[0]
  end

  it "Should raise WrongNumberOfPlayersError" do
    lambda { rps_game_winner([ ["Armando", "R"] ]) }.should raise_error(WrongNumberOfPlayersError)
  end

  it "Should raise NoSuchStrategyError" do
    lambda { rps_game_winner([ ["Petia", "Z"], ["Vasia", "K"] ]) }.should raise_error(NoSuchStrategyError)
  end
end
