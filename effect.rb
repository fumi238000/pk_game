module Effect

  def start_pk_effect
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
  end

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

      ここからは時間がないので、巻いていきます
          次のキッカーは準備してください
          
  


  TEXT
 
end



  
end