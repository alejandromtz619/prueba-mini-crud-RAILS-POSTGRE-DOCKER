class PaisesController < ApplicationController
  before_action :set_paise, only: %i[ show edit update destroy ]

  # GET /paises or /paises.json
  def index
    @paises = Paise.all
  end

  # GET /paises/1 or /paises/1.json
  def show
  end

  # GET /paises/new
  def new
    @paise = Paise.new
  end

  # GET /paises/1/edit
  def edit
  end

  # POST /paises or /paises.json
  def create
    @paise = Paise.new(paise_params)

    respond_to do |format|
      if @paise.save
        format.html { redirect_to @paise, notice: "Paise was successfully created." }
        format.json { render :show, status: :created, location: @paise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paises/1 or /paises/1.json
  def update
    respond_to do |format|
      if @paise.update(paise_params)
        format.html { redirect_to @paise, notice: "Paise was successfully updated." }
        format.json { render :show, status: :ok, location: @paise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1 or /paises/1.json
  def destroy
    @paise.destroy

    respond_to do |format|
      format.html { redirect_to paises_path, status: :see_other, notice: "Paise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paise
      @paise = Paise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paise_params
      params.require(:paise).permit(:pais)
    end
end
