class BombasController < ApplicationController
  before_action :set_bomba, only: %i[ show edit update destroy ]

  # GET /bombas or /bombas.json
  def index
    @bombas = Bomba.all
  end

  # GET /bombas/1 or /bombas/1.json
  def show
  end

  # GET /bombas/new
  def new
    @bomba = Bomba.new
  end

  # GET /bombas/1/edit
  def edit
  end

  # POST /bombas or /bombas.json
  def create
    @bomba = Bomba.new(bomba_params)

    respond_to do |format|
      if @bomba.save
        format.html { redirect_to @bomba, notice: "La bomba ha sido creada con exito." }
        format.json { render :show, status: :created, location: @bomba }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bomba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bombas/1 or /bombas/1.json
  def update
    respond_to do |format|
      if @bomba.update(bomba_params)
        format.html { redirect_to @bomba, notice: "La bomba se actualizo con exito." }
        format.json { render :show, status: :ok, location: @bomba }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bomba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bombas/1 or /bombas/1.json
  def destroy
    @bomba.destroy

    respond_to do |format|
      format.html { redirect_to bombas_path, status: :see_other, notice: "bomba was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bomba
      @bomba = Bomba.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bomba_params
      params.require(:bomba).permit(:descripcion, :coordenadas)
    end
end
