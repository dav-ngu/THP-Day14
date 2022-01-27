require 'nokogiri'
require 'open-uri'

def method
tab_1 =[]
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
crypto = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[3]/div')
crypto.each do |i|
tab_1.push(i.text)
end

#Test 1 : '//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[2]/div/a[2]'
#Test 2 : '//*[@class="cmc-table__column-name--name cmc-link"]'
#Test 3 : '//td["cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"]/a'

puts ""
tab_2 =[]
values = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[5]/div/a/span')
values.each do |i|
tab_2.push(i.text.delete(",$").to_f)
end


puts ""
hash = tab_1.zip(tab_2).to_h
puts hash
end

method