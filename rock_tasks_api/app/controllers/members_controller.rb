#controller for members
class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  #
  # list all members and return in json
  def index
    @members = Member.all
    json_response(@members)
  end

  # GET /members/1
  #
  # find and return member by passed :id
  def show
    json_response(@member)
  end

  # POST /members
  #
  # create new member with params :name, :email, :role_id
  #
  # return created member
  def create
    @member = Member.create!(member_params)
    json_response(@member, :created)
  end

  # PATCH/PUT /members/1
  #
  # find member by passed :id
  #
  # update with params :name, :email, :role_id
  #
  # return updated member
  def update
    @member.update(member_params)
    json_response(@member, :updated)
  end

  # DELETE /members/1
  #
  # find and destroy member by passed :id
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
