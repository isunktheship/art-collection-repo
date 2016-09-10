class PrintClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print_class, only: [:show, :edit, :update, :destroy]

  # GET /print_classes
  # GET /print_classes.json
  def index
    @print_classes = PrintClass.all
  end

  # GET /print_classes/1
  # GET /print_classes/1.json
  def show
  end

  # GET /print_classes/new
  def new
    @print_class = PrintClass.new
  end

  # GET /print_classes/1/edit
  def edit
  end

  # POST /print_classes
  # POST /print_classes.json
  def create
    @print_class = PrintClass.new(print_class_params)

    respond_to do |format|
      if @print_class.save
        format.html { redirect_to @print_class, notice: 'Print class was successfully created.' }
        format.json { render :show, status: :created, location: @print_class }
      else
        format.html { render :new }
        format.json { render json: @print_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_classes/1
  # PATCH/PUT /print_classes/1.json
  def update
    respond_to do |format|
      if @print_class.update(print_class_params)
        format.html { redirect_to @print_class, notice: 'Print class was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_class }
      else
        format.html { render :edit }
        format.json { render json: @print_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_classes/1
  # DELETE /print_classes/1.json
  def destroy
    @print_class.destroy
    respond_to do |format|
      format.html { redirect_to print_classes_url, notice: 'Print class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_class
      @print_class = PrintClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_class_params
      params.require(:print_class).permit(:title, :description)
    end
end
