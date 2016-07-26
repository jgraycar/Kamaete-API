
class SetupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setup, only: [:show, :update, :destroy]

  # GET /setups
  def index
    @setups = current_user.setups

    render json: @setups
  end

  # GET /setups/1
  def show
    render json: @setup
  end

  # POST /setups
  def create
    @setup = Setup.new(setup_params)
    @setup.user = current_user

    if @setup.save
      render json: @setup, status: :created, location: @setup
    else
      render json: @setup, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /setups/1
  def update
    if @setup.update(setup_params)
      render json: @setup
    else
      render json: @setup, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /setups/1
  def destroy
    @setup.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_setup
    @setup = setup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def setup_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(
      params, only: [:title])
  end
end
