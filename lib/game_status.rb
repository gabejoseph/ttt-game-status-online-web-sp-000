# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && 
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|pipes| pipes == "X" || pipes == "O"}
end

def draw?(board)
  if won?(board) == nil && full?(board) == true 
    return true
  elsif won?(board) == true 
    return false
  end
end

def over?(board)
  if won?(board) != nil || full?(board) == true 
    return true 
  end
end

def winner(board)
  if draw?(board) == false && won?(board).any? == "X"
    return "X"
  else draw?(board) == true 
    return nil
  end
end