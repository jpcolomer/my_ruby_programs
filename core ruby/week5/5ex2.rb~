=begin
Exercise2. This exercise thanks to Kathy Sierra. Once upon a time in a software shop, two programmers were given the same spec and told to "build it". The Really Annoying Project Manager forced the two coders to compete, by promising that whoever delivers first gets one of those cool Aeron chairs all the Silicon Valley guys have.

The spec. There will be shapes on a GUI, a square, a circle and a triangle. When the user clicks on a shape, the shape will rotate clockwise 360 degrees (ie. all the way around) and play an AIF sound file specific to that particular shape. Go for it guys and show me your code.

Note: This exercise is about inheritance, method overriding and method overloading not about UI.
=end

class Shape

  def initialize (*args)
    if args.length == 1
      @points = args[0]
      @center = [0,0]
      @points.each do |point|
        @center[0] += point[0].to_f/@points.length
        @center[1] += point[1].to_f/@points.length
      end
    elsif args.length == 2
      @center = args[0]
      @radius = args[1]
    end
  end

  def play_aif_file
    puts "play #{@sound}"
  end

  def rotate_point(degrees, point)
    @radians = degrees*Math::PI/180
    @point_rotated = [Math.cos(@radians)*point[0] + Math.sin(@radians)*point[1], -Math.sin(@radians)*point[0] + Math.cos(@radians)*point[1]]
  end

  def rotate(degrees)
    @points_rotated = []
    @points.each do |point|
      @points_rotated << translate_point(rotate_point(degrees, point_relative_to_center(point)))
    end
    return @points_rotated
  end

  def translate_point(point)
    @point_translated = [point[0] + @center[0], point[1] + @center[1]]
  end

  def point_relative_to_center(point)
    @point_rel_to_center = [point[0] - @center[0], point[1] - @center[1]]
  end

  def user_click
    play_aif_file
    (0..360).each do |degree|
      rotate(degree)
    end
  end

end

class Square < Shape
  attr_reader :center, :points
  def initialize(points)
    #points: [[x1,y1],[x2,y2],[x3,y3],[x4,y4]]
    super(points)
    @sound = 'square.aif'
  end
end

class Triangle < Shape
  def initialize(points)
    #points: [[x1,y1],[x2,y2],[x3,y3]]
    super(points)
    @sound = 'triangle.aif'
  end
end

class Circle < Shape
  def initialize (center, radius)
    super(center, radius)
    @sound = 'circle.aif'
  end

  def rotate
    'There is no point rotating a Circle'
  end

  alias user_click play_aif_file

end

sq = Square.new([[-1,-1],[-1,1],[1,1],[1,-1]])
puts sq.rotate(90).inspect

tr = Triangle.new([[-1,-1],[-1,1],[2,0]])
puts tr.rotate(90).inspect

cir = Circle.new([0,0],1)
puts cir.user_click
