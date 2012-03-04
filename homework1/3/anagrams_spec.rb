#anagrams_spec.rb

require './anagrams.rb'

describe "#Anagrams" do
  it "First" do
    combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).sort.should == [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]].sort
  end

  it "Second" do
    combine_anagrams(['blah', 'Hlab', 'cars']).sort.should == [['blah', 'Hlab'], ['cars']].sort
  end
end
