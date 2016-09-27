class Score
TOP_MARGIN = 10
RIGHT_MARGIN = 120
attr_accessor :points
  def initialize
    @points = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
    @x = Game::SCREEN_WIDTH - RIGHT_MARGIN
  end

  def draw
    @text.draw(@points, @x, TOP_MARGIN, 1)
  end
end
