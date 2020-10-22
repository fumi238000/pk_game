require './user'
require './com'
require './player'

class Game_gontroller < Player
  attr_reader :user_goal, :com_goal

  def initialize
    super
  end

  def judgment
    #ユーザーの合計得点
    puts  "ユーザーの合計得点:#{@user_goal}点"
      
    #COMの合計得点
    puts "COMの合計得点:#{@com_goal}点"
      
    if @user_goal > @com_goal
      puts "勝ちました"
    elsif @user_goal == @com_goal
      puts "引き分けです"      
    else
      puts "負けました"
    end
  
  end

end