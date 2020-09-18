class Api::SmallRoutine::BaseController < ApplicationController

  def authenticate_user!
    token = http_token
    unauthenticated! and return if token.empty?
    @current_wx_user = WxUser.find_by!(authentication_token: token)
  rescue
    unauthenticated!
  end

  def unauthenticated!
    render json: {status: 401, message: 'Unauthorized'}
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

end
