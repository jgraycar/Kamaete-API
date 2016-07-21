class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = current_user.members

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)
    @member.user = current_user

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def member_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
                                                          only: [:name])
  end
end
