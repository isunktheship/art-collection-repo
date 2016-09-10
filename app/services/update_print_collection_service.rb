class UpdatePrintCollectionService
  def initialize()
    # @print_uids = Print.pluck(:eb_uid)
  end

  def call
    begin
      update_print_collection
      return true
    rescue StandardError => e
      puts "SOMETHING BROKE"
      return false
    end
  end

  private

  # attr_reader :print_uids

  def update_print_collection  
    collection_id = 36459

    current_print_uids = Print.all.pluck(:eb_uid)
    collection_print_uids = get_print_uids collection_id
    new_print_uids = collection_print_uids - current_print_uids

    new_print_uids.each do |print_uid|
      details = get_print_details print_uid
      import_print_details details
    end

    UpdatePrintValuesService.new().update_new
  end

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

  def import_print_details details
    p = Print.where(title: details['title']).first_or_create
    p.run_size = details['run'] if details['run']
    p.original_price = details['price'] if details['price']
    begin
      p.release_date = Date.strptime(details['released'], "%m/%d/%y") if details['released'] && details['released'].to_s != ""
    rescue
    end
    p.eb_uid = details['eb_uid'] if details['eb_uid']
    p.save

    artist_name = details['artist'].split(",") if details['artist']
    a = Artist.where(last_name: artist_name[0], first_name: artist_name[1]).first_or_create

    print_size = details['artist'].sub(" ", "").downcase.split("x")
    p_size      = PrintSize.where(height: print_size[0], width: print_size[1]).first_or_create
    
    p.artist          = a
    p.print_size      = p_size
    p.print_class     = PrintClass.where(title: details['class']).first_or_create if details['class']
    p.print_status    = PrintStatus.where(title: details['status']).first_or_create if details['status']
    p.print_technique = PrintTechnique.where(title: details['technique']).first_or_create if details['technique']
    p.print_marking   = PrintMarking.where(title: details['markings']).first_or_create if details['markings']
    p.save
  end  
end