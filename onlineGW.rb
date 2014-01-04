require 'open-uri'
require 'nokogiri'

t = Time.now
current_time = t.strftime("%c")

target = "http://www.shopgoodwill.com/search/SearchKey.asp?itemTitle=&catid=0&sellerID=117&closed=no&minPrice=&maxPrice=&sortBy=itemEndTime&SortOrder=a&showthumbs=on"
doc = Nokogiri::HTML(open(target))

my_text = doc.css('div.mainbluebox h1.whitetext').text

my_numbers = my_text.gsub(/,(?=\d{3}\b)/, '')
my_number = my_numbers.scan(/\d+/)[0]
my_number = my_numbers.scan(/\d+/)[0]
print  "#{current_time + " " + my_number}"

open('myfile.txt', 'a') { |f|
  f.puts "#{current_time + " " + my_number}"
}