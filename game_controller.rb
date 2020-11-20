require './user'
require './com'
require './player'
require'./effect'

class GameController
  include Effect

#--------------------定数--------------------
  #初期設定では5回ずつ蹴る  
  FIVE_KICK = 0

  # 「ゴールした数」の初期値
  START_GOAL = 0
  
#--------------------メソッド--------------------
  # PK戦
  def pk
    start_pk_effect

    #インスタンスの生成
    user = User.new
    com = Com.new
    player = Player.new
    judge = Judge.new(user_goal: START_GOAL, com_goal: START_GOAL)
    
    #蹴る回数のカウント
    kick_count = 0

  #<<<<<--------------------start PK-------------------->>>>>
  # PK戦開始
  while kick_count < FIVE_KICK
    kick_count += 1
    
      #--------------------USERキック--------------------
    # 何人目のキッカーか表示
    user.kicker_num(kick_count)

    # キッカーであることを表示
    user.kicker_inform

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
    com.kicker_num(kick_count)
    
    # GKであることを表示
    user.gk_inform
      
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

  end

end