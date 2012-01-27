class GameBoard
  def initialize
    @locations = []
  end

  def set_locations_cells(locations)
    @locations = locations
  end

  def check_yourself(guess)
    @number_guess = guess.to_i
    if @locations.include?(@number_guess)
      @locations.delete(@number_guess)
      if @locations.length == 0
        puts 'End'
        return 'kill'
      else
        puts 'Hit'
        return 'Hit'
      end
    else
      puts 'Miss'
      return 'Miss'
    end
  end
end
