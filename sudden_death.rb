class SuddenDeath

#--------------サドンデスのメソッド--------------------------
  # サドンデス
  def sudden_death
    #エフェクトの表示
    sudden_death_effect
      
    #勝ち負けをランダムに決定
    auto_kick
  end  
  
  #--------------サドンデスのメソッド--------------------------
  
  #自動で勝敗を決定する
  def auto_kick
    #シュートの威力を決定
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
     
  
    #USERとCOMが
    if @num == @select
      # 勝ちルート
      puts "ユーザが蹴った！"
      get_goal_effect
      @user_goal +=1

      puts "comが蹴った！"
      save_effect
      result
      
    else

      # 負けルート 
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


  # USERと COMの選んだコースを取得する
  def select_params(**params)
    @user_select = params[:user_select]
    @com_select = params[:com_select]
  end


end