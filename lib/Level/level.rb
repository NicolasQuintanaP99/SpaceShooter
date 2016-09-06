class Level

  def initialize(window)
    @window = window
  end

  def draw

  end

  def button_down(id)
   case id
   when Gosu::KbEscape
     @window.show_main_menu!
   end
  end
end
