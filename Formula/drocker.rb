class Drocker < Formula
  homepage "http://www.drocker.io"
  head "http://drocker.io/drocker.phar"
  url "http://drocker.io/drocker.phar"
  sha1 "350eae82d63a0d86e0ee438f33937f989df88d43"
  version '0.1.6'

  depends_on :macos => :mountain_lion

  def install
    libexec.install "drocker.phar"
    sh = libexec + "drocker"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/drocker.phar \"$@\"")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def caveats
    s = <<-EOS.undent
      Print some important notice to the user when `brew info <formula>` is
      called or when brewing a formula.
      This is optional. You can use all the vars like #{version} here.
    EOS
    s
  end

  test do
    system "false"
  end
end
