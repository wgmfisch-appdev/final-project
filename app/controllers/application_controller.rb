class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, raise: false
end
