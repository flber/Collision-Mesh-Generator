require 'gosu'
require 'chunky_png'

$width = 640
$height = 480

class Main < (Eaxample rescue Gosu::Window)
  def initialize
    super $width, $height
    self.caption = "ECS"
    @midPoint = [0, 0]
    @endPoint = [0, 0]
    @cross_image = Gosu::Image.new("images/cross.png")
    @point_image = Gosu::Image.new("images/point.png")
  end

  def update
    if button_down?(Gosu::MsLeft)
      @midPoint[0] = mouse_x
      @midPoint[1] = mouse_y
    end
    if button_down?(Gosu::MsRight)
      @endPoint[0] = mouse_x
      @endPoint[1] = mouse_y
    end
  end

  def draw
    draw_rect(0, 0, $width, $height, Gosu::Color.argb(0xff_ffffff), 0)
    @point_image.draw(@midPoint[0], @midPoint[1], 1)
    if button_down?(Gosu::MsRight)
      @cross_image.draw(@endPoint[0]-11, @endPoint[1]-5, 1)
      draw_line(@midPoint[0]+3, @midPoint[1]+4, Gosu::Color.argb(0xff_0000ff), @endPoint[0], @endPoint[1]+7, Gosu::Color.argb(0xff_0000ff), 0)
    end
  end

  def needs_cursor?
    true
  end

  def button_down(id)
   if id == Gosu::KB_ESCAPE
     close
   else
     super
   end
  end
end

Main.new.show if __FILE__ == $0
