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
    if session[:flash]
      flash_message = session[:flash]

      session[:flash] = nil

      return "#{flash_message}"
    end
  end
end

before do
  ActiveRecord::Base.clear_active_connections!
end
