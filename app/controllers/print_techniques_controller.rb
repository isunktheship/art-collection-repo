class PrintTechniquesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_print_technique, only: [:show, :edit, :update, :destroy]

  # GET /print_techniques
  # GET /print_techniques.json
  def index
    @print_techniques = PrintTechnique.all
  end

  # GET /print_techniques/1
  # GET /print_techniques/1.json
  def show
  end

  # GET /print_techniques/new
  def new
    @print_technique = PrintTechnique.new
  end

  # GET /print_techniques/1/edit
  def edit
  end

  # POST /print_techniques
  # POST /print_techniques.json
  def create
    @print_technique = PrintTechnique.new(print_technique_params)

    respond_to do |format|
      if @print_technique.save
        format.html { redirect_to @print_technique, notice: 'Print technique was successfully created.' }
        format.json { render :show, status: :created, location: @print_technique }
      else
        format.html { render :new }
        format.json { render json: @print_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_techniques/1
  # PATCH/PUT /print_techniques/1.json
  def update
    respond_to do |format|
      if @print_technique.update(print_technique_params)
        format.html { redirect_to @print_technique, notice: 'Print technique was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_technique }
      else
        format.html { render :edit }
        format.json { render json: @print_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_techniques/1
  # DELETE /print_techniques/1.json
  def destroy
    @print_technique.destroy
    respond_to do |format|
      format.html { redirect_to print_techniques_url, notice: 'Print technique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_technique
      @print_technique = PrintTechnique.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_technique_params
      params.require(:print_technique).permit(:title, :description)
    end
end
