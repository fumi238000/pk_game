require './player'

class User  < Player
#--------------------メインの処理--------------------

  # def user_kick
  #   #userが蹴る
  #   kick_effect
   
  #   # コース一覧の表示
  #   select_list

  #   #USERのシュートコースの決定
  #   select_shooting_course

  #   # COMの守るエリアの決定
  #   # com_save_area

  #   #結果の判定
  #   # goal_determination

 
  # end


  #--------------------メソッドの定義--------------------
  # ①USERのシュートコースの決定する
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


  # ②USERの守るエリアの決定する
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
    puts "User GKは[[  #{@user_select_save}  ]]に飛んだ！"
  end


  # ③ゴール判定
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


  # ④userの合計得点の表示
  def total_goal
    user = @user_goal
  end

end