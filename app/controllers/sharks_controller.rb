class SharksController < ApplicationController
  before_action :set_shark, only: [:show, :edit, :update, :destroy]

  # GET /sharks
  # GET /sharks.json
  def index
    @sharks = Shark.all
  end

  # GET /sharks/1
  # GET /sharks/1.json
  def show
  end

  # GET /sharks/new
  def new
    @shark = Shark.new
  end

  # GET /sharks/1/edit
  def edit
  end

  # POST /sharks
  # POST /sharks.json
  def create
    @shark = Shark.new(shark_params)

    respond_to do |format|
      if @shark.save
        format.html { redirect_to @shark, notice: 'Shark was successfully created.' }
        format.json { render :show, status: :created, location: @shark }
      else
        format.html { render :new }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharks/1
  # PATCH/PUT /sharks/1.json
  def update
    respond_to do |format|
      if @shark.update(shark_params)
        format.html { redirect_to @shark, notice: 'Shark has been successfully updated'}
        format.json { render :show, status: :ok, location: @shark }
      else
        format.html { render :edit }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharks/1
  # DELETE /sharks/1.json
  def destroy
    @shark.destroy
    respond_to do |format|
      format.html { redirect_to sharks_url, notice: 'Shark was fished out of existance' }
      format.json { head :no_content }
    end
  end

  private
    # Use Callbacks To Share Common Setup Or Constraints Between Actions
    def set_shark
      @shark = Shark.find(params[:id])
    end

    # Allow Whitelist, Never Trust Parameters
    def shark_params
      params.require(:shark).permit(:name, :facts)
    end
  end