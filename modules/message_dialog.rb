# frozen_string_literal: true

# 定義
# effect.rbに定義されていな文章を「message_dialog」として定義する

module MessageDialog
  #-------------------------------------------------------HANDICAPメッセージ
  def handicap_message
    puts <<~TEXT


      -------------------------------------
       ゲームを始める前に、ハンデを設定できます。
             ハンデを設定しますか？
      -------------------------------------


    TEXT
  end

  def handicap_num_message(user_hand, com_hand)
    puts <<~TEXT

       -----------------------------

                 HANDICAP

          USER   #{user_hand}GOAL
          COM    #{com_hand}GOAL

      ------------------------------

    TEXT
  end

  #-------------------------------------------------------USERのメッセージ
  # USER蹴る時
  def user_kicker_message(kick_count)
    puts <<~TEXT

      USER 「#{kick_count}人目」のキッカーです

    TEXT

    puts <<~TEXT



      ----------------------------------
             あなたはキッカーです
             どこにシュートしますか？

                 お選びください
      ----------------------------------

    TEXT
  end

  #--------------------------------------------------COMのメッセージ
  def com_kicker_message(kick_count)
    puts <<~TEXT

      COM 「#{kick_count}人目」のキッカーです

    TEXT

    puts <<~TEXT



      ----------------------------------
               あなたは GK です
               どこを守りますか？

                 お選びください
      ----------------------------------

    TEXT
  end
  #------------------------------------------------------ 共通のメッセージ

  # 蹴る時のメッセージ
  def kick_message(kick_num)
    puts <<~TEXT

      -------------------------KICK-----------------------------

             キッカーは[[  #{kick_num[:couse]}  ]]に蹴った！

      -------------------------KICK-----------------------------

    TEXT
  end

  # 守る時のメッセージ
  def save_message(save_num)
    puts <<~TEXT

      -------------------------SAVE-----------------------------

               GKは[[  #{save_num[:couse]}  ]]へ飛んだ！

      -------------------------SAVE-----------------------------

    TEXT
  end

  #----------------------------------------------------結果判定のメッセージ
  # 現在の合計点を表示（USER）
  def user_now_goal_message(user_goal)
    puts <<~TEXT
      USER：#{user_goal}ゴール
    TEXT
  end

  # 現在の合計得点を表示（COM)
  def com_now_goal_message(com_goal)
    puts <<~TEXT
      COM：#{com_goal}ゴール
    TEXT
  end

  # PKを既定の回数（５回）蹴り終えた後のメッセージ
  def finish_pk_message(kick_count)
    puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
  end

  # 合計点の表示
  def total_goal_message(_user_goal, _com_goal)
    puts <<~TEXT
      ------------------------------------------

         USER  <<< 合計得点 :#{@user_goal}点 >>>

         COM   <<< 合計得点 :#{@com_goal}点 >>>

      ------------------------------------------
    TEXT
  end

  #----------------------------------------------------サドンデスのメッセージ
  # サドンデス
  def shooting_power_message
    puts <<~TEXT
      どれくらいの威力で蹴りますか？
      0~100%の間で入力してください
    TEXT

    print '数値を入力してください > '
  end

  def power_kick_message(select)
    puts <<~TEXT

      --------------------------------------------

           USERは「 #{select}％ 」の威力で蹴った！

      --------------------------------------------

    TEXT
  end

  #----------------------------------------------------再チャレンジ
  def retry_game_message
    puts <<~TEXT




      ----------------------
          再チャレンジ
      ----------------------

    TEXT
  end
  #----------------------------------------------------エラーメッセージ

  def not_power_message
    puts <<~TEXT

      --------------------------------------
         error: 1~100%の中からお選びください
      --------------------------------------

    TEXT
  end

  # 以下を統一できないか？
  def not_select_kick_message
    puts <<~TEXT

      --------------------------------------
          error ： 蹴る方向を入力してください
      --------------------------------------

    TEXT
  end

  def not_select_save_message
    puts <<~TEXT

      --------------------------------------
           error ： 守る方向を入力してください
      --------------------------------------

    TEXT
  end

  def not_handicap_message
    puts <<~TEXT

      --------------------------------------
           error ： 1 or ２を入力してください
      --------------------------------------

    TEXT
  end

  def not_handicap_select_message
    puts <<~TEXT

      --------------------------------------
           error ： 0~3点で入力してください
      --------------------------------------

    TEXT
  end
end
