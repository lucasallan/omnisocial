module Omnisocial
  class AuthController < ApplicationController

    unloadable

    def new
      if current_user?
        flash[:notice] = 'You are already signed in. Please sign out if you want to sign in as a different user.'
        redirect_to(root_path)
      end
    end

    def callback
      @provider = formats_provider(request.env['rack.auth']['provider'])
      account = instance_eval("#{@provider}.find_or_create_from_auth_hash(request.env['rack.auth'])")
      self.current_user = account.find_or_create_user

      flash[:notice] = 'You have logged in successfully.'
      redirect_back_or_default(root_path)
    end

    def failure
      flash[:error] = "We had trouble signing you in. Did you make sure to grant access? Please select a service below and try again."
      render :action => 'new'
    end

    def destroy
      logout!
      redirect_to(root_path)
    end

    protected

    def formats_provider(provider)
      "Omnisocial::#{provider.camelize}Account" if ['twitter', 'linked_in', 'facebook'].include?(provider)
    end

  end

end
