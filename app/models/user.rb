class User < ActiveRecord::Base

  has_many :schemes

  def self.find_or_create_with_omniauth(auth_hash)
    if user = User.find_by_gh_uid(auth_hash['uid'])
      update_omniauth_info(user, auth_hash)
      user.save
      user
    else
      create do |user|
        update_omniauth_info(user, auth_hash)
      end
    end
  end

private

  def self.update_omniauth_info(user, auth_hash)
    user.name     = auth_hash['info']['name']
    user.username = auth_hash['info']['nickname']
    user.gh_uid   = auth_hash['uid']
    user.email    = auth_hash['info']['email']
    user.token    = auth_hash['credentials']['token']
  end

end
