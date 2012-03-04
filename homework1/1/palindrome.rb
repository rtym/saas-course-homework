def palindrome?(str)
  prepared = str.gsub(/\W+/, '').downcase
  
  return prepared == prepared.reverse
end

def count_words(str)
  result = Hash.new(0)

  str.downcase.split(/\W+/).each{|word| result[word] += 1}

  return result
end
