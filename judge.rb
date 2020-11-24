require './player'
require './user'
require './com'
require './message_dialog'
require './sudden_death'

class Judge < Player
  include MessageDialog

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

    # 現在のゴール数の表示
    user_now_goal_message(@user_goal)
  
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
    
    # 現在のゴール数の表示
    com_now_goal_message(@com_goal)

  end
 #--------------5回蹴り終わった後の勝敗判定--------------------------
  def judgment 
    # USERの合計得点の表示
    total_goal_message(@user_goal, @com_goal)
  
    #合計点が同点の場合
    if  @user_goal == @com_goal
      #サドンデス
      sudden_death = SuddenDeath.new      
      sudden_death.sudden_death(@user_goal, @com_goal)
    else
      #勝敗の表示
      result
    end
  end


  # 結果の表示
  def result 

     #お互いの結果を表示するメソッドを呼び出す

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