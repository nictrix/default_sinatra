helpers do
  def title
    if @title != nil
      return "#{@title} - #{Settings.application.name}"
    else
      return Settings.application.name
    end
  end

  def javascript(path)
    @javascript_paths||=[]
    @javascript_paths << "/javascripts/#{path}"
  end

  def javascript_controller
    html =''

    (@javascript_paths||[]).each do |javascript_path|
      html+="<script src='#{javascript_path}.js'></script>"
    end

    return html
  end

  def stylesheet(path)
    @stylesheets_paths||=[]
    @stylesheets_paths << "/stylesheets/#{path}"
  end

  def stylesheet_controller
    html = ''

    (@stylesheets_paths||[]).each do |stylesheet_path|
      html+="<link href='#{stylesheet_path}.css' rel='stylesheet'>"
    end

    return html
  end
end
