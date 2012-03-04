#oop_spec.rb

require './advanced_oop.rb'

describe "#Advanced oop" do
  it "#1" do
    f = Foo.new
    f.bar = 1
    f.bar = 2
    f.bar_history.should == [nil, 1, 2]
  end
  
  it "#2" do  
    f = Foo.new
    f.bar = 1
    f.bar = 2
    f = Foo.new
    f. bar = 4
    f.bar_history.should == [nil, 4]
  end
  
  it "Empty test" do
    f = Foo.new
    f.bar_history.should == nil
  end
end
