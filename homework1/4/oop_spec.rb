#oop_spec.rb

require './oop.rb'

describe "#Dessert" do
  it "Check name initializer" do
    name = 'test'
    dessert = Dessert.new name, 200
    
    dessert.name.should == name
  end

  it "Check calories initializer" do
    calories = 100
    dessert = Dessert.new 'test', calories

    dessert.calories.should == calories
  end

  it "Check name getter and setter" do
    name = 'test23'
    dessert = Dessert.new 'test', 200
    dessert.name = name

    dessert.name.should == name   
  end

  it "Check calories getter and setter" do
    calories = 500
    dessert = Dessert.new 'test', 200
    dessert.calories = calories

    dessert.calories.should == calories
  end

  it "Check if healthy #1" do
    dessert = Dessert.new 'test', 100

    dessert.healthy?.should == true
  end

  it "Check if not healthy #1" do
    dessert = Dessert.new 'test', 200

    dessert.healthy?.should == false
  end

  it "Check if not healthy #2" do
    dessert = Dessert.new 'test', 350

    dessert.healthy?.should == false
  end

  it "Check if delicious" do
    dessert = Dessert.new 'test', 200
 
    dessert.delicious?.should == true
  end
end

describe "#JellyBean" do
  it "Check flavour initializer" do
    flavor = 'test_flavor'
    jelly_bean = JellyBean.new 'test', 100, flavor

    jelly_bean.flavor.should == flavor
  end

  it "Check flavor getter and setter" do
    flavor = 'test flavor 23'
    jelly_bean = JellyBean.new 'test', 200, 'test_flavor'
    jelly_bean.flavor = flavor

    jelly_bean.flavor.should == flavor
  end

  it "Check delicious #1" do
    jelly_bean = JellyBean.new 'test', 200, 'black licorice'

    jelly_bean.delicious? == false
  end

  it "Check delicious #2" do
    jelly_bean = JellyBean.new 'test', 200, 'blah'

    jelly_bean.delicious? == true
  end
end
