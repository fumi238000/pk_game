require './message_dialog'
require './effect'

class SuddenDeath
  include Effect
  include MessageDialog
#--------------呼び出されるメソッド--------------------------
  
# サドンデス
  def sudden_death(user_goal, com_goal)

    #エフェクトの表示
    sudden_death_effect
      
    #シュートの威力を決定
    decide_shooting_power

    #COMの数値を決定する
    decide_com_num

    ##お互いに奇数もしくは偶数だった場合勝ち、そうでない場合は負けにする
    sudden_death_judge
    
  end

  

  #--------------サドンデスのメソッド--------------------------
  
  #シュートの威力を決定する
  def decide_shooting_power
    #「シュートの威力」の入力を促す
     shooting_power_message
  

    while true
      # 「シュートの威力」を数値として受け取る
      @select = gets.chomp.to_i

     # 入力した「シュートの威力」を表示
      power_kick_message(@select)
      
      # 正しく入力できていれば進み、それ以外は再度入力を促す
      if 1 <= @select  &&  @select <= 100
        break
      
      else

        # エラー処理
        not_power_message
       
      end
    end
  end

    #<<------------------------------------ここをリファクタリングできる------------------------------------------>>
    #メソッドにするのも検討する

    #COMの数値を決定する
    def decide_com_num
      @num  = rand(100)
    end 
  

  #<<------------------------------------------------------------------------------>>
  
  # private
     
    def sudden_death_judge

      #２つの数字の合計を変数に格納
      decide_num =  @select + @num
          
     #合計値が奇数で勝ち、偶数で負け
      if decide_num.odd?
         win
      else 
         lose 
      end
    end
    
    
    def win
      puts "ユーザが蹴った！"
      get_goal_effect
      
      puts "comが蹴った！"
      save_effect
    
      win_effect
      
    end      
    
    
    
    def lose
      puts "ユーザが蹴った！"
      save_effect
      
      puts "comが蹴った！"
      get_goal_effect

      lose_effect
    end 
      

end