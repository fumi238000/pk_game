require './player'

class User  < Player

  def kick
      # 要修正
      # ユーザーの#{kickcount}人目のキッカーです

    puts <<~EOS
    
    ---------------------------------

    ---------------------------------
 
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

    while true
      #ユーザーが「１・２・３」を選択し、蹴る方向を決定
      select_num = gets.chomp.to_i 

      @user_select_kick = case select_num
      when 1
        "「 左 」"
        break
      when 2
        "「 中央 」"
        break
      when 3
        "「 右 」"
        break
      else
        puts <<~text
        ----------------------------------
        error ： 蹴る方向を入力してください
        ----------------------------------
        text
      end
    end
      puts "キッカーは#{@user_select_kick}に蹴った！"
  end


  # COMが守るエリアの決定
  def com_save_area

    rand_num = rand(1..3)

    @com_select_save = case rand_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end

    puts "GKは#{@com_select_save}へ飛んだ！"
  end
  
  
  # ゴール判定
  def goal_determination
    if @user_select_kick == @com_select_save 
      
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