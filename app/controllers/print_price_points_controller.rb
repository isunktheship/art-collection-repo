class PrintPricePointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print_price_point, only: [:show, :edit, :update, :destroy]

  # GET /print_price_points
  # GET /print_price_points.json
  def index
    @print_price_points = PrintPricePoint.all
  end

  # GET /print_price_points/1
  # GET /print_price_points/1.json
  def show
  end

  # GET /print_price_points/new
  def new
    @print_price_point = PrintPricePoint.new
  end

  # GET /print_price_points/1/edit
  def edit
  end

  def print_price_history
    @print_price_points = PrintPricePoint.where(print_id: params[:print_id]).order(created_at: :asc)
    @print_price_points_json = []

    @print_price_points.each do |ppt|
      row = [ ppt.created_at.strftime("%Y/%m/%d"), ppt.average_price.to_f, ppt.six_month_average_price.to_f]
      @print_price_points_json.push( row )
    end
  end

  # POST /print_price_points
  # POST /print_price_points.json
  def create
    @print_price_point = PrintPricePoint.new(print_price_point_params)

    respond_to do |format|
      if @print_price_point.save
        format.html { redirect_to @print_price_point, notice: 'Print price point was successfully created.' }
        format.json { render :show, status: :created, location: @print_price_point }
      else
        format.html { render :new }
        format.json { render json: @print_price_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_price_points/1
  # PATCH/PUT /print_price_points/1.json
  def update
    respond_to do |format|
      if @print_price_point.update(print_price_point_params)
        format.html { redirect_to @print_price_point, notice: 'Print price point was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_price_point }
      else
        format.html { render :edit }
        format.json { render json: @print_price_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_price_points/1
  # DELETE /print_price_points/1.json
  def destroy
    @print_price_point.destroy
    respond_to do |format|
      format.html { redirect_to print_price_points_url, notice: 'Print price point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_price_point
      @print_price_point = PrintPricePoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_price_point_params
      params.require(:print_price_point).permit(:print_id, :six_month_average_price, :average_price)
    end
end
