# Bliss Run Configuration

# Haml options
Sass::Plugin.options[:style] = :expanded

# Recaptcha keys - private key exposed really isn't a security breach
# Possible denial of service or proxing as our domain to solve captchas...
# http://groups.google.com/group/recaptcha/browse_thread/thread/bab1dc08fcb94e58/6916dc9a9be05eb2
# http://groups.google.com/group/recaptcha/browse_thread/thread/62741f9e93755a75/24a3006154c44855
ENV['RECAPTCHA_PUBLIC_KEY']  = '6Le1VgYAAAAAANubqiC1fBhL-fcNpoPRWqfc8W-Z'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Le1VgYAAAAAABqDyXtKYkQvbWnlVmfOSL6eqtxc'

# Simple obfuscation of emails to thwart spambots crawling source code
addrs = %q(info mindfulness-subscribe mindfulness-unsubscribe).split.map do |e|
  e + "gro.nurssilb@".reverse
end

# See views/home/addresses.rjs for usage
ENV['EMAIL_ADDRESSES'] = <<-EOF
  <h2>Congratulations - you are human!</h2>

  Our email addresses:

  <p></p>
  <a href="mailto:#{addrs[0]}">#{addrs[0]}</a> (General)

  <p></p>
  <a href="mailto:#{addrs[1]}">#{addrs[1]}</a>

  <p></p>
  <a href="mailto:#{addrs[2]}">#{addrs[2]}</a>
EOF
