require './user'
require './com'
require './player'


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

 
#５回蹴る  
FIVE_KICK = 0
    
user = User.new
com = Com.new
  
#両チーム、決められた回数蹴る
  kick_count = 0
   while kick_count < FIVE_KICK
     kick_count += 1
     user.kick
     com.kick
   end
  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
   
# 最終結果の表示
  com.judgment
  

