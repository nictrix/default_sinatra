# frozen_string_literal: true

helpers do
  def logger
    $logger
  end

  def logged_in?
    session[:username].nil? ? false : true
  end

  def flash(msg)
    session[:flash] = msg
  end

  def show_flash
    return unless session[:flash]

    flash_message = session[:flash]
    session[:flash] = nil
    flash_message.to_s
  end
end

after do
  ActiveRecord::Base.clear_active_connections!
end
