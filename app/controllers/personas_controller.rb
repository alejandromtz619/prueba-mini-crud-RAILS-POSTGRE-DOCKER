class PersonasController < ApplicationController
  before_action :set_persona, only: %i[ show edit update destroy ]

  # GET /personas or /personas.json
  def index
    @personas = Persona.all
  end

  # GET /personas/1 or /personas/1.json
  def show
    @persona = Persona.find(params[:id])
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    @cargos = Cargo.all # Fetch all cargos for the dropdown
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
    @cargos = Cargo.all # Fetch all cargos for the dropdown
  end

  # POST /personas or /personas.json
  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: "La persona ha sido creada" }
        format.json { render :show, status: :created, location: @persona }
      else
        @cargos = Cargo.all # Fetch all cargos again for the dropdown in case of errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1 or /personas/1.json
  def update
    respond_to do |format|
    @persona = Persona.find(params[:id])
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: "La persona ha sido modificada con exito" }
        format.json { render :show, status: :ok, location: @persona }
      else
        @cargos = Cargo.all # Fetch all cargos again for the dropdown in case of errors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1 or /personas/1.json
  def destroy
    @persona.destroy

    respond_to do |format|
      format.html { redirect_to personas_path, status: :see_other, notice: "La persona ha sido eliminada exitosamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persona_params
      params.require(:persona).permit(:id, :nombre, :edad, :cargo_id)
    end

  end

