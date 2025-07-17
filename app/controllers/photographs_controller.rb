class PhotographsController < ApplicationController
  before_action :set_photograph, only: %i[ show edit update destroy ]

  # GET /photographs or /photographs.json
  def index
    @photographs = Photograph.all
  end

  # GET /photographs/1 or /photographs/1.json
  def show
  end

  # GET /photographs/new
  def new
    @photograph = Photograph.new
  end

  # GET /photographs/1/edit
  def edit
  end

  # POST /photographs or /photographs.json
  def create
    @photograph = Photograph.new(photograph_params)

    respond_to do |format|
      if @photograph.save
        format.html { redirect_to @photograph, notice: "Photograph was successfully created." }
        format.json { render :show, status: :created, location: @photograph }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographs/1 or /photographs/1.json
  def update
    respond_to do |format|
      if @photograph.update(photograph_params)
        format.html { redirect_to @photograph, notice: "Photograph was successfully updated." }
        format.json { render :show, status: :ok, location: @photograph }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographs/1 or /photographs/1.json
  def destroy
    @photograph.destroy!

    respond_to do |format|
      format.html { redirect_to photographs_path, status: :see_other, notice: "Photograph was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photograph
      @photograph = Photograph.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def photograph_params
      params.expect(photograph: [ :Device_id, :file ])
    end
end
