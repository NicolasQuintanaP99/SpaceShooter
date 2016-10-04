class EnemyShip
attr_accessor :x, :y, :width, :height
  def initialize(image_path, points, velocity)
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::SCREEN_WIDTH - @image.width
    @y = Random.rand(Game::SCREEN_HEIGHT - @image.height)
    @height = @image.height
    @widht = @image.width
    @destroyed = false
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move!
    @x -= @velocity
  end

  def is_out?
    @x <= 0 - @image.width
  end

  def was_hit?(lasers)
    lasers.any? { |laser| hit?(laser) }
  end

  def destroy!
    @destroyed = true
  end

  def destroyed?
    @destroyed
  end

  private

  def hit?(laser)
    ship_right = @x + @image.width
    ship_top = @y
    ship_bottom = @y + @image.height
    laser_left = laser.x
    laser_top = laser.y
    laser_bottom = laser.y + laser.height

    if (laser_bottom < ship_top)
      false
    elsif (laser_left < ship_right)
      false
    elsif (laser_top > ship_bottom)
      false
    else
      true
    end
  end
end
