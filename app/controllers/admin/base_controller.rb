class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  private

  # TODO
  def authenticate_admin!
    #has_role
  end

end
