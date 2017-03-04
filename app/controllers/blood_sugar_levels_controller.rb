class BloodSugarLevelsController < ApplicationController
  before_action :set_blood_sugar_level, only: [:show, :edit, :update, :destroy]

  # GET /blood_sugar_levels
  # GET /blood_sugar_levels.json
  def index
    @blood_sugar_levels = BloodSugarLevel.all
  end

  # GET /blood_sugar_levels/1
  # GET /blood_sugar_levels/1.json
  def show
  end

  # GET /blood_sugar_levels/new
  def new
    @blood_sugar_level = BloodSugarLevel.new
  end

  # GET /blood_sugar_levels/1/edit
  def edit
  end

  # POST /blood_sugar_levels
  # POST /blood_sugar_levels.json
  def create
    @blood_sugar_level = BloodSugarLevel.new(blood_sugar_level_params)

    respond_to do |format|
      if @blood_sugar_level.save
        format.html { redirect_to @blood_sugar_level, notice: 'Blood sugar level was successfully created.' }
        format.json { render :show, status: :created, location: @blood_sugar_level }
      else
        format.html { render :new }
        format.json { render json: @blood_sugar_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blood_sugar_levels/1
  # PATCH/PUT /blood_sugar_levels/1.json
  def update
    respond_to do |format|
      if @blood_sugar_level.update(blood_sugar_level_params)
        format.html { redirect_to @blood_sugar_level, notice: 'Blood sugar level was successfully updated.' }
        format.json { render :show, status: :ok, location: @blood_sugar_level }
      else
        format.html { render :edit }
        format.json { render json: @blood_sugar_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_sugar_levels/1
  # DELETE /blood_sugar_levels/1.json
  def destroy
    @blood_sugar_level.destroy
    respond_to do |format|
      format.html { redirect_to blood_sugar_levels_url, notice: 'Blood sugar level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params[:csv]
    file_path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    BloodSugarLevel.import_from_csv(file_path)
    respond_to do |format|
      format.html { redirect_to blood_sugar_levels_url, notice: 'Uploaded CSV' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood_sugar_level
      @blood_sugar_level = BloodSugarLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_sugar_level_params
      params.fetch(:blood_sugar_level, {})
    end
end
