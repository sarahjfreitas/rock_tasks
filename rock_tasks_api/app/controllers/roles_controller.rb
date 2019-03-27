#controller for roles
class RolesController < ApplicationController

  # GET /roles
  #
  # list all roles and return in json
  def index
    @roles = Role.all
    json_response(@roles)
  end

end
