class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  private

  # TODO
  def authenticate_admin!
    #has_role
  end

end
