class Tmux19a < Formula
  desc "Terminal multiplexer (v1.9a)"
  homepage 'https://tmux.github.io/'
  url 'https://github.com/tmux/tmux/releases/download/1.9a/tmux-1.9a.tar.gz'
  sha256 'c5e3b22b901cf109b20dab54a4a651f0471abd1f79f6039d79b250d21c2733f5'

  depends_on 'pkg-config' => :build
  depends_on 'libevent'

  conflicts_with "tmux", :because => "this is an older version of tmux"

  def install
    system "sh", "autogen.sh" if build.head?

    ENV.append "LDFLAGS", '-lresolv'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make", "install"

    bash_completion.install "examples/bash_completion_tmux.sh" => 'tmux'
    (share/'tmux').install "examples"
  end

  def caveats; <<-EOS.undent
    Example configurations have been installed to:
      #{share}/tmux/examples
    EOS
  end

  test do
    system "#{bin}/tmux", "-V"
  end
end
