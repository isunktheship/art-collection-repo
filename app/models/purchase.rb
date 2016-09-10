class Purchase < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :print
end
