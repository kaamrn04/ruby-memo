require "csv"
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i 

if memo_type==1
  puts "拡張子を除いたファイルを入力してください"
  file_name=gets.chomp
  puts "メモしたい内容を記入してください"
  puts "完了したらctrl+Dを押します"
  input_memo = STDIN.readlines

CSV.open("#{file_name}.csv", "w") do |csv|
  input_memo.each do |line|
  csv << [line.chomp]
  end
end

puts "保存しました"

elsif memo_type==2
  puts "編集するファイルを入力してください（拡張子を除く）"
  file_name=gets.chomp
 
if File.exist?("#{file_name}.csv")
  puts "現在の内容："
  puts CSV.read("#{file_name}.csv")

  puts "追記する内容を入力してください。"
  puts "入力終了は Ctrl + D。"
  input_memo = STDIN.readlines

CSV.open("#{file_name}.csv", "a") do |csv|
  input_memo.each do |line|
  csv << [line.chomp]
  end
end

puts "追記しました！"

else
  puts "そのファイルは存在しません。"
end

else
  puts "不正な値です。1か2を入力してください。"
end
