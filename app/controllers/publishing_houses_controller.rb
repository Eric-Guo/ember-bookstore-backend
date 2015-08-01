class PublishingHousesController < ApplicationController
  before_action :set_publishing_house, only: [:show, :update, :destroy]

  # GET /publishing_houses
  # GET /publishing_houses.json
  def index
    @publishing_houses = PublishingHouse.includes(:published).all

    render json: @publishing_houses
  end

  # GET /publishing_houses/1
  # GET /publishing_houses/1.json
  def show
    render json: @publishing_house
  end

  # POST /publishing_houses
  # POST /publishing_houses.json
  def create
    @publishing_house = PublishingHouse.new(publishing_house_params)

    if @publishing_house.save
      render json: @publishing_house, status: :created, location: @publishing_house
    else
      render json: @publishing_house.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publishing_houses/1
  # PATCH/PUT /publishing_houses/1.json
  def update
    if @publishing_house.update(publishing_house_params)
      render json: @publishing_house
    else
      render json: @publishing_house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publishing_houses/1
  # DELETE /publishing_houses/1.json
  def destroy
    @publishing_house.destroy
  end

  private

    def set_publishing_house
      @publishing_house = PublishingHouse.find(params[:id])
    end

    def publishing_house_params
      params.permit(:name, :discount)
    end
end
