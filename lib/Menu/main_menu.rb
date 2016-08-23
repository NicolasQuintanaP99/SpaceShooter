require_relative 'menu_option'
class MainMenu
OPTIONS_MARGIN_TOP = 200
MARGIN_INTERNAL_Y = 80

  def initialize(window)
    @window = window
    @title = Gosu::Image.from_text("Menu principal", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @options = []
    ["Jugar", "Salir"].each_with_index do |text, index|
      option_y = OPTIONS_MARGIN_TOP + (index * MARGIN_INTERNAL_Y)
      @options << MenuOption.new(text, option_y)
    end
  end

  def draw
    @title.draw(@x,0,0)
    @options.each do |objetos|
      objetos.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      @window.close
    end
  end

end
