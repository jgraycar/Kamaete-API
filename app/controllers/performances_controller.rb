class PerformancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_performance, only: [:show, :update, :destroy]

  # GET /performances
  def index
    @performances = current_user.performances

    render json: @performances
  end

  # GET /performances/1
  def show
    render json: @performance
  end

  # POST /performances
  def create
    @performance = Performance.new(performance_params)
    @performance.user = current_user

    if @performance.save
      render json: @performance, status: :created, location: @performance
    else
      render json: @performance, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /performances/1
  def update
    if @performance.update(performance_params)
      render json: @performance
    else
      render json: @performance, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /performances/1
  def destroy
    @performance.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_performance
    @performance = Performance.where(
      id: params[:id], user: current_user).first
  end

  # Only allow a trusted parameter "white list" through.
  def performance_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(
      params, only: [:title, :date, :members])
  end
end
