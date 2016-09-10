class ImportPrintDetailsService
  def initialize(params)
    @details = params[:details]
  end

  def call
    begin
      import_print_details @details
      return true
    rescue StandardError => e
      puts "SOMETHING BROKE"
      return false
    end
  end

  private

  def import_print_details details
  	raise "No details to import" if details == {}
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