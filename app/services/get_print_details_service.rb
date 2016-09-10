require 'pp'

class GetPrintDetailsService
  def initialize(params)
    @print_uid = params[:print_uid]
  end

  def call
    begin
      return get_print_details @print_uid
    rescue StandardError => e
      pp e
      puts "SOMETHING BROKE"
      return {}
    end
  end

  private

  # attr_reader :print_uids

  def get_print_details print_uid
    url = "http://expressobeans.com/public/detail.php/#{print_uid}"
    mechanize = Mechanize.new
    page = mechanize.get(url)
    html = Nokogiri::HTML(page.body)

    details = {}
    details["eb_uid"] = print_uid
    details["title"] = page.title
    details["artist"] = html.xpath("//a[contains(@title, 'More by this Artist')]").text.strip

    # Print Year
    # Print Class
    # Print Status
    # Print Release Date
    # Print Run
    # Print Technique
    # Print Size
    # Print Markings
    detail_rows = html.xpath("//dl[contains(@class, 'itemListingInfo')]/dd[3]/table/tr")
    detail_rows.each do |row|
      details[ row.xpath("td[1]").text.strip.sub(":","").downcase ] = row.xpath("td[2]").text.strip
    end

    edition_stats = html.xpath("//table[contains(@class, 'editionStats')]/tr")
    edition_stats.each do |row|
      if row.xpath("th[1]").text.strip == "Original Price"
        details[ "price" ] = row.xpath("td[1]").text.strip.sub("$", "")
        break
      end
    end

    return details
  end
end