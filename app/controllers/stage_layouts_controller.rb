class StageLayoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stage_layout, only: [:show, :update, :destroy]

  # GET /stage_layouts
  def index
    @stage_layouts = current_user.stage_layout_templates

    render json: @stage_layouts
  end

  # GET /stage_layouts/1
  def show
    render json: @stage_layout
  end

  # POST /stage_layouts
  def create
    @stage_layout = StageLayout.new(stage_layout_params)
    @stage_layout.user = current_user

    if @stage_layout.save
      render json: @stage_layout, status: :created, location: @stage_layout
    else
      render json: @stage_layout, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /stage_layouts/1
  def update
    if @stage_layout.update(stage_layout_params)
      render json: @stage_layout
    else
      render json: @stage_layout, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /stage_layouts/1
  def destroy
    @setup.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stage_layout
    @stage_layout = StageLayout.find(params[:id], user: current_user)
  end

  # Only allow a trusted parameter "white list" through.
  def stage_layout_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(
      params, only: [:name])
  end
end
