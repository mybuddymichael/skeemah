class User < ActiveRecord::Base

  def self.create_with_omniauth(auth_hash)
    create do |user|
      user.name = auth_hash['info']['name']
      user.username = auth_hash['info']['nickname']
      user.gh_uid = auth_hash['uid']
      user.email = auth_hash['info']['email']
      user.token = auth_hash['credentials']['token']
    end
  end

end
