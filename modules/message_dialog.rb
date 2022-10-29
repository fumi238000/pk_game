# frozen_string_literal: true

# 定義
# effect.rbに定義されていな文章を「message_dialog」として定義する

module MessageFormatting
  # MEMO: #51
  # 文字をいい感じに中央寄せするメソッド
  def string_center(padding = ' ')
    width = 100
    output_width = each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.reduce(0, &:+)
    padding_size = [0, width - output_width].max
    padding * (padding_size / 2) + self + padding * (padding_size / 2)
  end
end

#-------------------------------------------------------HANDICAPメッセージ
module MessageDialog
  include MessageFormatting

  def handicap_message
    puts
    puts ''.string_center('-')
    puts 'ゲームを始める前に、ハンデを設定できます。'.string_center(' ')
    puts 'ハンデを設定しますか？'.string_center(' ')
    puts ''.string_center('-')
    puts
  end

  def handicap_num_message(user_hand, com_hand)
    puts
    puts ''.string_center('-')
    puts
    puts 'HANDICAP'.string_center(' ')
    puts
    puts "USER   #{user_hand} GOAL".string_center(' ')
    puts "COM    #{com_hand} GOAL".string_center(' ')
    puts
    puts ''.string_center('-')
    puts
  end

  #-------------------------------------------------------USERのメッセージ
  # USER蹴る時
  def user_kicker_message(kick_count)
    puts
    puts "⚽️ USER 「#{kick_count}人目」のキッカーです ⚽️".string_center(' ')
    puts
    puts
    puts
    puts
    puts ''.string_center('-')
    puts
    puts 'あなたは キッカー です'.string_center(' ')
    puts 'どこにシュートしますか？'.string_center(' ')
    puts
    puts 'お選びください'.string_center(' ')
    puts
    puts ''.string_center('-')
  end

  #--------------------------------------------------COMのメッセージ
  def com_kicker_message(kick_count)
    puts
    puts "⚽️ COM 「#{kick_count}人目」のキッカーです ⚽️ ".string_center(' ')
    puts
    puts
    puts
    puts
    puts ''.string_center('-')
    puts
    puts 'あなたは GK です'.string_center(' ')
    puts 'どこを守りますか？'.string_center(' ')
    puts
    puts 'お選びください'.string_center(' ')
    puts
    puts ''.string_center('-')
  end
  #------------------------------------------------------ 共通のメッセージ

  # 蹴る時のメッセージ
  def kick_message(kick_num)
    puts
    puts ' KICK '.string_center('-')
    puts
    puts "キッカーは[[  #{kick_num[:couse]}  ]]に蹴った！".string_center(' ')
    puts
    puts ' KICK '.string_center('-')
    puts
  end

  # 守る時のメッセージ
  def save_message(save_num)
    puts
    puts ' SAVE '.string_center('-')
    puts
    puts "GKは[[  #{save_num[:couse]}  ]]へ飛んだ！".string_center(' ')
    puts
    puts ' SAVE '.string_center('-')
    puts
  end

  #----------------------------------------------------結果判定のメッセージ
  # 現在の合計点を表示（USER）
  def user_now_goal_message(user_goal)
    puts "USER: #{user_goal}ゴール".string_center(' ')
  end

  # 現在の合計得点を表示（COM)
  def com_now_goal_message(com_goal)
    puts "COM: #{com_goal}ゴール".string_center(' ')
  end

  # PKを既定の回数（５回）蹴り終えた後のメッセージ
  def finish_pk_message(kick_count)
    puts
    puts "両チーム「#{kick_count}回」ずつ蹴り終えました!".string_center(' ')
    puts
  end

  # 合計点の表示
  def total_goal_message(_user_goal, _com_goal)
    puts
    puts ''.string_center('-')
    puts
    puts "USER  <<< 合計得点: #{@user_goal}点 >>>".string_center(' ')
    puts
    puts "COM   <<< 合計得点: #{@com_goal}点 >>>".string_center(' ')
    puts
    puts ''.string_center('-')
    puts
  end

  #----------------------------------------------------サドンデスのメッセージ
  # サドンデス
  def shooting_power_message
    puts
    puts ''.string_center('-')
    puts 'どれくらいの威力で蹴りますか？'.string_center(' ')
    puts ' 0 ~ 100% の間で入力してください'.string_center(' ')
    puts ''.string_center('-')
    puts
    print '数値を入力してください > '
  end

  def power_kick_message(select)
    puts
    puts ''.string_center('-')
    puts "USERは「 #{select}％ 」の威力で蹴った！".string_center(' ')
    puts ''.string_center('-')
    puts
  end

  #----------------------------------------------------再チャレンジ
  def retry_game_message
    puts
    puts ''.string_center('-')
    puts '✨ 再チャレンジ!! ✨'.string_center(' ')
    puts ''.string_center('-')
    puts
  end
  #----------------------------------------------------エラーメッセージ

  def not_power_message
    puts
    puts ''.string_center('-')
    puts '🚫 error: 1~100%の中からお選びください 🚫'.string_center(' ')
    puts ''.string_center('-')
    puts
  end

  # TODO: エラーメッセージの共通化
  def not_select_kick_message
    puts
    puts ''.string_center('-')
    puts '🚫 error: 蹴る方向を入力してください 🚫'.string_center(' ')
    puts ''.string_center('-')
    puts
  end

  def not_select_save_message
    puts
    puts ''.string_center('-')
    puts '🚫 error: 守る方向を入力してください 🚫'.string_center(' ')
    puts ''.string_center('-')
    puts
  end

  def not_handicap_message
    puts
    puts ''.string_center('-')
    puts '🚫 error: 1 or ２を入力してください 🚫'.string_center(' ')
    puts ''.string_center('-')
    puts
  end

  def not_handicap_select_message
    puts
    puts ''.string_center('-')
    puts '🚫 error: 0~3点で入力してください 🚫'.string_center(' ')
    puts ''.string_center('-')
    puts
  end
end

# MEMO: 以前は、ヒアドキュメントで記述していたが、自分で確認しながら調整す流必要があった。

# def handicap_message
#   puts <<~TEXT

#     -------------------------------------
#      ゲームを始める前に、ハンデを設定できます。
#            ハンデを設定しますか？
#     -------------------------------------

#   TEXT
# end
