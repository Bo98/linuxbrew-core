class Npush < Formula
  desc "Logic game simliar to Sokoban and Boulder Dash"
  homepage "http://npush.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/npush/npush/0.7/npush-0.7.tgz"
  sha256 "f216d2b3279e8737784f77d4843c9e6f223fa131ce1ebddaf00ad802aba2bcd9"
  head "svn://svn.code.sf.net/p/npush/code/"

  bottle do
    cellar :any_skip_relocation
    sha256 "ce2f958ef8d766791137266e74b7c2cd0843755d080ecbbd6a7074bc7d035c19" => :sierra
    sha256 "c37e743784c68e9c1bb1527d4c6161a5653831de44b3203be8c1cb07d9eeb7c2" => :el_capitan
    sha256 "d334de125247efff9ce8031cedbb240a493b355a66cae5e6687cefb414d69ffb" => :yosemite
  end

  def install
    system "make"
    pkgshare.install ["npush", "levels"]
    (bin/"npush").write <<-EOS.undent
      #!/bin/sh
      cd "#{pkgshare}" && exec ./npush $@
      EOS
  end
end
