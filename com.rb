require './player'
require './user'


class Com < User

  def kick
    puts <<~EOS


    どこを守りますか？
    1:左
    2:真ん中
    3:右
    EOS
  
    #キーパーが守るエリアを決める
    user_save_area
  
    #COMのシュートコースの決定
    select_shooting_course

    #結果の判定
    goal_determination
  end  


  def judgment
    #ユーザーの合計得点
    puts <<~EOS
    ユーザーの合計得点:#{@@user_goal}点
    COMの合計得点:#{@com_goal}点
    EOS



    if @@user_goal > @com_goal
      puts "勝ちました!!!!!!!!!!!!!!!!!!!!"
    elsif @@user_goal == @com_goal
      puts "引き分けですネ。" 
    else
      puts "負けました...膝から崩れ落ちた・・・"
    end
  end
  
  
  
  private
   
  
  # COMのシュートコースの決定  
  def select_shooting_course

    com_select_num = rand(1..3)
    
    @select_kick = case com_select_num
    when 1
      "「 左 」"
     when 2
       "「 中央 」"
     when 3
       "「 右 」"
     end

    puts  "キッカーは#{@select_kick}に蹴った！"
  end
  
  
  # Userが守るエリアの決定
  def user_save_area
   
    user_select_num = gets.chomp.to_i 

    @select_save = case user_select_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end
  
    puts "GKは#{@select_save}へ飛んだ！"
  end
  
  
  # ゴール判定
  def goal_determination
    if @select_kick == @select_save 
   
      puts <<~TEXT
      #{save_effect}
      TEXT
      
      else

      puts <<~TEXT
      #{get_goal_effect}
      TEXT
   
      @com_goal += 1
    
    end
   
    puts <<~EOS
      COM：#{@com_goal}ゴール





    EOS
  end




end