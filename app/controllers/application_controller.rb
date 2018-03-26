class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def is_admin
    if !user_signed_in?
      authenticate_user!
    elsif  !current_user.has_role?(:admin)
      respond_to do |format|
        format.html do
          redirect_to root_path, notice: 'You are not authorized to view this page!'
        end
      end
    end
  end
end
