class MyCollectionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    sale_ids = Sale.pluck(:purchase_id) << 0
    @pieces = Purchase.includes(print: [:artist]).where( "purchases.id NOT in (?)", sale_ids ).order("prints.title ASC")
    ppts = PrintPricePoint.select("print_id, average_price, MAX(created_at)").group(:print_id)

    # TODO: FIgure out how to eager load this shit
    @top_prices = {}
    ppts.each do |ppt|
      @top_prices[ppt.print_id] = ppt
    end
  end

  def mosaic
    sale_ids = Sale.pluck(:purchase_id) << 0
    # @pieces = Purchase.includes(print: [:artist]).where( "purchases.id NOT in (?)", sale_ids ).order("prints.title ASC")
    @pieces = Purchase.includes(print: [:artist]).where( "purchases.id NOT in (?)", sale_ids ).order("prints.eb_uid ASC")
    pp @pieces
  end
end