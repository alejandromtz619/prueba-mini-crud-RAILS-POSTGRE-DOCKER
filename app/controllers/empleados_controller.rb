class EmpleadosController < ApplicationController
  before_action :set_empleado, only: %i[ show edit update destroy ]

  # GET /empleados or /empleados.json
  def index
    @empleados = Empleado.all
  end

  # GET /empleados/1 or /empleados/1.json
  def show
    @empleado = Empleado.find(params[:id])
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
    @personas = Persona.all 
    @cargos = Cargo.all 
    @ubicaciones = Ubicacione.all 
    @paises = Paise.all 
    @ciudades = Ciudade.all 
  end

  # GET /empleados/1/edit
  def edit
    @empleado = Empleado.find(params[:id])
    @personas = Persona.all 
    @cargos = Cargo.all 
    @ubicaciones = Ubicacione.all 
    @paises = Paise.all 
    @ciudades = Ciudade.all 
  end


  # POST /empleados or /empleados.json
def create
  @empleado = Empleado.new(empleado_params)

  # Asignar país y ciudad en base a la ubicación seleccionada
  if @empleado.ubicacion_id.present?
    ubicacion = Ubicacione.find(@empleado.ubicacion_id)
    @empleado.pais_id = ubicacion.pais_id
    @empleado.ciudad_id = ubicacion.ciudad_id
  end

  # Asignar cargo en base a la persona seleccionada
  if @empleado.persona_id.present?
    persona = Persona.find(@empleado.persona_id)
    @empleado.cargo_id = persona.cargo_id
  end

  respond_to do |format|
    if @empleado.save
      format.html { redirect_to @empleado, notice: "Empleado fue creado con éxito." }
      format.json { render :show, status: :created, location: @empleado }
    else
      set_data_for_selects
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @empleado.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /empleados/1 or /empleados/1.json
def update
  if @empleado.update(empleado_params)
    # Asignar país y ciudad en base a la ubicación seleccionada
    if @empleado.ubicacion_id.present?
      ubicacion = Ubicacione.find(@empleado.ubicacion_id)
      @empleado.pais_id = ubicacion.pais_id
      @empleado.ciudad_id = ubicacion.ciudad_id
    end

    # Asignar cargo en base a la persona seleccionada
    if @empleado.persona_id.present?
      persona = Persona.find(@empleado.persona_id)
      @empleado.cargo_id = persona.cargo_id
    end

    respond_to do |format|
      format.html { redirect_to @empleado, notice: "Empleado fue actualizado con éxito." }
      format.json { render :show, status: :ok, location: @empleado }
    end
  else
    set_data_for_selects
    respond_to do |format|
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @empleado.errors, status: :unprocessable_entity }
    end
  end
end


  # DELETE /empleados/1 or /empleados/1.json
  def destroy
    @empleado.destroy

    respond_to do |format|
      format.html { redirect_to empleados_path, status: :see_other, notice: "Empleado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

    def set_data_for_selects
      @personas = Persona.all
      @cargos = Cargo.all
      @ubicaciones = Ubicacione.all
      @paises = Paise.all
      @ciudades = Ciudade.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empleado_params
      params.require(:empleado).permit(:persona_id, :cargo_id, :ubicacion_id, :ciudad_id, :pais_id)
    end
    
end
