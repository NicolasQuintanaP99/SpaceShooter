require_relative 'player_ship'
require_relative 'life_counter'
require_relative 'score'
require_relative 'enemy_ship'
class Level

  def initialize(window, enemy_ship_definitions)
    @window = window
    @player_ship = PlayerShip.new
    @lasers = []
    @score = Score.new
    @life_counter = LifeCounter.new
    @enemy_ships = []
    @enemy_ship_definitions = enemy_ship_definitions
  end

  def draw
    @player_ship.draw
    @score.draw
    unless @lasers.empty? #a no ser que el array lasers este vacio
      @lasers.each do |laser| #utilizar singulares dentro del each
        laser.draw
      end
    end
    @life_counter.draw
    unless @enemy_ships.empty?
      @enemy_ships.each do |enemy|
        enemy.draw
      end
    end
  end

  def button_down(id)
   case id
   when Gosu::KbEscape
     @window.show_main_menu!
   when Gosu::KbSpace
      laser = @player_ship.shoot
      @lasers << laser
   end
  end

  def update
    unless @lasers.empty?
      @lasers.each do |laser|
        laser.move!
      end
      @lasers.reject! { |laser| laser.is_out? }
    end
    if @window.button_down?(Gosu::KbW )
      @player_ship.move_up!
    elsif @window.button_down?(Gosu::KbS)
      @player_ship.move_down!
    elsif @window.button_down?(Gosu::KbDown)
      @player_ship.move_down!
    elsif @window.button_down?(Gosu::KbUp)
      @player_ship.move_up!
    end
    unless @enemy_ships.empty?
      @enemy_ships.each do |enemy|
        enemy.move!
      end
    end
    create_enemy_ship
  end

  def create_enemy_ship
    current_time = Gosu::milliseconds
    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time
      info = @enemy_ship_definitions.sample
      @enemy_ships << EnemyShip.new(info[:image_path], info [:points], info[:velocity])
    end
  end

  def time_between_enemy_ships
    case @score.points
    when 0..1000
      3000
    when 1000..2000
      2000
    else
      1000
    end
  end
end
