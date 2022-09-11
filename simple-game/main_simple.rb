require 'gosu'
require './simple-game/player'

class Tutorial < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Simple Game'

    @background_image = Gosu::Image.new('./media/space-gosu.png', tileable: true)

    @player = Player.new
    @player.warp(320, 240)
  end

  def update
    @player.turn_left if Gosu.button_down? Gosu::KB_LEFT
    @player.turn_right if Gosu.button_down? Gosu::KB_RIGHT
    @player.accelerate if Gosu.button_down? Gosu::KB_UP
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Tutorial.new.show
