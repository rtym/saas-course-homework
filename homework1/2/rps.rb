class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game = [])
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless is_game?game

  first_strategy = game[0][1].downcase
  second_strategy = game[1][1].downcase
  result = {first_strategy => game[0], second_strategy => game[1]}
  strategies = [first_strategy, second_strategy].sort

  if first_strategy == second_strategy
    return game.first
  elsif strategies == ['r', 's']
    return result['r']
  elsif strategies == ['p', 'r']
    return result['p']
  elsif strategies == ['p', 's']
    return result['s']
  else
    raise NoSuchStrategyError
  end
end

def is_strategy?(strategy = [])
  strategy.is_a?(Array) && strategy.length == 2 && strategy[0].is_a?(String) && strategy[1].is_a?(String) && strategy[1].length == 1 && (strategy[1].downcase == 'r' || strategy[1].downcase == 's' || strategy[1].downcase == 'p')
end

def is_game?(game = [])
  game.is_a?(Array) && game.length == 2 && is_strategy?(game[0]) && is_strategy?(game[1]) 
end

def rps_tournament_winner(game = [])
  unless is_game?game
    game.each_index do |key|
      game[key] = rps_tournament_winner game[key]
    end
  end
  
  return rps_game_winner game
end
