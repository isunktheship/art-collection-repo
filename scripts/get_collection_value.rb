require '../config/environment'
require 'mechanize'
require 'nokogiri'
require 'pp'

puts "Running script..."

def get_print_uids collection_id
  collection_url = "http://expressobeans.com/members/collections.php?id=#{collection_id}&ipp=500"  
  args = %w[isunktheship manchester1]
  print_uids = []

  a = Mechanize.new
  a.get('http://expressobeans.com/login.php?ref=1') do |page|
    # Click the login link
    login_page = a.click(page.link_with(:text => /Login/))

    # Submit the login form
    my_page = login_page.form_with(:action => './ucp.php?mode=login') do |f|
      f.username  = args[0]
      f.password  = args[1]
    end.click_button

    # Get collection
    a.get(collection_url) do |collection|
      html = Nokogiri::HTML(collection.body)
      links = html.xpath("//*[contains(@href, 'detail.php')]")

      links.each do |link|
        print_uids << link['href'].split("detail.php/")[-1].to_i
      end
    end
  end
  print_uids.uniq!
end

def get_print_details print_uid
  url = "http://expressobeans.com/public/detail.php/#{print_uid}"
  mechanize = Mechanize.new
  page = mechanize.get(url)
  html = Nokogiri::HTML(page.body)

  details = {}
  details["eb_uid"] = print_uid

  edition_stats = html.xpath("//table[contains(@class, 'editionStats')]/tr")
  edition_stats.each do |row|
    if row.xpath("th[1]").text.strip == "Original Price"
      details[ "price" ] = row.xpath("td[1]").text.strip.sub("$", "")
    end
    if row.xpath("th[1]").text.strip == "Six Month Average"
      details[ "six_month_avg_price" ] = row.xpath("td[1]").text.strip.sub("$", "")
    end
    if row.xpath("th[1]").text.strip == "Average Price"
      details[ "average_price" ] = row.xpath("td[1]").text.strip.sub("$", "")
    end
  end

  return details
end

def import_price_details details
  p = Print.find_by_eb_uid( details['eb_uid'].to_i )

  return unless p
  ppt = PrintPricePoint.new(print_id: p.id)
  ppt.six_month_average_price = details[ "six_month_avg_price" ].to_d if details[ "six_month_avg_price" ]
  ppt.average_price = details[ "average_price" ].to_d if details[ "average_price" ]

  ppt.save
end

# collection_id = 36459
print_uids = Print.pluck(:eb_uid)
# print_uids = get_print_uids collection_id
# pp print_uids

print_uids.each do |print_uid|
  details = get_print_details print_uid
  pp details 
  # puts "importing price: #{details['eb_uid']}"
  import_price_details details
  # break
end