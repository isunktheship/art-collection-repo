class Print < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :artist
  belongs_to :print_class
  belongs_to :print_marking
  belongs_to :print_size
  belongs_to :print_status
  belongs_to :print_technique
  
  has_many :purchases, dependent: :destroy
  has_many :sales, dependent: :destroy  
  has_many :print_price_points, dependent: :destroy
  
  include ActionView::Helpers::NumberHelper

  def price_in_dollars
  	return number_to_currency( original_price )
  end
end
