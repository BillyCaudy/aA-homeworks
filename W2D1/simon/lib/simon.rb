class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message 
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts @seq
    sleep(3)
    system("clear")
  end

  def require_sequence
    puts "enter colors in sequence separated by spaces: red blue green yellow"
    guess = gets.chomp.split(" ")
    if guess != @seq
        @game_over = true
        return nil
    end
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "this round was a success!"
  end

  def game_over_message
    puts "you failed this round, game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
