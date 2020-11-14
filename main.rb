require './user'
require './com'
require './player'



def initialize
  @USER_GOAL = user_goal
end

puts <<~TEXT
    ----------------------------------
    |                                |
    |           PK GEAM              |
    |                                |
    ----------------------------------
   
    ----------------------------------
    |                                |
    |           KICK OFF!            |
    |                                |
    ----------------------------------
    

  TEXT

#--------------------メソッドの定義--------------------


#--------------------メインの処理--------------------
#５回蹴る  
FIVE_KICK = 1
    
user = User.new
com = Com.new
  
#両チーム、決められた回数蹴る
  kick_count = 0
   while kick_count < FIVE_KICK
     kick_count += 1
     user.user_kick
     com.com_kick
   end

   puts "#{@USER_GOAL}"
  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
   

# 最終結果の表示
  com.judgment
  

