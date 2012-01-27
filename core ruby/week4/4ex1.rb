=begin
Exercise1. Write a class called Dog, that has name as an instance variable and the following methods:

bark(), eat(), chase_cat()
I shall create the Dog object as follows:
d = Dog.new('Leo')
=end

class Dog
  def initialize(name)
    @name =  name
  end
  def bark
    "Ruff! Ruff!"
  end
  def eat
    "#{@name} is eating his food"
  end
  def chase_cat
    "#{@name} is chasing a cat"
  end
end

dog = Dog.new('Leo')
puts dog.bark
puts dog.eat
puts dog.chase_cat
