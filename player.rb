class Player 
  attr_accessor :user_goal, :com_goal
  
  #初期値の設定
  START_GOAL = 0

  def initialize
    @@user_goal = START_GOAL
    @com_goal = START_GOAL 
  end

  def select_list
    # コースデータを格納する
    corce_list =  [
      {number: "1" ,corce: "右"},
      {number: "2" ,corce: "中央"},
      {number: "3" ,corce: "左"},
    ]
  
    # プレイヤーに提示する選択肢の表示 
    corce_list.each {|list|  puts  list[:number] + ":" + list[:corce] }
  end


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

end