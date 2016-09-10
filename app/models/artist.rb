class Artist < ActiveRecord::Base
  has_paper_trail
  
  has_many :prints

  def name
  	return last_name if first_name.to_s == ""
  	return "#{last_name}, #{first_name}"
  end
end
