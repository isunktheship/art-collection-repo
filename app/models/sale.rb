class Sale < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :print
  belongs_to :purchase
end
