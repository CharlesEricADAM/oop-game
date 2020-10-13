require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# player1 = Player.new("Josiane")
# player2 = Player.new("José")


  while player1.life_points > 0 && player2.life_points > 0  do
    puts " Voici l'état de chaque joueur:"
    print player1.show_state
    puts player2.show_state 

    puts " Passons à la phase d'attaque :"
    print player1.attacks(player2)
    if player1.life_points > 0 && player2.life_points > 0
        break
      else
      puts player2.attacks(player1)
    end
  end
# binding.pry

