class ApiController < ActionController::Base
  def jobs
    case params[:name]
    when "send_email"
      SendEmailJob.perform_later params[:post_id]
      SendEmailJob.perform_later params[:post_id], {admin: true}
      # head :ok
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
end
