class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game = [])
  raise WrongNumberOfPlayersError unless game.length == 2

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
