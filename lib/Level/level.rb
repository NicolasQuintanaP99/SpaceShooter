require_relative 'player_ship'
class Level

  def initialize(window)
    @window = window
    @player_ship = PlayerShip.new
  end

  def draw
    @player_ship.draw
  end

  def button_down(id)
   case id
   when Gosu::KbEscape
     @window.show_main_menu!
   end
  end

  def update
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
