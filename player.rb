require './game_controller'


class Player 

#--------------------共通処理(user.com)--------------------
  attr_accessor :user_goal, :com_goal

  #初期値の設定
  START_GOAL = 0
  RIGHT = "<<<<<<<--------右"
  LEFT = "左--------->>>>>>>"
  CENTER = "<<----中央---->>"

  def initialize
    @@user_goal = START_GOAL
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
    CORCE_LIST.each {|list|  puts  list[:number] + ":" + list[:corce] }
  end

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



  # 勝った時のエフェクト 
  def win_effect
    puts <<~TEXT
  


        ----------------------------------
        |                                |
        |      👑  👑  WINER 👑   👑      |
        |                                |
        ----------------------------------
  
            勝ちました！！！！！！！
            おめでとうございます！
  


    TEXT
    #もう一度やりますか？
  end


   # 負けた時のエフェクト 
   def lose_effect
    puts <<~TEXT
    
  

        ----------------------------------
        |                                |
        |           GAME OVER            |   
        |                                |
        ----------------------------------
                
              あなたは負けました・・・。
  

  
    TEXT
    # もう一度挑戦しますか？
  end

     # サドンデスのエフェクト
     def sudden_death_effect
      puts <<~TEXT
           
        ----------------------------------
        |                                |
        |         SUDDEN DEATH           |   
        |                                |
        ----------------------------------
    
              サドンデスの突入です！！


      TEXT
      
    end
#
#--------------------Userクラス用のメソッド--------------------


#--------------------Comクラス用のメソッド--------------------

end