require 'rubygems'
require 'gosu'

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
    self.caption = 'Gosu Demo Window'
  end

  def draw
    x = 300
    y = 200
    size = 100
    # draw_quad(x - size, y - size, 0xffff8888, x + size, y - size, 0xffffffff, x - size, y + size, 0xffffffff, x + size, y + size, 0xffffffff)
    # draw_triangle(x - size, y - size, 0xff00ff00, x + size, y - size, 0xff00ff00, x + size, y + size, 0xff00ff00)
    draw_line(x - size, y - size, 0xff00ffff, x + size, y - size, 0xff00ffff)
  end
end

DemoWindow.new.show
