class NapsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_nap, only: [:show, :edit, :update, :destroy]

  # GET /naps.json
  def index
    @naps = Nap.all
    respond_to do |format|
      format.json
    end
  end

  # GET /naps/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # POST /naps.json
  def create
    @nap = Nap.new(nap_params)
    respond_to do |format|
      if @nap.save
        format.json { render action: 'show', status: :created, location: @nap }
      else
        format.json { render json: @nap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /naps/1.json
  def update
    respond_to do |format|
      if @nap.update(nap_params)
        format.json { head :no_content }
      else
        format.json { render json: @nap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /naps/1.json
  def destroy
    @nap.destroy
    respond_to do |format|
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
      respond_to do |format|
        format.json { params.permit(:nap_type, :description, :coordinates) }
      end
    end
end
