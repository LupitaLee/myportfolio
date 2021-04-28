class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if
        is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
    def failure
      redirect_to root_path
    end
    def destroy
      session.delete
      redirect_to root_path
    end
end

    # def facebook
    #     @user = User.from_omniauth(request.env["omniauth.auth"])
    #     if @user.persisted?
    #       sign_in_and_redirect @user, :event => :authentication
    #       set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    #     else
    #       session["devise.facebook_data"] = request.env["omniauth.auth"]
    #       redirect_to new_member_registration_url
    #     end
    #   end
    #   def failure
    #     redirect_to root_path
    # end






    # def google_oauth2
    #     @user = User.create_from_provider_data(request.env['omniauth.auth'])
    #     if @user.persisted?
    #         sign_in_and_redirect @user 
    #         set_flash_message(:notice, :sucess, kind: 'google') if is_navigational_format?
    #     else
    #         flash[:error] = 'there was a problem signing you in through Google. Please register or try signing in later.'
    #         redirect_to new_user_regirstration_url

    #     end
    # end

   
  
