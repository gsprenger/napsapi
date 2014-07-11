class NapsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :set_nap, only: [:show, :edit, :update, :destroy]

  # GET /naps
  # GET /naps.json
  def index
    @naps = Nap.all
  end

  # GET /naps/1
  # GET /naps/1.json
  def show
  end

  # GET /naps/new
  def new
    @nap = Nap.new
  end

  # GET /naps/1/edit
  def edit
  end

  # POST /naps
  # POST /naps.json
  def create
    @nap = Nap.new(nap_params)

    respond_to do |format|
      if @nap.save
        format.html { redirect_to @nap, notice: 'Nap was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nap }
      else
        format.html { render action: 'new' }
        format.json { render json: @nap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /naps/1
  # PATCH/PUT /naps/1.json
  def update
    respond_to do |format|
      if @nap.update(nap_params)
        format.html { redirect_to @nap, notice: 'Nap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /naps/1
  # DELETE /naps/1.json
  def destroy
    @nap.destroy
    respond_to do |format|
      format.html { redirect_to naps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nap
      @nap = Nap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nap_params
      params.permit(:nap_type, :description, :coordinates)
    end
end
