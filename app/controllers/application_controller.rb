class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
    session[:locale] = I18n.locale unless current_user
  end

  def locale
    current_user.try(:locale) ||
      params[:user_locale] ||
      session[:locale] ||
      http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def set_card
    @card = if params[:id]
      current_user.cards.find(params[:id])
    else
      current_card
    end
  end

  def current_card
    return current_block_card if current_block
    regular_card
  end

  def current_block
    current_user.current_block
  end

  def current_block_card
    block = current_block.cards
    block.repeating.try(:first) || block.pending.try(:first)
  end

  def regular_card
    cards = current_user.cards
    cards.repeating.try(:first) || cards.pending.try(:first)
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
