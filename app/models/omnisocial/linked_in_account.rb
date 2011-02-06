module Omnisocial
  class LinkedInAccount < LoginAccount
    def assign_account_info(auth_hash)
      self.remote_account_id   = auth_hash['uid']
      self.picture_url         = auth_hash['user_info']['image']
      self.name                = auth_hash['user_info']['first_name']
      self.access_token        = auth_hash['credentials']['token']
      self.access_token_secret = auth_hash['credentials']['secret']
    end
  
    def account_url
      "http://www.linkedin.com/profile/view?id=#{self.remote_account_id}"
    end
  end
end

