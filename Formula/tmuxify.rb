require "formula"

class Tmuxify < Formula
  homepage "https://github.com/tonchis/tmuxify"
  url "https://github.com/tonchis/tmuxify/archive/v1.2.1.tar.gz"
  sha256 "d63470875ccfef72f67483c2b926c7906bf1c37b2ce60a016ad9d8f06f3a14a3"

  depends_on "tmux"

  def install
    bin.install "bin/tmuxify" => "tmuxify"
  end
end
