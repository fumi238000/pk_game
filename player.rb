class Player 
   attr_reader :@user_goal, :com_goal


   def initialize
    @user_goal = @user_goal
   end

  START_GOAL = 0

  def get_goal_effect
    puts <<~TEXT
 
        ----------------------------------
        |                                |
        |         GOOOOOOOOOAL!!!!       |
        |                                |
        ----------------------------------

                 ゴ━━━━(ﾟ∀ﾟ)━━━━ル!!  
                 #{ @user_goal}

    TEXT
  end
  

  def save_effect
    puts <<~TEXT
 
        ----------------------------------
        |                                |
        |     ××××  NO GOAL  ××××××      |
        |                                |
        ----------------------------------
  
                 ファインセーブ！！

                 #{ @user_goal}

    TEXT
  end
end