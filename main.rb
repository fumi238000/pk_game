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
FIVE_KICK = 5  
    

user = User.new
com = Com.new
  

  
#両チーム５回ずつ蹴る
  kick = 0
   while kick < FIVE_KICK
     kick += 1
     user.kick
     com.kick
   end
  puts "両チーム「#{kick}回」ずつ蹴り終えました!"

 
# 最終結果の表示
  com.judgment
  

