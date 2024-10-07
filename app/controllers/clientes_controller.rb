class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @bombas = Bomba.all # Fetch all bombas for the dropdown
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
    @bombas = Bomba.all # Fetch all bombas for the dropdown
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "EL cliente ha sido creado" }
        format.json { render :show, status: :created, location: @cliente }
      else
        @bombas = Bomba.all # Fetch all bombas again for the dropdown in case of errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
    @cliente = Cliente.find(params[:id])
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "El cliente ha sido modificado con exito" }
        format.json { render :show, status: :ok, location: @cliente }
      else
        @bombas = Bomba.all # Fetch all bombas again for the dropdown in case of errors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_path, status: :see_other, notice: "El cliente ha sido eliminado exitosamente" }
      format.json { head :no_content }
    end
  end

  def bombas
    @cliente = Cliente.find(params[:id])
    bombas = @cliente.bombas.select(:descripcion, :coordenadas)
    render json: bombas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nombre, :razon_social, :ruc, bomba_ids: [])
    end    

  end

