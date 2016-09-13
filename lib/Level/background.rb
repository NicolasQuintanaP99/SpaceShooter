require 'gosu'
class Background
SCROLL_SPEED = 10
  def initialize
    @image = Gosu::Image.new('media/images/background/background.jpg')
    @width = @image.width
    @x = 0
  end

  def draw
    @image.draw(@x, 0, 0, 2, 2)
    @image.draw(@x - @width, 0, 0, 2, 2)
  end

  def scroll!
	    @x -= SCROLL_SPEED
	    @x %= @width
	end
end
