require './user'
require './com'
require './player'
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

  user = User.new
  com = Com.new

  #５回蹴る  
  FIVE_KICK = 1

  # PK戦開始
  kick_count = 0
   while kick_count < FIVE_KICK
     kick_count += 1
     user.user_kick
     com.com_kick
   end

  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
   
  # 最終結果の表示
  com.judgment
  




#--------------------保留--------------------
# game_controller = GameController.new
# game_controller.pk 