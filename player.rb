class Player 
   attr_accessor :user_goal, :com_goal
  
   #初期値の設定
   START_GOAL = 0

   def initialize
     @user_goal = START_GOAL
     @com_goal = START_GOAL 
   end



   def get_goal_effect
     
     puts <<~TEXT
 
        ----------------------------------
        |                                |
        |         GOOOOOOOOOAL!!!!       |
        |                                |
        ----------------------------------

                 ゴ━━━━(ﾟ∀ﾟ)━━━━ル!!  
              
                

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

            

    TEXT
  end
end