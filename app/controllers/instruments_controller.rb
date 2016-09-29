class InstrumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instrument, only: [:show, :update, :destroy]

  # GET /instruments
  def index
    @instruments = current_user.instrument_templates

    render json: @instruments
  end

  # GET /instruments/1
  def show
    render json: @instrument
  end

  # POST /instruments
  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.template = true

    if @instrument.save
      render json: @instrument, status: :created, location: @instrument
    else
      render json: @instrument, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /instruments/1
  def update
    if @instrument.update(instrument_params)
      render json: @instrument
    else
      render json: @instrument, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /instruments/1
  def destroy
    @instrument.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instrument
    @instrument = Instrument.where(
      id: params[:id], user: current_user).first
  end

  # Only allow a trusted parameter "white list" through.
  def instrument_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
      only: [:name, :color, :width, :height, :x, :y, :angle])
  end
end
