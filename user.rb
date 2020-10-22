require './player'

class User  < Player


  def initialize
    @user_goal = START_GOAL
  end

  def kick
    
    puts <<~EOS

 
    どこにシュートしますか？
    1:左
    2:真ん中
    3:右
    EOS

   #ユーザーのシュートコースの決定
   puts "#{select_shooting_course}"
   
   # キーパーが守るエリアを決める
   puts "#{com_protect_area}"

   #結果の判定
   puts "#{goal_determination}"
  
  end



  private

#---------------------------------
  # シュートコースの決定  
  def select_shooting_course

    user_select_num = gets.chomp.to_i 


    # 1,2,3以外の数字を打ち込んだ場合、ランダムに１、２、３のどれかを返すようにする
    # if user_select_num == 1 2 3
    #    user_select_num = rand(1..3)
    # end

    @select_kick = case user_select_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end
  
  puts "ユーザーキッカーは#{@select_kick}に蹴った！"
  #エフェクトが出るとわかりやすいかもしれない
  end

  #-------------------------------------

  # COMが守るエリアの決定
  def com_protect_area

    com_select_num = rand(1..3)

    @select_save = case com_select_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end

    puts "COM_GKは#{@select_save}へ飛んだ！"
    #エフェクトが出るとわかりやすいかもしれない
  end
  
  #-----------------------------------------

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

      @user_goal += 1
    end
  
    puts <<~EOS

              ユーザー：#{@user_goal}ゴール
    
    EOS
  end

end