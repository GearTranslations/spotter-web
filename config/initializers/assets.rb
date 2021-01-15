configure do
  assets_root = settings.root

  assets do
    # Stylesheets
    serve '/css', from: 'assets/css'

    Less.paths << "#{assets_root}/css"
    # Heroku does have an ephimeral filesystem, so packages cannot be used.
    # css :application, '/css/application.css', ['/css/lib/*.css', '/css/*.css']
    css_compression :less

    # Javascripts
    serve '/js', from: 'assets/js'
    # js :lib, 'js/lib.js', ['/js/lib/jquery.js']
    # js_compression :uglify

    # Images
    serve '/images', from: 'assets/images'

    # Fonts
    serve '/fonts', from: 'assets/css/fonts'
  end
end
