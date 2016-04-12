# Talentica - bootstrap project
# Copyright   Ashwini Kumar
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
class RegistrationsController < Devise::RegistrationsController
  # registration of new user by overriding native devise
  before_filter :authenticate_user!

  def check_email_availabilty
    @user = User.has_email_as params["email"]
    @response = if @user.present?
                  {
                    available:   false,
                    message: "The Email id is already taken"
                  }
                else
                  {
                    available: true,
                    message: "The Email id is not with us"
                  }
                end
    respond_to do |format|
      format.json { render json: @response }
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  # override sign_up_params method
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname,
                                 :email, :password,
                                 :password_confirmation,
                                 :avatar)
  end

  # override sign_up_params method
  def account_update_params
    params.require(:user).permit(:firstname, :lastname,
                                 :email, :password,
                                 :password_confirmation, :current_password)
  end
end
