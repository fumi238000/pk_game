require './game_controller'


class Player < GameController

#--------------------共通処理(user.com)--------------------
  attr_accessor :user_goal, :com_goal

  #初期値の設定
  START_GOAL = 0
  RIGHT = "<<<<<<<<--------右"
  LEFT = "左-------->>>>>>>>"
  CENTER = "<<<----中央---->>>"

  def initialize
    @user_goal = START_GOAL
    @com_goal = START_GOAL 
  end

  # コースリスト
  CORCE_LIST = [
    {number: "1" ,corce: RIGHT},
    {number: "2" ,corce: CENTER},
    {number: "3" ,corce: LEFT},
  ]

  # プレイヤーに提示する選択肢の表示   
  def select_list
    CORCE_LIST.each {|list|  puts  list[:number] + ":  [" + list[:corce] + "]"}
  end


#--------------------メソッド--------------------








#--------------------エフェクト--------------------

  # ゴールが決まった時のエフェクト 
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
  
  # ゴールが止められた時のエフェクト 
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

    # キッカーの場合のエフェクト 
    def kick_effect
      puts <<~TEXT
  
  

          ----------------------------------
                  あなたはキッカーです
                どこにシュートしますか？
         
                    お選びください
          ----------------------------------
                
      TEXT
    end

    # GKの場合のエフェクト 
    def gk_effect
      puts <<~TEXT
  
  

          ----------------------------------
                  あなたは GK です
                  どこを守りますか？
        
                    お選びください
          ----------------------------------
                
      TEXT
    end
end