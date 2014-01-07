require 'open-uri'
require 'nokogiri'

dump = 'H:/Listing Tracker Jan 14/results.txt'

count = 0
target = "http://www.shopgoodwill.com/search/SearchKey.asp?itemTitle=&catid=0&sellerID=117&closed=no&minPrice=&maxPrice=&sortBy=itemEndTime&SortOrder=a&showthumbs=on"
begin
  doc = Nokogiri::HTML(open(target))
rescue Errno::ECONNRESET => e
  count += 1
  retry unless count > 4
  puts "tried 4 times but couldn't connect: #{e}"
end

my_text = doc.css('div.mainbluebox h1.whitetext').text

my_numbers = my_text.gsub(/,(?=\d{3}\b)/, '')
my_number = my_numbers.scan(/\d+/)[0]
my_number = my_numbers.scan(/\d+/)[0]
t = Time.now
current_time = t.strftime("%m/%d/%Y %I:%M %p")
print  "#{current_time + ", " + my_number}"

open(dump, 'a') { |f|
  f.puts "#{current_time + ", " + my_number}"
}