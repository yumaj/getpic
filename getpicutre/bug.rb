require 'nokogiri'
require 'open-uri'
require 'rubygems'


url = 'https://www.tumblr.com/search/taipei101'
doc = Nokogiri::HTML( open( url ), nil, 'UTF-8' )


path = doc.xpath("//@data-lightbox").text



path = path.split(',')

newpatharray = []

path.each do |i|
	if i.include? "high_res"
		newpatharray.push(i)
	end

end
counter = 0
newpatharray.each do |str|
	str = str.split('":"')[1]

	str = str.gsub('"','')
    str = str.gsub('\\','')
	puts str
	
	download = open(str)
	filename = counter.to_s + '.png'
	counter = counter + 1

	IO.copy_stream(download, filename)

end



