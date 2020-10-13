require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome
  puts "------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
  puts "|Le but du jeu est d'être le dernier survivant!|"
  puts "------------------------------------------------"
end


def menu
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner \n\n"
  puts "attaquer un joueur en vue :"
  print "0 -" 
  puts player1.show_state
  print "1 -" 
  puts player2.show_state
end
# menu(player1, player2)
    
def response
  response = gets.chomp
  if response == "a"
    user.search_weapon
  elsif response == "s"
    user.search_health_pack
  elsif response == "O"
    user.attacks(player1)
  elsif response == "1"
    user.attacks(player2)
  end
end
# response(user)
    
def bot_attack
  puts "Les autres joueurs t'attaquent !"
  
end

def state_perso
  puts " Voici ton état:"
  puts "----------------"
  puts user.show_state
end
# state_perso(user)

def end_of_game
  puts "La partie est finie"
  if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else 
    puts "Loser ! Tu as perdu !"
  end
end
# end_of_game

def perform
  welcome
  puts "What's your firstname ?"
  first_name = gets.chomp
  user = HumanPlayer.new(first_name)
  enemies = []
  player1 = Player.new("José")
  player2 = Player.new("Josiane")
  enemies.push(player1, player2)
  while user.life_points > 0 && (player1.life_points > 0 && player2.life_points > 0) do
    menu
    response
    state_perso
  end
  end_of_game
end
perform
# binding.prygfd
