require './user'
require './com'
require './player'
require './effect'
require './message_dialog'
require './corse_list'

class GameController
  include Effect
  include MessageDialog
  include CorseList

#--------------------定数--------------------
  #初期設定では5回ずつ蹴る  
  GAME_NUM = 2

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
    # キッカーであることを表示
    user_kicker_message(kick_count)

    # USERのシュートコースの決定
    user.select_kick_course

    # userのシュートコースを取得
    user_select = user.select_kick

    # COMの守るエリアの決定
    com.com_save_corse
    
    # COMの守るエリアの取得
    com_select = com.select_save
    
    # 結果の判定
    judge.user_goal_determination(user_select: user_select, com_select: com_select)

    #--------------------COMキック--------------------
    # GKであることを表示
    com_kicker_message(kick_count)
  
      
    # USERの守るエリアの決定
    user.user_save_course
    
    # USERの守るエリアの取得
    user_select = user.select_save
    
    # COMのシュートコースの決定
    com.select_kick_course
    
    # userのシュートコースを取得
    com_select = com.select_kick

    # 結果の判定
    judge.com_goal_determination(user_select: user_select, com_select: com_select)

    end
    
    finish_pk_message(kick_count)

    #<<<<<--------------------finish PK-------------------->>>>>
    # 結果の判断
    judge.judgment

  end

end