class Dri3proto < Formula
  desc "Xorg Protocol Headers: dri3proto"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/proto/dri3proto-1.0.tar.bz2"
  sha256 "01be49d70200518b9a6b297131f6cc71f4ea2de17436896af153226a774fc074"
  # tag "linuxbrew"

  # depends_on :autoconf
  depends_on "pkg-config"         =>  :build
  depends_on "util-macros"        =>  :build
  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "fop"                => [:build, :optional]
  depends_on "libxslt"            => [:build, :optional]
  depends_on "xmlto"              => [:build, :optional]
  depends_on "asciidoc"           => [:build, :optional]

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]

    system "./configure", *args
    system "make", "install"

  end
end