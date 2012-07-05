$:.unshift(File.expand_path(File.dirname(__FILE__)))
require "jlpt_source"

def pt(h, f)
  f.puts "i(\"" + h[:kanji] + "\", \"" + h[:kana] + "\", \"" + h[:meaning]  + "\", " + h[:jlpt].to_s + ")"
end

def print_header(f)
  f.puts <<EOR
def i(kanji, kana, meaning, jlpt)
  Tango.create(:kanji => kanji, :kana => kana, :meaning => meaning, :jlpt => jlpt)
end

EOR
end

of = File.new(File.join(File.dirname(__FILE__), "../db/seed_jlpt.rb"), "w")

print_header(of)
JLPT.each{|h| pt(h, of)}

of.close
