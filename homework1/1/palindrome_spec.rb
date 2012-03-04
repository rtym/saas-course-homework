#palindrome_spec.rb

require './palindrome.rb'

describe "#Palindrome" do
  it "Panama" do
    palindrome?("A man, a plan, a canal -- Panama").should == true
  end

  it "Madam" do
    palindrome?("Madam, I'm Adam!").should == true
  end

  it "Abraca" do
    palindrome?("Abracadabra").should == false
  end

  it "Empty" do
    palindrome?("").should == true
  end
end

describe "#Words Count" do
  it "Panama" do
    count_words("A man, a plan, a canal -- Panama").should == {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
  end

  it "Bee" do
    count_words("Doo bee doo bee doo").should == {'doo' => 3, 'bee' => 2}
  end

  it "Empty" do
    count_words("").should == {}
  end

  it "Test comma" do
    count_words("Lorem ipsum,lorem ipsum").should == {'lorem' => 2, 'ipsum' => 2}
  end
end
