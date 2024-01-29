class ApiController < ActionController::Base
  def jobs
    case params[:name]
    when "send_email"
      SendEmailJob.perform_later params[:post_id], {user_id: 99}
      SendEmailJob.perform_later params[:post_id], {user_id: 1, admin: true}
      head :ok
    when "refresh"
      RefreshPostJob.perform_later params[:post_id]
      head :ok
    else
      head :not_found
    end
  end

  def add_reaction
    Reaction.create! params.permit(:name, :post_id)
    head :ok
  end

  def errors
    if params[:code] == "500"
      raise "This is a test error"
    elsif params[:code] == "404"
      head :not_found
    elsif params[:code] == "401"
      head :unauthorized
    else
      head :unprocessable_entity
    end
  end
end
