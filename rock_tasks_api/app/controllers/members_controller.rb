class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.all
    jeson_response(@members)
  end

  # GET /members/1
  def show
    jeson_response(@member)
  end

  # POST /members
  def create
    @member = Member.create!(todo_params)
    json_response(@member, :created)
  end

  # PATCH/PUT /members/1
  def update
    @member.update(member_params)
    json_response(@member, :updated)
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:name, :email, :role_id)
    end
end
