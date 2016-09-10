class PrintSize < ActiveRecord::Base
  has_paper_trail
  
  has_many :prints
end
