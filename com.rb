require './player'
require './user'

class Com < User
  #--------------------メインの処理--------------------
  
  def kick
    puts "どこを守りますか？"   
    
    # コース一覧の表示
    select_list
    
    #USERの守るエリアの決定
    user_save_area
    
    #COMのシュートコースの決定
    select_shooting_course
    
    #結果の判定
    goal_determination
  end  
  
  #--------------------メソッドの定義--------------------
  # COMのシュートコースの決定  
  def select_shooting_course
    rand_num = rand(1..3)
    
    case rand_num
    when 1
      @com_select_kick = RIGHT
     when 2
      @com_select_kick = CENTER
     when 3
      @com_select_kick = LEFT
     end

    # キックした方向を表示
    puts "GKは[[  #{@com_select_kick}  ]]に蹴った！"
  
  end
  
  
  # USERが守るエリアの決定
  def user_save_area
    while true
      # ユーザーが番号を選択する
      select_num = gets.chomp.to_i 
      
      #コースに応じて対応
      case select_num
        when 1
          @user_select_save = RIGHT
          break
        when 2
          @user_select_save =  CENTER
          break
        when 3
          @user_select_save = LEFT
          break
        else
          puts <<~text
          ----------------------------------
          error ： 守る方向を入力してください
          ----------------------------------
          text
        end 
      end
    puts "GKは[[  #{@user_select_save}  ]]に飛んだ！"
  end


# ゴール判定
def goal_determination
  # userとcomの数値を比較
  if @com_select_kick == @user_select_save 
    
    # セーブした場合の処理
    puts <<~TEXT
    #{save_effect}
    TEXT
    
  else
    
    # 得点した場合の処理
    puts <<~TEXT
    #{get_goal_effect}
    TEXT
    
    @com_goal += 1
    
  end
   
    # 現在の合計得点を表示
    puts <<~EOS
      COM：#{@com_goal}ゴール
    EOS
  end


  #ここの部分を別ファイルで定義したい
  def judgment
    #ユーザーの合計得点
    puts <<~EOS
      ユーザーの合計得点:#{@@user_goal}点
      COMの合計得点:#{@com_goal}点
    EOS
      
    if  @@user_goal == @com_goal
      # サドンデスに突入！
      puts "サドンデスです"
      sudden_death
    else  
      results
    end
  end
  
  #結果の表示
  def results 
    if  @@user_goal > @com_goal
      puts "勝ちました!!!!!!!!!!!!!!!!!!!!"
    else
      @@user_goal < @com_goal
      puts "負けました...膝から崩れ落ちた・・・"
    end
   end





    #  # サドンデスの場合
    # def sudden_death
    #   while true 
    #     user.kick
    #     com.kick
     
    #  # 結果の判定
    #  if  @@user_goal == @com_goal
    #    puts "同点です！次のキッカーは準備してください"
    #  else
    #    break
    #  end
    # end
  end


end
