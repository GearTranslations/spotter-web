helpers do
  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

  def path_without_locale
    path = request.path_info
    lang = I18n.global_locales.find { |l| path =~ %r{^\/#{l}($|\/)} }

    return path if lang.nil?

    path.sub %r{^\/#{lang}($|\/)}, ''
  end

  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == credentials
  end

  def js_include(*files)
    files.map { |f| "<script type='text/javascript' src='/js/#{f}.js'></script>" }.join
  end

  def css_include(*files)
    files.map { |f| "<link rel='stylesheet' href='/css/#{f}.css'>" }.join
  end

  def t(*keys, **opts)
    translate(*keys, **opts)
  end

  def translate(*keys, **opts)
    I18n.t(*keys, **opts)
  end

  def global_locale?(locale)
    I18n.global_locales.include?(locale.to_sym)
  end

  def available_locale?(locale)
    I18n.available_locales.include?(locale.to_sym)
  end

  def url_variables(actual)
    settings.actual_url = actual
  end

  def set_environment(locale, url)
    I18n.locale = I18n.available_locales.include?(locale.to_sym) ? locale : I18n.default_locale
    url_variables(url)
  end
end
