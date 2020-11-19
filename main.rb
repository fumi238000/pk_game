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


# 「ゴールした数」の初期値
  START_GOAL = 0

  # user = User.new
  # com = Com.new
  # judge = Judge.new(user_goal: START_GOAL, com_goal: START_GOAL)
  # player = Player.new


  #初期設定では5回ずつ蹴る  
  FIVE_KICK = 5

  #蹴る回数のカウント
  kick_count = 0


  
  game_controller = GameController.new
  game_controller.pk






#以下の処理をgame_controllerで実行可能にする予定
#<<<<<--------------------start PK-------------------->>>>>
# PK戦開始
   while kick_count < FIVE_KICK
     kick_count += 1
     
     #--------------------USERキック--------------------
    # 何人目のキッカーか表示
    puts <<~TEXT

      "USER 「#{kick_count}人目」のキッカーです"
    
      TEXT
     # エフェクト
    player.kick_effect
   
    # コース一覧の表示
    user.select_list

    # USERのシュートコースの決定
    user.select_kick_course

    # userのシュートコースを取得
    user_select = user.select_kick

    # COMの守るエリアの決定
    com.com_save_area
    
    # COMの守るエリアの取得
    com_select = com.select_save
    
    # 結果の判定
    judge.user_goal_determination(user_select: user_select, com_select: com_select)

 #--------------------COMキック--------------------
    # 何人目のキッカーか表示
    puts <<~TEXT

      "COM 「#{kick_count}人目」のキッカーです"
    
    TEXT
 
    # エフェクト
    player.gk_effect 
      
    # コース一覧の表示
    com.select_list
      
    # USERの守るエリアの決定
    user.user_save_area
    
    # USERの守るエリアの取得
    user_select = user.select_save
    
    # COMのシュートコースの決定
    com.select_kick_course
    
    # userのシュートコースを取得
    com_select = com.select_kick
   
    # 結果の判定
    judge.com_goal_determination(user_select: user_select, com_select: com_select)
  
  end

  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
#<<<<<--------------------finish PK-------------------->>>>>

  # 結果の判断
  judge.judgment



#--------------------未実装--------------------
# game_controller = GameController.new
# game_controller.pk
#--------------------未実装--------------------