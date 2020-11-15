require './player'

class Judge < Player
#--------------初期値--------------------------

  attr_accessor :user_goal, :com_goal
  
  # 5回蹴った合計点を初期値として受け取る
  def initialize(user,com)
    @user_goal = user
    @com_goal = com
  end


#--------------メインの処理--------------------------

def judgment
  #ユーザーの合計得点の表示
  total_goal

  #判定処理

   #合計点が同点の場合
   if  @user_goal == @com_goal
    #サドンデス
    sudden_death
   else
     #勝敗の表示
     result
   end
end


#--------------メソッドの定義--------------------------
private


# サドンデス
def sudden_death
  #エフェクトの表示
  sudden_death_effect

  while true 
    # ②同点の場合
      if  @user_goal == @com_goal
        user_kick
        com_kick
        #ここでuser.comのメソッドを呼び出せるようにしたい！
        #現状は、privateに同じメソッドを定義している

        puts  <<~TEXT

        同点です！次のキッカーは準備してください
        ユーザーが蹴った！
        comが蹴った！
        どうなった！?

        TEXT
        #とりあえずユーザを勝たせる
        @user_goal +=1

      else
        
        #結果の表示
        result
        break
      end
   end  
end


#合計点の表示
def total_goal
  puts <<~EOS
  ----------------------------------------
  
  ユーザー合計得点  :#{@user_goal}点
  COM合計得点      :#{@com_goal}点
  
  ----------------------------------------
  EOS
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



 



#--------------エフェクト--------------------------
# 勝った時のエフェクト 
def win_effect
  puts <<~TEXT



      ----------------------------------
      |                                |
      |      👑  👑  WINER 👑   👑      |
      |                                |
      ----------------------------------

          勝ちました！！！！！！！
          おめでとうございます！



  TEXT
  #もう一度やりますか？
end


 # 負けた時のエフェクト 
 def lose_effect
  puts <<~TEXT
  


      ----------------------------------
      |                                |
      |           GAME OVER            |   
      |                                |
      ----------------------------------
              
            あなたは負けました・・・。



  TEXT
  # もう一度挑戦しますか？
end

   # サドンデスのエフェクト
   def sudden_death_effect
    puts <<~TEXT
         
      ----------------------------------
      |                                |
      |         SUDDEN DEATH           |   
      |                                |
      ----------------------------------
  
            サドンデスの突入です！！


    TEXT
    
  end




#--------------以下切り離し予定--------------------------


#--------------------userメインの処理--------------------

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



#--------------------comメインの処理--------------------

def com_kick
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

#--------------userのメソッド--------------------------

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




#--------------comのメソッド--------------------------

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
    puts "Com キッカーは[[  #{@com_select_kick}  ]]に蹴った！"

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
    puts "User GKは[[  #{@user_select_save}  ]]に飛んだ！"
  end


# ゴール判定
  def goal_determination
  # userとcomの数値を比較
  if @com_select_kick == @user_select_save 
    
    # セーブした場合の処理
    save_effect
    
  else
    
    # 得点した場合の処理
    get_goal_effect
    @com_goal += 1
    
  end
  
    # 現在の合計得点を表示
    puts <<~EOS
      COM：#{@com_goal}ゴール
    EOS
  end

end