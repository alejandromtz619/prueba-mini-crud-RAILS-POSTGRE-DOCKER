class CiudadesController < ApplicationController
  before_action :set_ciudade, only: %i[ show edit update destroy ]

  # GET /ciudades or /ciudades.json
  def index
    @ciudades = Ciudade.all
  end

  # GET /ciudades/1 or /ciudades/1.json
  def show
    @ciudade = Ciudade.find(params[:id])
  end

  # GET /ciudades/new
  def new
    @ciudade = Ciudade.new
    @paises = Paise.all # Fetch all paises for the dropdown
  end

  # GET /ciudades/1/edit
  def edit
    @ciudade = Ciudade.find(params[:id])
    @paises = Paise.all # Fetch all paises for the dropdown
  end

  # POST /ciudades or /ciudades.json
  def create
    @ciudade = Ciudade.new(ciudade_params)

    respond_to do |format|
      if @ciudade.save
        format.html { redirect_to @ciudade, notice: "Ciudade was successfully created." }
        format.json { render :show, status: :created, location: @ciudade }
      else
        @paises = Paise.all # Fetch all paises again for the dropdown in case of errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ciudade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudades/1 or /ciudades/1.json
  def update
    respond_to do |format|
      @ciudade = Ciudade.find(params[:id])
      if @ciudade.update(ciudade_params)
        format.html { redirect_to @ciudade, notice: "Ciudad was successfully updated." }
        format.json { render :show, status: :ok, location: @ciudade }
      else
        @paises = Paise.all # Fetch all cargos again for the dropdown in case of errors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ciudade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1 or /ciudades/1.json
  def destroy
    @ciudade.destroy

    respond_to do |format|
      format.html { redirect_to ciudades_path, status: :see_other, notice: "Ciudade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudade
      @ciudade = Ciudade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ciudade_params
      params.require(:ciudade).permit(:ciudad, :pais_id)
    end
end
