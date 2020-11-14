require './player'

class User  < Player

  def kick
    puts "どこにシュートしますか？" 
    # コース一覧の表示
    select_list

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
      #コースに応じて対応を決める
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
    # userとcomの数値を比較
    if @user_select_kick == @com_select_save 
      
      # セーブした場合の処理
      puts <<~TEXT
         #{save_effect}
       TEXT  
    else

      # 得点した場合の処理
      puts <<~TEXT
        #{get_goal_effect}
      TEXT
      @@user_goal += 1
    end

    # 現在の合計得点を表示
    puts <<~EOS
      ユーザー：#{@@user_goal}ゴール
    EOS
  end
end