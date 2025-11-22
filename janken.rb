# 1. じゃんけんメソッド (janken_turn)

def janken_turn
  puts "じゃんけん..."
  puts "0(グー)、1（チョキ）、2（パー）、3（戦わない）"

  choice = gets.to_i 

  # 1. 【エラーチェック】0〜3以外の場合
  if choice < 0 || choice > 3
    puts "❌ 0〜3から選んでください。"
    return :invalid #戻る
  end

  # 2. 【終了チェック】戦わないが選ばれた場合
  if choice == 3 
    puts "じゃんけんを終了します"
    return :quit # 終了
  end

  hands = ["グー","チョキ","パー"]
  cpu = rand(0..2)

  puts "あなた: #{hands[choice]} vs 相手: #{hands[cpu]}"

  # 3. 【勝敗判定】
  if (choice == 0 && cpu == 1) || (choice == 1 && cpu == 2) || (choice == 2 && cpu == 0)
    return :win
  elsif choice == cpu
    puts "🤝 あいこです！もう一回！"
    return :aiko 
  else
    return :lose
  end
end


# 2. あっち向いてホイメソッド (attimuitehoi)
def attimuitehoi(winner)
  directions = ["上", "下", "左", "右"]
  puts "あっち向いてホイ！！！"
  
  if winner == :win 
    puts "👉 指す方向（0:上 1:下 2:左 3:右）を入力してください" 
  else 
    puts "👤 顔の方向（0:上 1:下 2:左 3:右）を入力してください" 
  end
  
  choice = gets.to_i
  cpu = rand(0..3)

  # 1. 不正入力チェック
  if choice < 0 || choice > 3
    puts "❌ 0〜3から選んでください。"
    return :invalid # やり直し
  end

  puts "あなた: #{directions[choice]}"
  puts "相手:   #{directions[cpu]}"

  # 2. 勝敗判定
  if choice == cpu
    return :decided # 勝敗
  else
    puts "もう一回！じゃんけん！" # 勝負がつかなかった場合、じゃんけんに戻る
  end
end



while true 
  janken_result = janken_turn

  case janken_result
  when :quit
    puts "ゲーム終了！"
    break # while ループを抜ける

  when :invalid, :aiko # 不正またはあいこの場合
    next # じゃんけんからやり直し

  when :win
    # じゃんけんに勝った場合
    attimuitehoi_result = attimuitehoi(:win) 
    
    if attimuitehoi_result == :decided
      puts "🎉 あなたの勝ちでゲーム終了！"
      break 
    elsif attimuitehoi_result == :invalid
      next # じゃんけんからやり直し
    end

    puts "もう一度じゃんけんから！"
    next 

  when :lose
    # 相手がじゃんけんに勝った場合
    attimuitehoi_result = attimuitehoi(:lose)
    
    if attimuitehoi_result == :decided
      puts "残念...相手の勝ちでゲーム終了！"
      break 
    elsif attimuitehoi_result == :invalid
      next #じゃんけんからやり直し
    end
    
    # 勝負がつかなかった場合
    puts "もう一度じゃんけんから！"
    next 

  end #case janken_result閉じる
end #while trueを閉じる