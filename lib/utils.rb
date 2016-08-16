module Utils

  FONT_SIZE_BIG = 90
  def self.default_font
    'media/fonts/kenvector_future_thin.ttf'
  end

  def self.center_x(object)
    (Game::SCREEN_WIDTH / 2) - (object.width / 2)
  end

end
