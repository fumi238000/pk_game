require './user'
require './com'
require './player'
require './judge'
require './game_controller'


#--------------------メインの処理--------------------
    

# 開始のエフェクト
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




#--------------------試し--------------------
 game_controller = GameController.new
 game_controller.pk


  user = User.new
  com = Com.new
  

  #５回蹴る  
  FIVE_KICK = 5

  # PK戦開始
  kick_count = 0
   while kick_count < FIVE_KICK
     kick_count += 1
     user.user_kick
     com.com_kick
   end

  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
  
  # 5回蹴った合計点を取得
  user = user.total_goal
  com = com.total_goal

  #5回蹴った合計点を渡す
  judge = Judge.new(user,com)

  # 結果の判断
  judge.judgment
  




