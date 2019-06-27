require 'gosu'
require 'chunky_png'

$width = 640
$height = 480

class Main < (Eaxample rescue Gosu::Window)
  def initialize
    super $width, $height
    self.caption = "ECS"
  end

  def update
    
  end

  def draw

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
