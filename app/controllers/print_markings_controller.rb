class PrintMarkingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print_marking, only: [:show, :edit, :update, :destroy]

  # GET /print_markings
  # GET /print_markings.json
  def index
    @print_markings = PrintMarking.all
  end

  # GET /print_markings/1
  # GET /print_markings/1.json
  def show
  end

  # GET /print_markings/new
  def new
    @print_marking = PrintMarking.new
  end

  # GET /print_markings/1/edit
  def edit
  end

  # POST /print_markings
  # POST /print_markings.json
  def create
    @print_marking = PrintMarking.new(print_marking_params)

    respond_to do |format|
      if @print_marking.save
        format.html { redirect_to @print_marking, notice: 'Print marking was successfully created.' }
        format.json { render :show, status: :created, location: @print_marking }
      else
        format.html { render :new }
        format.json { render json: @print_marking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_markings/1
  # PATCH/PUT /print_markings/1.json
  def update
    respond_to do |format|
      if @print_marking.update(print_marking_params)
        format.html { redirect_to @print_marking, notice: 'Print marking was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_marking }
      else
        format.html { render :edit }
        format.json { render json: @print_marking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_markings/1
  # DELETE /print_markings/1.json
  def destroy
    @print_marking.destroy
    respond_to do |format|
      format.html { redirect_to print_markings_url, notice: 'Print marking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_marking
      @print_marking = PrintMarking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_marking_params
      params.require(:print_marking).permit(:title, :description)
    end
end
