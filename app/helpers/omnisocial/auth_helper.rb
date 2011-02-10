module Omnisocial
  module AuthHelper
    def auth_request_path(options = {})
      "/auth/#{options[:service]}"
    end

    def big_twitter_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Twitter'), :class => 'omnisocial-button twitter', :href => auth_request_path(:service => 'twitter'))
    end

    def big_facebook_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Facebook'), :class => 'omnisocial-button facebook', :href => auth_request_path(:service => 'facebook'))
    end

    def big_linkedin_login_button
      content_tag(:a, content_tag(:span, 'Sign in with LinkedIn'), :class => 'omnisocial-button linkedin', :href => auth_request_path(:service => 'linked_in'))
    end

    def big_github_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Github'), :class => 'omnisocial-button github', :href => auth_request_path(:service => 'github'))
    end
  end
end
