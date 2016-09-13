require_relative 'player_ship'
require_relative 'background'
class Level

  def initialize(window)
    @window = window
    @player_ship = PlayerShip.new
    @background = Background.new
    @lasers = []
  end

  def draw
    @player_ship.draw
    @background.draw
    unless @lasers.nil? #a no ser que el array lasers este vacio
      @lasers.each do |laser| #utilizar singulares dentro del each
        laser.draw
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
    @background.scroll!
    unless @lasers.nil?
      @lasers.each do |laser|
        laser.move!
      end
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
  end

end
