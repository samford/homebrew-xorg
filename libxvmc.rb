class Libxvmc < Formula
  desc "Xorg Libraries: libXvMC"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXvMC-1.0.9.tar.bz2"
  sha256 "0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "libx11"     =>  :build
  depends_on "libxext"    =>  :build
  depends_on "libxv"      =>  :build
  depends_on "xextproto"  =>  :build
  depends_on "videoproto" =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end