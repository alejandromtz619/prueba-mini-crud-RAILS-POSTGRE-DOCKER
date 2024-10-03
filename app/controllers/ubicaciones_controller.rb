class UbicacionesController < ApplicationController
  before_action :set_ubicacione, only: %i[ show edit update destroy ]

  # GET /ubicaciones or /ubicaciones.json
  def index
    @ubicaciones = Ubicacione.all
  end

  # GET /ubicaciones/1 or /ubicaciones/1.json
  def show
    @ubicacione = Ubicacione.find(params[:id])
  end

  # GET /ubicaciones/new
  def new
    @ubicacione = Ubicacione.new
    @paises = Paise.all # Fetch all paises for the dropdown
    @ciudades = Ciudade.all # Fetch all ciudades for the dropdown
  end

  # GET /ubicaciones/1/edit
  def edit
    @ubicacione = Ubicacione.find(params[:id])
    @paises = Paise.all
    @ciudades = Ciudade.all
  end

  # POST /ubicaciones or /ubicaciones.json
  def create
    @ubicacione = Ubicacione.new(ubicacione_params)

    respond_to do |format|
      if @ubicacione.save
        format.html { redirect_to @ubicacione, notice: "Ubicacione was successfully created." }
        format.json { render :show, status: :created, location: @ubicacione }
      else
        @paises = Paise.all
        @ciudades = Ciudade.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ubicacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicaciones/1 or /ubicaciones/1.json
  def update
    respond_to do |format|
      if @ubicacione.update(ubicacione_params)
        format.html { redirect_to @ubicacione, notice: "Ubicacion was successfully updated." }
        format.json { render :show, status: :ok, location: @ubicacione }
      else
        @paises = Paise.all
        @ciudades = Ciudade.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ubicacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicaciones/1 or /ubicaciones/1.json
  def destroy
    @ubicacione.destroy

    respond_to do |format|
      format.html { redirect_to ubicaciones_path, status: :see_other, notice: "Ubicacione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacione
      @ubicacione = Ubicacione.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ubicacione_params
      params.require(:ubicacione).permit(:direccion, :pais_id, :ciudad_id)
    end
end
