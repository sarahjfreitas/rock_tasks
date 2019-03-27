# collection of helper methods to handle responses
module Response
  #render json with status responde
  def json_response(object, status = :ok, location = nil)
    render json: object, status: status, location: location
  end
end