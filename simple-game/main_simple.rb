require 'gosu'
require './simple-game/player'
require './simple-game/star'
require './simple-game/z_order'

class Tutorial < Gosu::Window
  include ZOrder

  def initialize
    super(640, 480)
    self.caption = 'Simple Game'

    @background_image = Gosu::Image.new('./media/space-gosu.png', tileable: true)

    @player = Player.new
    @player.warp(320, 240)

    @star_animation = Gosu::Image.load_tiles('./media/star.png', 25, 25)
    @stars = []

    @font = Gosu::Font.new(20)
  end

  def update
    @player.turn_left if Gosu.button_down? Gosu::KB_LEFT
    @player.turn_right if Gosu.button_down? Gosu::KB_RIGHT
    @player.accelerate if Gosu.button_down? Gosu::KB_UP
    @player.move
    @player.collect_stars(@stars)

    @stars.push(Star.new(@star_animation)) if rand(100) < 4 && @stars.length < 25
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @player.draw
    @stars.each(&:draw)
    @font.draw_text("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
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
