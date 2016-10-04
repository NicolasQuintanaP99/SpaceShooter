require_relative 'player_ship'
class Laser
  attr_accessor :x, :y, :width, :height

  def initialize(x, y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @width = @image.width
    @height = @image.height
    @x = x
    @y = y - @height/2
    @destroy = false
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move! #nombrarlo con ! ya que modifica la pantalla
    @x += 10
  end

  def was_hit?(enemy)
    enemy.any? { |enemy| hit?(enemy) }
  end

  def destroy!
    @destroy = true
  end

  def destroyed?
    @destroy
  end

  def is_out?
    @x > Game::SCREEN_WIDTH
  end

  private

  def hit?(ship)
    laser_right = @x + @image.width
    laser_top = @y
    laser_bottom = @y + @image.height
    ship_left = ship.x
    ship_top = ship.y
    ship_bottom = ship.y + ship.height

    if (laser_top > ship_bottom)
      false
      puts 'a'
    elsif (laser_right < ship_left)
      false
      puts 's'
    elsif (laser_bottom < ship_top)
      false
      puts 'd'
    else
      true
      puts 'f'
    end
  end
end
