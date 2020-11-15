require './player'

class Judge < Player
#--------------初期値--------------------------

  attr_accessor :user_goal, :com_goal
  
  # 5回蹴った合計点を初期値として受け取る
  def initialize(user,com)
    @user_goal = user
    @com_goal = com
  end


#--------------メインの処理--------------------------

def judgment
  #ユーザーの合計得点の表示
  total_goal

  #判定処理

   #合計点が同点の場合
   if  @user_goal == @com_goal
    #サドンデス
    sudden_death
   else
     #勝敗の表示
     result
   end
end


#--------------メソッドの定義--------------------------



# サドンデス
def sudden_death
  #エフェクトの表示
  sudden_death_effect

  #勝ち負けをランダムに決定
  auto_kick
end  


#合計点の表示
def total_goal
  puts <<~TEXT
  ----------------------------------------
  
  ユーザー合計得点  :#{@user_goal}点
  COM合計得点      :#{@com_goal}点
  
  ----------------------------------------
  TEXT
end



#自動で勝敗を決定する
def auto_kick

  puts <<~TEXT
  どれくらいの威力で蹴りますか？
  0~100の間で入力してください
  TEXT

  while true
    @select = gets.chomp.to_i
    
    if 1 <= @select  &&  @select <= 100
      break
    
    else
      puts <<~TEXT
    
            ----------------------------------
                  1~100の中からお選びください
            ----------------------------------
      
          TEXT
    end
  end

    # selectにtrueかfaleseを与える
    if @select.even?
      @select = true
    else
      @select= false
    end
    

    @num  = rand(100)

    # numにtrueかfaleseを与える
    if @num.even?
      @num = true
    else
      @num = false
    end


  # 勝ちルート
  if @num == @select
    puts "ユーザが蹴った！"
    get_goal_effect
    @user_goal +=1

    puts "comが蹴った！"
    save_effect
    result
    
    # 負けルート
  else 
    puts "ユーザが蹴った！"
    save_effect

    puts "comが蹴った！"
    get_goal_effect
    @com_goal +=1
    result

  end
end




# 結果の表示
def result 
  if  @user_goal > @com_goal
    win_effect
  else
    @user_goal < @com_goal
    lose_effect
  end
end



#--------------エフェクト--------------------------
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