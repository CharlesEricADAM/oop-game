
class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points=10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts " #{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    # puts " José a perdu #{damage} points de vie"
    if @life_points == 0
      puts " #{@name} a été tué !"
    end
  end

  def attacks(target_player)
    puts "#{@name} attaque #{target_player.name}"
    damage = compute_damage
    target_player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player 
  attr_accessor  :weapon_level, :life_points

  def initialize(name)
    @weapon_level = 1
    @life_points = 100
    @name = name
  end

  def show_state
    puts " #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    # top_life_points == 100
    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack > 1 || health_pack < 6
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
    else health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
    end
    if @life_points > 100
      @life_points = 100
      puts "100 max"
      return @life_points = 100
    end
    
  end
end 
# binding.pry

