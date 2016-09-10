class UpdatePrintValuesService
  def initialize()
  end

  def call
    begin
      update_print_values Print.all
      return true
    rescue StandardError => e
      puts "SOMETHING BROKE"
      return false
    end
  end

  def update_new
    begin
      update_print_values Print.where("created_at > ?", Date.today - 1.day)
      return true
    rescue StandardError => e
      puts "SOMETHING BROKE"
      return false
    end
  end

  private

  # attr_reader :print_uids

  def update_print_values prints
    prints.each do |print|
      details = get_print_details print
      import_price_details details
    end
  end

  def get_print_details print
    print_uid = print.eb_uid
    print_id = print.id
    url = "http://expressobeans.com/public/detail.php/#{print_uid}"
    mechanize = Mechanize.new
    page = mechanize.get(url)
    html = Nokogiri::HTML(page.body)

    details = {}
    details["id"] = print_id

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
    ppt = PrintPricePoint.new(print_id: details[ "id" ])
    ppt.six_month_average_price = details[ "six_month_avg_price" ].to_d if details[ "six_month_avg_price" ]
    ppt.average_price = details[ "average_price" ].to_d if details[ "average_price" ]

    # puts "Data prepped successfully!"
    ppt.save
  end
end