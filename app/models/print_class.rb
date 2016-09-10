class PrintClass < ActiveRecord::Base
  has_paper_trail
  
  has_many :prints
end
