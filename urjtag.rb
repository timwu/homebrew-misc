require 'formula'

class Urjtag < Formula
  homepage 'http://urjtag.org/'
  url 'http://sourceforge.net/projects/urjtag/files/urjtag/0.10/urjtag-0.10.tar.gz'
  sha1 '1e21f07d758e9e151d932e95c0b3b11fd178eace'

  depends_on 'libusb-compat'

  option 'opendous', 'Compile with opendous cable support'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "make check"
  end
  
  def patches
    if build.include? 'opendous'
      # add opendous cable support
      'https://raw.github.com/gist/3127865/8a1af629eb4d859e19bb28b0c4c69f94e091e46c/urjtag-0.10-opendous.patch'
    end
  end 
end
