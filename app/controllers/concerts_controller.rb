class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[ show edit update destroy]
  before_action :set_band, only: %i[ index show new edit update create]
  # GET /concerts or /concerts.json
  
  def index
    @concerts = @band.concerts
  end
 
  # GET /concerts/1 or /concerts/1.json
  def show
  end
 
  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts or /concerts.json
  def create
    #band = Band.find(params[band_id])
    @concert = Concert.new(concert_params.merge(band:@band))
    
    respond_to do |format|
      if @concert.save
        format.html { redirect_to band_path(@band), notice: "Concert was successfully created." }
        format.json { render :show, status: :created, location: @concert }
      else
        @band = Band.find(params[:band_id])
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /concerts/1 or /concerts/1.json
  def update
    respond_to do |format|
      if @concert = Concert.new(concert_params.merge(band:@band))
        format.html { redirect_to band_concert_path(@band, @concert), notice: "Concert was successfully updated." }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /concerts/1 or /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end
    
    def set_band
      @band = Band.find(params[:band_id])
    end
    
    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:location, :date, :quantity, :duration)
    end
end