require './player'

class User  < Player

  def kick
    puts <<~EOS

 
    どこにシュートしますか？
    1:左
    2:真ん中
    3:右
    EOS

   #ユーザーのシュートコースの決定
   select_shooting_course
   
   # キーパーが守るエリアを決める
   com_save_area

   #結果の判定
   goal_determination
  end


  private

  
  # シュートコースの決定  
  def select_shooting_course

    user_select_num = gets.chomp.to_i 

    @select_kick = case user_select_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end
  
    puts "キッカーは#{@select_kick}に蹴った！"
  end


  # COMが守るエリアの決定
  def com_save_area

    com_select_num = rand(1..3)

    @select_save = case com_select_num
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

      @@user_goal += 1
    end
  
    puts <<~EOS
      ユーザー：#{@@user_goal}ゴール





    EOS
  end


  
end