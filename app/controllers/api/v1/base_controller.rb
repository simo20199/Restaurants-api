# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  acts_as_token_authentication_handler_for User
  # before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from StandardError,                with: :internal_server_error
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end
end
