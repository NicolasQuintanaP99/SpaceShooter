require_relative 'player_ship'
class Laser

  def initialize(x, y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @x = x
    @y = y - @image.height/2
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move! #nombrarlo con ! ya que modifica la pantalla
    @x += 10
  end
end
