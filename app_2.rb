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

def initiate_user
  puts "What's your firstname ?"
  first_name = gets.chomp
  human = HumanPlayer.new(first_name)
  return human
end

def initiate_enemies
  enemies = []
  bot1 = Player.new("José")
  bot2 = Player.new("Josiane")
  enemies.push(bot1, bot2)
  return enemies
end

def menu(player1, player2)
  puts "---------------------------------"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner \n\n"
  puts "attaquer un joueur en vue :"
  print "0 -" 
  print player1.show_state
  print "1 -" 
  print player2.show_state
  puts "---------------------------------"
end
    
def response(user, player1, player2)
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
    
def bot_attack(user, player1, player2)
  puts "Les autres joueurs t'attaquent !"
  [player1, player2].each do |a|
    if a.life_points > 0
      sleep (3)
    a.attacks(user)
    end
  end
end

def state_perso(user)
  puts "----------------"
  puts " Voici ton état:"
  puts user.show_state
end

def end_of_game(user)
  puts "La partie est finie"
  if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else 
    puts "Loser ! Tu as perdu !"
  end
end

def perform
  welcome
  user = initiate_user
  player1 = initiate_enemies[0]
  player2 = initiate_enemies[1]
  while user.life_points > 0 && (player1.life_points > 0 && player2.life_points > 0) do
    menu(player1, player2)
    response(user, player1, player2)
    state_perso(user)
    bot_attack(user, player1, player2)
  end
  end_of_game(user)
end
perform
# binding.pry
