class PrintsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print, only: [:show, :edit, :update, :destroy]

  # GET /prints
  # GET /prints.json
  def index
    ppts = PrintPricePoint.select("print_id, average_price, MAX(created_at)").group(:print_id)
    @top_prices = {}
    ppts.each do |ppt|
      @top_prices[ppt.print_id] = ppt
    end

    @prints = Print.includes(:artist).order(:title)
  end

  # GET /prints/1
  # GET /prints/1.json
  def show
  end

  # GET /prints/new
  def new
    @print = Print.new
    render layout: "data_entry_layout"
  end

  # GET /prints/1/edit
  def edit
    render layout: "data_entry_layout"
  end

  # POST /prints
  # POST /prints.json
  def create
    @print = Print.new(print_params)

    respond_to do |format|
      if @print.save
        format.html { redirect_to @print, notice: 'Print was successfully created.' }
        format.json { render :show, status: :created, location: @print }
      else
        format.html { render :new }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prints/1
  # PATCH/PUT /prints/1.json
  def update
    respond_to do |format|
      if @print.update(print_params)
        format.html { redirect_to @print, notice: 'Print was successfully updated.' }
        format.json { render :show, status: :ok, location: @print }
      else
        format.html { render :edit }
        format.json { render json: @print.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prints/1
  # DELETE /prints/1.json
  def destroy
    @print.destroy
    respond_to do |format|
      format.html { redirect_to prints_url, notice: 'Print was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Function to update print values
  def update_print_values
    respond_to do |format|
      if UpdatePrintValuesService.new().call
        format.html { redirect_to prints_url, notice: 'Print values were updated successfully.' }
      else
        format.html { render :update_print_values, notice: 'Unable to update print values..' }
      end
    end
  end

  # Function to update print collection
  def update_print_collection
    respond_to do |format|
      if UpdatePrintCollectionService.new().call
        format.html { redirect_to prints_url, notice: 'Print collection has been updated successfully.' }
      else
        format.html { render :update_print_collection, notice: 'Unable to update print collection..' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print
      @print = Print.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_params
      params.require(:print).permit(:title, :release_date, :artist_id, :eb_uid, :original_price, :size_id, :class_id, :status_id, :run_size, :technique_id, :marking_id, :artist_id)
    end
end
