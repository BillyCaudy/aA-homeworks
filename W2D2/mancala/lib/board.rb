require_relative 'player.rb'
require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_names = [name1,name2]
    @player1 = Player.new(name1,1)
    @player2 = Player.new(name2,2)
    @cups = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    fourstones = [:stone] * 4
    6.times { @cups << fourstones.dup }
    @cups << [] 
    6.times { @cups << fourstones.dup }
    @cups << [] 
    #p @cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if 0 < start_pos || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    side = @player_names.index(current_player_name)
    current_players_store = 6 + side*7
    other_players_store = 6 + (1-side)*7
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    #debugger
    # p stones #debug
    # p @cups[start_pos] #debug
    pos = start_pos + 1
    while stones > 0
      if pos != other_players_store
        @cups[pos] << :stone 
        stones -= 1
      end
      pos = ( pos + 1 ) % 14 if !(stones == 0)
    end
    self.render
    return next_turn(pos, current_players_store)
  end

  def next_turn(ending_cup_idx, current_players_store)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    
    return :prompt if ending_cup_idx == current_players_store
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1_sum = 0
    side2_sum = 0
    (0..5).each do |idx|
      side1_sum += @cups[idx].length
      side2_sum += @cups[7+idx].length
    end
    return true if side1_sum == 0 || side2_sum == 0
    false
  end

  def winner
    compare_scores = @cups[6] <=> @cups[13]
    return :draw if compare_scores == 0 
    return @player_names[0] if compare_scores == 1
    @player_names[1]
  end
end
