require 'rubygems'
require 'gosu'

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end
end

DemoWindow.new.show
