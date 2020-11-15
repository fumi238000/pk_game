require './player'

class User  < Player
#--------------------メインの処理--------------------

  def user_kick
    puts "どこにシュートしますか？" 

    # コース一覧の表示
    select_list

    #USERのシュートコースの決定
    select_shooting_course

    # COMの守るエリアの決定
    com_save_area

    #結果の判定
    goal_determination

 
  end


#--------------------メソッドの定義--------------------
  #userの合計得点の表示
  def total_goal
    user = @user_goal
  end

  # USERのシュートコースの決定  
  def select_shooting_course
    while true
      # ユーザーが番号を選択する
      select_num = gets.chomp.to_i 

      #コースに応じて対応を決める
      case select_num
      when 1
        @user_select_kick =  RIGHT
        # 番号と方向を都度変更しなければいけないので、ハッシュから取得できるようにしたい
        # puts  CORCE_LIST[:corce][0]に変更した
        break

      when 2
        @user_select_kick =  CENTER
        break

      when 3
        @user_select_kick =  LEFT
        break
      else
        puts <<~text
        ----------------------------------
        error ： 蹴る方向を入力してください
        ----------------------------------
        text
      end
    end
    puts "User キッカーは[[  #{@user_select_kick}  ]]に蹴った！"
  end


  # COMが守るエリアの決定
  def com_save_area

    rand_num = rand(1..3)

    case rand_num
    when 1
      @com_select_save = RIGHT
    when 2
      @com_select_save = CENTER
    when 3 
      @com_select_save = LEFT
    end

    # キックした方向を表示
    puts "Com GKは[[  #{@com_select_save}  ]]へ飛んだ！"
    
  end
  
  
  # ゴール判定
  def goal_determination
    # userとcomの数値を比較
    if @user_select_kick == @com_select_save   
      # セーブした場合の処理
      save_effect
    
    else
      
      # 得点した場合の処理
      get_goal_effect
      @user_goal += 1
    end

    # 現在の合計得点を表示
    puts <<~EOS
      ユーザー：#{@user_goal}ゴール
    EOS
  end
end