require './player'

class User  < Player
#--------------------USERのシュートコースの決定する--------------------
  def select_kick_course
    while true
      # USERが番号を選択する
      select_num = gets.chomp.to_i 

      #コースに応じて対応を決める
      case select_num
      when 1
        @user_select_kick =  RIGHT
        # 番号と方向を都度変更しなければいけないので、ハッシュから取得できるようにしたい
        # puts  CORCE_LIST[:corce][0]みたいに
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

    # 蹴るエフェクト
    user_kick_effect
  
  end
  
  #--------------------USERの守るコースの決定する--------------------
  def user_save_area
    while true
      # USERが番号を選択する
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
    # 守るエフェクト
    user_save_effect
  end
  
  #--------------------USERのシュートコースを変数に格納-----------------
  def select_kick
    user = @user_select_kick
  end
  
  #--------------------USERの守るコースを変数に格納--------------------
  def select_save
    user = @user_select_save
  end 
  

  
  # 何人目かを知らせるエフェクト
  def kicker_num(kick_count)
    puts <<~TEXT

      "USER 「#{kick_count}人目」のキッカーです"

    TEXT
  end





  #<<<<<--------------------privateメソッド-------------------->>>>>
  
  private
  
  # 蹴る時のエフェクト  
  def user_kick_effect
    puts <<~TEXT
    
    -------------------------KICK-----------------------------
    
    User キッカーは[[  #{@user_select_kick}  ]]に蹴った！
    
    -------------------------KICK-----------------------------
    
    TEXT
  end
  
  # 守る時のエフェクト
  def user_save_effect
    puts <<~TEXT
    
    -------------------------SAVE-----------------------------
    
    User GKは[[  #{@user_select_save}  ]]に飛んだ！
    
    -------------------------SAVE----------------------------
    
    TEXT
  end
  
  
  
  
  
  
end
