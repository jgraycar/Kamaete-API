class InstrumentTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instrument_type, only: [:show, :update, :destroy]

  # GET /instrument_types
  def index
    @instrument_types = current_user.instrument_types

    render json: @instrument_types
  end

  # GET /instrument_types/1
  def show
    render json: @instrument_type
  end

  # POST /instrument_types
  def create
    @instrument_type = InstrumentType.new(instrument_type_params)
    @instrument_type.user = current_user

    if @instrument_type.save
      render json: @instrument_type, status: :created, location: @instrument_type
    else
      render json: @instrument_type, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /instrument_types/1
  def update
    if @instrument_type.update(instrument_type_params)
      render json: @instrument_type
    else
      render json: @instrument_type, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /instrument_types/1
  def destroy
    @instrument_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instrument_type
    @instrument_type = InstrumentType.where(
      id: params[:id], user: current_user).first
  end

  # Only allow a trusted parameter "white list" through.
  def instrument_type_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(
      params, only: [:name, :size, :color, :shape])
  end
end
