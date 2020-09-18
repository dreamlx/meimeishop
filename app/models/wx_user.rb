class WxUser < ApplicationRecord

  def reset_authentication_token!
   update authentication_token: Devise.token_generator.generate(WxUser, :authentication_token).first
  end


end
