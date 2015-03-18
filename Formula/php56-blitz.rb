require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Blitz < AbstractPhp56Extension
  init
  homepage 'http://alexeyrybak.com/blitz/blitz_en.html'
  url 'https://github.com/alexeyrybak/blitz/archive/v0.8.18.tar.gz'
  sha1 'c51233a241943faf74c6d28622277ff26d299cb8'

  bottle do
    root_url "https://homebrew.bintray.com/bottles-php"
    sha1 "9f7e1a330354cb03905ab9aec3adae94f3e6fa96" => :yosemite
    sha1 "918311273d2bd48ff4950ca21c4b561defd597e2" => :mavericks
    sha1 "c4e63adaedfa5571da13875177292231c8df56e3" => :mountain_lion
  end

  head 'https://github.com/alexeyrybak/blitz.git'

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/blitz.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      blitz.auto_escape=0
      blitz.check_recursion=1
      blitz.comment_close="*/"
      blitz.comment_open="/*"
      blitz.enable_alternative_tags=1
      blitz.enable_callbacks=1
      blitz.enable_comments=0
      blitz.enable_include=1
      blitz.enable_php_callbacks=1
      blitz.lower_case_method_names=1
      blitz.path=""
      blitz.php_callbacks_first=1
      blitz.remove_spaces_around_context_tags=1
      blitz.scope_lookup_limit=0
      blitz.tag_close="}}"
      blitz.tag_close_alt="-->"
      blitz.tag_open="{{"
      blitz.tag_open_alt="<!--"
      blitz.throw_exceptions=0
      blitz.var_prefix="$"
      blitz.warn_context_duplicates=0
    EOS
  end
end
