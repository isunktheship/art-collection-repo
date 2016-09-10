class PrintSizesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_size, only: [:show, :edit, :update, :destroy]

  # GET /print_sizes
  # GET /print_sizes.json
  def index
    @print_sizes = PrintSize.all
  end

  # GET /print_sizes/1
  # GET /print_sizes/1.json
  def show
  end

  # GET /print_sizes/new
  def new
    @print_size = PrintSize.new
  end

  # GET /print_sizes/1/edit
  def edit
  end

  # POST /print_sizes
  # POST /print_sizes.json
  def create
    @print_size = PrintSize.new(size_params)

    respond_to do |format|
      if @print_size.save
        format.html { redirect_to @print_size, notice: 'PrintSize was successfully created.' }
        format.json { render :show, status: :created, location: @print_size }
      else
        format.html { render :new }
        format.json { render json: @print_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_sizes/1
  # PATCH/PUT /print_sizes/1.json
  def update
    respond_to do |format|
      if @print_size.update(size_params)
        format.html { redirect_to @print_size, notice: 'PrintSize was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_size }
      else
        format.html { render :edit }
        format.json { render json: @print_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_sizes/1
  # DELETE /print_sizes/1.json
  def destroy
    @print_size.destroy
    respond_to do |format|
      format.html { redirect_to sizes_url, notice: 'PrintSize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @print_size = PrintSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:print_size).permit(:height, :width)
    end
end
