require './player'
require './user'
require './com'

class Judge < Player
  

#--------------初期値--------------------------
  attr_accessor :user_goal, :com_goal, :user_select, :com_select
  
  def initialize(**params)
    @user_goal   = params[:user_goal]
    @com_goal    = params[:com_goal]
    @user_select = params[:user_select]
    @com_select  = params[:com_select]    
  end
  
#--------------USERキックの判定--------------------------
  def user_goal_determination(**params)
    
    # USERとCOMの選んだコースを取得する
    select_params(params)
    
    # userとcomの数値を比較
    if @user_select == @com_select   
    
      # セーブした場合の処理
      save_effect
      
    else
      
      # 得点した場合の処理
      get_goal_effect
      @user_goal += 1
      
    end
      # 現在の合計得点を表示
      puts <<~EOS
        USER：#{@user_goal}ゴール
      EOS
    
  end

#--------------COMキックの判定--------------------------
  def com_goal_determination(**params)
    
    # USERとCOMの選んだコースを取得する
    select_params(params)

    # userとcomの数値を比較
    if @com_select== @user_select 
      
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
 #--------------5回蹴り終わった後の勝敗判定--------------------------
  def judgment 
    # USERの合計得点の表示
    total_goal
  
    #合計点が同点の場合
    if  @user_goal == @com_goal
      #サドンデス
      sudden_death
    else
      #勝敗の表示
      result
    end

  end

  #--------------サドンデスのメソッド--------------------------
  # サドンデス
  def sudden_death
    #エフェクトの表示
    sudden_death_effect
    
    
    #勝ち負けをランダムに決定
    auto_kick
  end  
  
  #合計点の表示
  def total_goal
    puts <<~TEXT
    ----------------------------------------
    
      USER  <<< 合計得点 :#{@user_goal}点 >>>

      COM   <<< 合計得点 :#{@com_goal}点 >>>
    
    ----------------------------------------
    TEXT
  end
  
  

  #--------------サドンデスのメソッド--------------------------
  
  #自動で勝敗を決定する
  def auto_kick
    #シュートの威力を決定
    # shooting_power_message
    puts <<~TEXT
    どれくらいの威力で蹴りますか？
    0~100%の間で入力してください
    TEXT

    while true
      # 「シュートの威力」を数値として受け取る
      @select = gets.chomp.to_i


      puts <<~TEXT
      
      --------------------------------------------
      
        "USERは「 #{@select}％ 」の威力で蹴った！"
  
      --------------------------------------------
      
      TEXT

      if 1 <= @select  &&  @select <= 100
        break
      
      else

        # エラー処理
        not_power_message
       
      end
    end

    # selectにtrueかfaleseを与える
    if @select.even?
      @select = true
    else
      @select= false
    end
    

    @num  = rand(100)

    # numにtrueかfaleseを与える
    if @num.even?
      @num = true
    else
      @num = false
    end
     
  
    #USERとCOMが
    if @num == @select
      # 勝ちルート
      puts "ユーザが蹴った！"
      get_goal_effect
      @user_goal +=1

      puts "comが蹴った！"
      save_effect
      result
      
    else

      # 負けルート 
      puts "ユーザが蹴った！"
      save_effect

      puts "comが蹴った！"
      get_goal_effect
      @com_goal +=1
      result

    end
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


  # USERと COMの選んだコースを取得する
  def select_params(**params)
    @user_select = params[:user_select]
    @com_select = params[:com_select]
  end

 end