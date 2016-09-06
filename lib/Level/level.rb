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
end
