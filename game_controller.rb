require './user'
require './com'
require './player'
require './effect'
require './message_dialog'

class GameController
  include Effect
  include MessageDialog

#--------------------定数--------------------
  #初期設定では5回ずつ蹴る  
  GAME_NUM = 1

  # ハンデの初期値
  HANDICAP = 0
#--------------------メソッド--------------------
  # PK戦
  def pk
    start_pk_effect

    #インスタンスの生成
    user = User.new
    com = Com.new
    judge = Judge.new(user_goal: 0, com_goal: 0)
    
    # プレイヤー側がハンデありの場合 
    # judge = Judge.new(user_goal: HANDICAP, com_goal: 0)
    
    #蹴る回数のカウント
    kick_count = 0

  #<<<<<--------------------start PK-------------------->>>>>
  # PK戦開始
  while kick_count < GAME_NUM
    kick_count += 1

    #--------------------USERキック--------------------
    # USERのシュートコースの決定
    kick_num = user.select_kick_course(kick_count)
     
    # COMの守るエリアの決定
    save_num = com.com_save_course  
    
    # 結果の判定
    judge.user_goal_determination(kick_num, save_num)

    #--------------------COMキック-------------------- 
    # USERの守るエリアの決定
    save_num = user.user_save_course(kick_count)
        
    # COMのシュートコースの決定
    kick_num = com.select_kick_course
    
    # 結果の判定
    judge.com_goal_determination(kick_num, save_num)

  end
    
    finish_pk_message(kick_count)

    
    #<<<<<--------------------finish PK-------------------->>>>>
    
    # 結果の判断
    judge.judgment

  end

end