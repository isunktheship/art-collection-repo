class PrintStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print_status, only: [:show, :edit, :update, :destroy]

  # GET /print_statuses
  # GET /print_statuses.json
  def index
    @print_statuses = PrintStatus.all
  end

  # GET /print_statuses/1
  # GET /print_statuses/1.json
  def show
  end

  # GET /print_statuses/new
  def new
    @print_status = PrintStatus.new
  end

  # GET /print_statuses/1/edit
  def edit
  end

  # POST /print_statuses
  # POST /print_statuses.json
  def create
    @print_status = PrintStatus.new(print_status_params)

    respond_to do |format|
      if @print_status.save
        format.html { redirect_to @print_status, notice: 'Print status was successfully created.' }
        format.json { render :show, status: :created, location: @print_status }
      else
        format.html { render :new }
        format.json { render json: @print_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_statuses/1
  # PATCH/PUT /print_statuses/1.json
  def update
    respond_to do |format|
      if @print_status.update(print_status_params)
        format.html { redirect_to @print_status, notice: 'Print status was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_status }
      else
        format.html { render :edit }
        format.json { render json: @print_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_statuses/1
  # DELETE /print_statuses/1.json
  def destroy
    @print_status.destroy
    respond_to do |format|
      format.html { redirect_to print_statuses_url, notice: 'Print status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_status
      @print_status = PrintStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_status_params
      params.require(:print_status).permit(:title, :description)
    end
end
