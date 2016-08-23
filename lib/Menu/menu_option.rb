class MenuOption
def initialize(text, option_y)
  @image = Gosu::Image.from_text(text, 60, font: Utils.default_font)
  @x = Utils.center_x(@image)
  @y = option_y
end

def draw(selected)
  color = selected ? Utils::TEXT_COLOR : Utils::TEXT_COLOR_LIGHT
  @image.draw(@x, @y, 0, 1, 1, color)
end

end
