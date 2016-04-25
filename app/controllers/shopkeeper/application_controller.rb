class Shopkeeper::ApplicationController < ApplicationController
  before_action :authorize_shopkeeper!

  def index
  end

  private

  def authorize_shopkeeper!
    authenticate_user!

    unless current_user.shopkeeper?
      redirect_to root_path, alert: "You must be a shopkeeper to do that."
    end
  end
end
