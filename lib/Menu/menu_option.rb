class MenuOption
def initialize(text, option_y)
  @image = Gosu::Image.from_text(text, 60, font: Utils.default_font)
  @x = Utils.center_x(@image)
  @y = option_y
end

def draw
  @image.draw(@x, @y, 0, 1, 1, Utils::TEXT_COLOR_LIGHT)
end

end
