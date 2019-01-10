module LayimHelper
  include ERB::Util
  include GravatarHelper::PublicMethods
  
  def avatar_url(user, options = { })
    if Setting.gravatar_enabled?
      options.merge!(:default => Setting.gravatar_default)
      email = nil
      if user.respond_to?(:mail)
        email = user.mail
      elsif user.to_s =~ %r{<(.+?)>}
        email = $1
      end
      if email.present?
        gravatar_url(email.to_s.downcase, options) rescue nil
      elsif user.is_a?(AnonymousUser)
        '/plugin_assets/redmine_layim/images/default_avatar.png'
      else
        '/plugin_assets/redmine_layim/images/default_avatar.png'
      end
    else
      '/plugin_assets/redmine_layim/images/default_avatar.png'
    end
  end
end
