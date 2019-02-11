# Bliss Run Configuration

# Recaptcha keys - private key exposed really isn't a security breach
# Possible denial of service or proxing as our domain to solve captchas...
# http://groups.google.com/group/recaptcha/browse_thread/thread/bab1dc08fcb94e58/6916dc9a9be05eb2
# http://groups.google.com/group/recaptcha/browse_thread/thread/62741f9e93755a75/24a3006154c44855

Recaptcha.configure do |config|
  config.site_key = '6LcI6AITAAAAANPpskrw90V9qIwVRlyF6Dr0nMBU'
  config.secret_key = '6LcI6AITAAAAAB3fL-Nmc-hpTU4XeMBGSkzXouyT'
end

# HTML 5
Haml::Template.options[:format] = :html5

# https://github.com/rails/sass-rails
Blissrun::Application.configure do
  config.sass.preferred_syntax = :sass
  config.sass.line_comments = false
  config.sass.cache = false
end
