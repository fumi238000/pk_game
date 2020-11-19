class Player 
#--------------------共通処理--------------------
  attr_accessor :user_goal, :com_goal

  # 方向
  RIGHT = "<<<<<<<<--------右"
  LEFT = "左-------->>>>>>>>"
  CENTER = "<<<----中央---->>>"
  
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

#<<<<<--------------------エフェクト-------------------->>>>>

#--------------------ゴールが決まった時--------------------
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
  
#--------------------セーブされた時--------------------
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
end