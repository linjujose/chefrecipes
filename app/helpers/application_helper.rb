module ApplicationHelper

    def gravatar_for(user, options = {size: 80})
        #default_avatar = 'images/avatar_unisex.png'
        #default_fallback_url = "&d=#{CGI.escape(default_avatar)}"
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt:user.chefname, class: "img-circle")
    end
end
