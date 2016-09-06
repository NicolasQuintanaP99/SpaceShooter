class PlayerShip

  def initialize
    @image = Gosu::Image.new('media/images/player/ship.png')
  end

  def draw
    @image.draw(0, 0, 1)
  end
end
