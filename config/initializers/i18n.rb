require 'i18n'
require 'i18n/backend/fallbacks'

configure do
  I18n::Backend::Simple.send :include, I18n::Backend::Fallbacks
  I18n.load_path += Dir[File.join settings.root, 'config', 'locales', '*.yml']
  I18n.backend.load_translations

  I18n.available_locales = [:es, :en]
  I18n.default_locale = I18n.available_locales.first
end

# Languages module
module I18n
  module_function

  def global_locales
    %i(es en)
  end

  def locales_path(locales = nil)
    locales ||= I18n.global_locales
    %r{^/(#{Regexp.union locales.map(&:to_s)})}
  end
end
