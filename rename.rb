#
# ファイル名からブランクを削除
#

def ask_yn msg
	while true
		print msg
		response = STDIN.gets
		case response.downcase
		when /y|yes/
			return true
		when /n|no/
			return false
		end
	end	
end

if ARGV.length != 1 then
    puts("usage : rename.rb 検索文字列")
    exit(1)
end 

d_list = Dir.glob("*").select{|x| x.include?(ARGV[0])}

puts "* ファイル名をブランク除去変換 *"
puts "-- 変換前 -------------------------------"
d_list.each{|entry| puts entry}

puts "-- 変換後 -------------------------------"
d_list.each{|entry| puts entry.gsub(/\s+/,'')}
puts "----------------------------------------"

if ask_yn "\nファイル名を変換して良いですか? [y/N]: " then
    d_list.each{|entry| 
        puts entry.gsub(/\s+/,'')
        File.rename(entry,entry.gsub(/\s+/,''))
    }
    puts "\n** 変換を終了しました**"

else
    puts "\n!! 変換を中止しました!!"
end