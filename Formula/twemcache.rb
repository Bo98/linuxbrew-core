class Twemcache < Formula
  desc "Twitter fork of memcached"
  homepage "https://github.com/twitter/twemcache"
  url "https://github.com/twitter/twemcache/archive/v2.6.3.tar.gz"
  sha256 "ab05927f7d930b7935790450172187afedca742ee7963d5db1e62164e7f4c92b"
  license "BSD-3-Clause"
  revision 1
  head "https://github.com/twitter/twemcache.git"

  bottle do
    cellar :any
    sha256 "125878f0cdb71a5ac116ddcdfc139fd43d8ca2415e450c78bb25ff20cf65132e" => :big_sur
    sha256 "64238f0d8c99fad48b6d3f780f2e42557caa316e807a3a411fbeab3a649fc0c3" => :catalina
    sha256 "2c7fd2ce03cc16859264882f478137de35ece42a26ad9b10f23d668ddc1883d4" => :mojave
    sha256 "9cc173642f9e53b723321a3013f2327b8a712c528c53ac5bd9fd2b9420244fcb" => :high_sierra
    sha256 "ec7e5d41f887db3a41d89eadb64d16119a2d86427afd45de92e7a8ca55ce7ef2" => :sierra
    sha256 "8af52d72baa82aa688966c52259d2e1f767461bd832e97840aa1bfb42b63113e" => :x86_64_linux
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libevent"

  def install
    system "autoreconf", "-fvi"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system bin/"twemcache", "--help"
  end
end
