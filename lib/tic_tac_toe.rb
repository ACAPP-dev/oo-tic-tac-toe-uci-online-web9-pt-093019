require 'pry'
class TicTacToe
  WIN_COMBINATIONS  = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input_index, token)
    board[input_index] = token
  end

  def position_taken?(input_index)
    board[input_index] != " "
  end

  def valid_move?(input_index)
    input_index.between?(0,8) && !position_taken?(input_index)
  end

  def turn
    puts "Please enter position (1-9):"
    input = gets.strip
    input_to_index_return = input_to_index(input)
    if valid_move?(input_to_index_return)
      move(input_to_index_return, current_player)
      display_board
    else
      puts "Not a valid move."
      turn
    end
  end

  def turn_count
    board.count{|board_element| board_element != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination_array|
      board[combination_array[0]] == board[combination_array[1]] && board[combination_array[1]] == board[combination_array[2]] && board[combination_array[0]] != " "
    end
  end

  def full?
    return true if !board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
      board[won?[0]] if won?
  end

  def play
    until over?
      turn
    end

    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

new_game = TicTacToe.new
new_game.play
