# frozen_string_literal: true

require './modules/message_dialog'
require './modules/effect'

class SuddenDeath
  include Effect
  include MessageDialog
  #--------------呼び出されるメソッド--------------------------
  # サドンデス
  def sudden_death(_user_goal, _com_goal)
    # エフェクトの表示
    sudden_death_effect

    # ユーザーの「シュートの威力」を決定
    decide_shooting_power

    # 勝敗の判断
    sudden_death_judge
  end

  private

  #--------------ユーザーの「シュートの威力」を決定--------------------------
  def decide_shooting_power
    # 「シュートの威力」の入力を促す
    shooting_power_message

    loop do
      # 「シュートの威力」を数値として受け取る
      @select = gets.chomp.to_i

      # 正しく入力できていれば進み、それ以外は再度入力を促す
      if @select >= 1 && @select <= 100

        # 入力した「シュートの威力」を表示
        power_kick_message(@select)
        break

      else

        # エラー処理
        not_power_message

      end
    end
  end

  #--------------勝敗の判断--------------------------
  def sudden_death_judge
    # 「ユーザーが入力した数字」＋ 「ランダムの数値」 の合計を変数に格納
    decide_num = @select + rand(100)

    # 合計値が奇数で勝ち、偶数で負け
    decide_num.odd? ? win : lose
  end

  #--------------勝ち負け--------------------------
  # 勝ち
  def win
    puts 'ユーザが蹴った！'
    get_goal_effect

    puts 'comが蹴った！'
    save_effect

    win_effect
  end

  # 負け
  def lose
    puts 'ユーザが蹴った！'
    save_effect

    puts 'comが蹴った！'
    get_goal_effect

    lose_effect
  end
end
