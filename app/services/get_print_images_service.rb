class GetPrintImagesService
  def initialize()
    # @print_uids = Print.pluck(:eb_uid)
  end

  def call
    begin
      get_print_images
      return true
    rescue StandardError => e
      puts "SOMETHING BROKE"
      return false
    end
  end

  private

  # attr_reader :print_uids

  def get_print_images  
    collection_id = 36459

    Print.all.pluck(:eb_uid).each do |uid|
    	download_image( uid )
   	end
  end

  def download_image print_uid
    print_url = "http://expressobeans.com/public/detail.php/#{print_uid}"
    a = Mechanize.new
    page = a.get(print_url)
    #pp page.images
    #pp page.images.first.attributes["src"]
    img_url = page.parser.xpath("//img[contains(@alt, 'Image')]")[0]['src'].sub("&t=mi", "&t=lg")
    image_path = "http://expressobeans.com/#{img_url}"
    save_path = Rails.root.join('public', 'assets', 'prints', 'images', 'temp', "#{print_uid}.jpg")
    # pp path

    puts img_url
    puts image_path
    puts save_path

    a.get(image_path).save( save_path )

    #pp page.search("/visual/IS.php")
  end 
end