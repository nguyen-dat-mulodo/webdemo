class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :check_cart_valid
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end
  #
  # def default_url_options
  #   { locale: I18n.locale }
  # end


  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    def check_quantity_item
      cart=Cart.find(session[:cart_id])
      if cart.line_items.blank?
        cart.destroy
        session[:cart_id] = nil
        return true
      end
      return false
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, :notice => "Invalid cart"
    end
  protected
    def authorize
      authenticate_user!
    end

    def check_cart_valid
      unless session[:cart_id].nil?
        @cart = current_cart
      end
    end
end