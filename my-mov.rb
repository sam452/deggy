require 'tempfile'

LINE_MAX = ARGV[0].to_i
temp_file = Tempfile.new('foo')
line_counter = 0
begin
  File.open("H:/Diggi Reports/data.txt", 'r') do |file|
    file.each_line do |line|
      if line.match /Guard/
	    temp_file.write line
		line_counter += 1
	  end
    end
  end
  temp_file.rewind
  older_files = line_counter - LINE_MAX
#FileUtils.cp(temp_file.path, "H:/Diggi Reports/flash.txt")
File.open("H:/Diggi Reports/flash.txt", "w") do |out_file|
  File.foreach(temp_file).each_with_index { |my_line, i|
    out_file.puts my_line unless i < older_files } #(LINE_MAX - line_counter)
	#end
end
ensure
  temp_file.close
  temp_file.unlink
end 
puts LINE_MAX



#FileUtils.mv(output_file, input_file)