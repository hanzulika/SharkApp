class SharksController < ApplicationController
  before_action :set_shark, only: %i[ show edit update destroy ]

  # GET /sharks or /sharks.json
  def index
    @sharks = Shark.all
  end

  # GET /sharks/1 or /sharks/1.json
  def show
  end

  # GET /sharks/new
  def new
    @shark = Shark.new
  end

  # GET /sharks/1/edit
  def edit
  end

  # POST /sharks or /sharks.json
  def create
    @shark = Shark.new(shark_params)

    respond_to do |format|
      if @shark.save
        format.html { redirect_to @shark, notice: "Shark was successfully created." }
        format.json { render :show, status: :created, location: @shark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharks/1 or /sharks/1.json
  def update
    respond_to do |format|
      if @shark.update(shark_params)
        format.html { redirect_to @shark, notice: "Shark was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @shark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharks/1 or /sharks/1.json
  def destroy
    @shark.destroy!

    respond_to do |format|
      format.html { redirect_to sharks_path, notice: "Shark was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shark
      @shark = Shark.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shark_params
      params.expect(shark: [ :name, :facts ])
    end
end
