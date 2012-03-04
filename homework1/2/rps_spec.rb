
#rps_spec.rb

require './rps.rb'

describe "rps_game_winner" do
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

describe "#is_strategy?" do
  it "Simple strategy" do
    is_strategy?(["Armando", "P"]).should == true
  end

  it "Two strategies" do
    is_strategy?([ ["Armando", "P"], ["Belmondo", "S"] ]).should == false
  end

  it "Empty test" do
    is_strategy?.should == false
  end

  it "Incorrect strategy letter" do
    is_strategy?(["Belmondo", "Z"]).should == false
  end
end

describe "#is_game?" do
  it "Simple game" do
    is_game?([ ["Armando", "P"], ["Belmondo", "S"] ]).should == true
  end

  it "Empty game" do
    is_game?.should == false
  end

  it "Check simple strategy" do
    is_game?(["Armando", "P"]).should == false
  end
end

describe "rps_tournament_winner" do
  it "Book example" do
    rps_tournament_winner([
        [
          [
            ["Armando", "P"], ["Dave", "S"]
          ],
          [ 
            ["Richard", "R"], ["Michael", "S"]
          ],
        ],
        [
          [ 
            ["Allen", "S"], ["Omer", "P"]
          ],
          [
            ["David E.", "R"], ["Richard X.", "P"]
          ]
        ]
      ]).should == ["Richard", "R"]
  end
end
