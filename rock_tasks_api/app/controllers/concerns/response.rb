# collection of helper methods to handle responses
module Response
  #render json with status responde
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end