# require '../config/environment'
# require 'mechanize'
# require 'nokogiri'
# require 'pp'

# mechanize = Mechanize.new

# def import_print_details details
#   p = Print.where(title: details['title']).first_or_create
#   p.run_size = details['run'] if details['run']
#   p.original_price = details['price'] if details['price']
#   begin
#     p.release_date = Date.strptime(details['released'], "%m/%d/%Y") if details['released'] && details['released'].to_s != ""
#   rescue
#   end
#   p.eb_uid = details['eb_uid'] if details['eb_uid']
#   p.save

#   # artist_name = details['artist'].split(",")
#   # a = Artist.where(last_name: artist_name[0], first_name: artist_name[1]).first_or_create
#   # a.save
#   #
#   # print_size = details['artist'].sub(" ", "").downcase.split("x")
#   # p_size      = PrintSize.where(height: print_size[0], width: print_size[1]).first_or_create
#   #
#   # p_size.save
#   # p_class.save
#   # p_status.save
#   # p_technique.save
#   # p_marking.save
#   #
#   # p.artist          = a
#   # p.print_size      = p_size
#   p.print_class     = PrintClass.where(title: details['class']).first_or_create if details['class']
#   p.print_status    = PrintStatus.where(title: details['status']).first_or_create if details['status']
#   p.print_technique = PrintTechnique.where(title: details['technique']).first_or_create if details['technique']
#   p.print_marking   = PrintMarking.where(title: details['markings']).first_or_create if details['markings']
#   p.save
# end

# # TODO: Loop through all prints
# (1..100).each do |index|

#   url = "http://expressobeans.com/public/detail.php/#{index}"
#   page = mechanize.get(url)
#   html = Nokogiri::HTML(page.body)

#   details = {}
#   details["eb_uid"] = index

#   # TODO Capture print details
#   # Print Title
#   details["title"] = page.title

#   # Print Artist
#   details["artist"] = html.xpath("//a[contains(@title, 'More by this Artist')]").text.strip

#   # Print Year
#   # Print Class
#   # Print Status
#   # Print Release Date
#   # Print Run
#   # Print Technique
#   # Print Size
#   # Print Markings
#   detail_rows = html.xpath("//dl[contains(@class, 'itemListingInfo')]/dd[3]/table/tr")
#   detail_rows.each do |row|
#     details[ row.xpath("td[1]").text.strip.sub(":","").downcase ] = row.xpath("td[2]").text.strip
#   end

#   edition_stats = html.xpath("//table[contains(@class, 'editionStats')]/tr")
#   edition_stats.each do |row|
#     if row.xpath("th[1]").text.strip == "Original Price"
#       details[ "price" ] = row.xpath("td[1]").text.strip.sub("$", "")
#       break
#     end
#   end

#   pp details
#   # p = Print.new
#   import_print_details details
# end





# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(1) > td:nth-child(2)').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(3) > td:nth-child(2))').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(4) > td:nth-child(2))').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(5) > td:nth-child(2))').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(6) > td:nth-child(2))').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(7) > td:nth-child(2))').text.strip
# # puts page.at('#content > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > dl > dd:nth-child(6) > table > tbody > tr:nth-child(8) > td:nth-child(2))').text.strip