require './player'
require './user'
require './com'
require './sudden_death'
require './modules/message_dialog'
require './modules/effect'

class Judge
  include Effect
  include MessageDialog

#--------------初期値--------------------------
  attr_accessor :user_goal, :com_goal, :user_select, :com_select
  
  def initialize(**params)
    @user_goal = params[:user_goal]
    @com_goal  = params[:com_goal]
  end
  
#--------------キックの判定--------------------------

# ここにキッカーを入れたい
def goal_determination(kick_num, save_num, kicker)

  save_message(save_num)
  kick_message(kick_num)


  # userとcomの数値を比較
  if kick_num == save_num

    # セーブした場合の処理
    save_effect

   else

    # 得点した場合の処理
    get_goal_effect
    if kicker == "user"? @user_goal += 1 : @com_goal += 1
    end
  end

   # 現在のゴール数の表示
   user_now_goal_message(@user_goal)
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
  
  #--------------最終結果--------------------------
  private

  def result 
    @user_goal > @com_goal ? win_effect : lose_effect
  end

end