class Ndifftool < Formula
  desc "Lightweight graphical diff and merge tool"
  homepage "https://github.com/openrightorg/ndifftool"
  url "https://github.com/openrightorg/ndifftool/archive/refs/tags/v0.0.1.tar.gz"
  head "https://github.com/openrightorg/ndifftool.git", branch: "main"
  license "MIT"

  depends_on "node" => :build

  def install
    ENV.prepend_path "PATH", buildpath/"node_modules/.bin"
    system "npm", "install", "@neutralinojs/neu"
    system "make", "build", "NEU=#{buildpath}/node_modules/.bin/neu"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_predicate bin/"ndifftool", :exist?
    assert_predicate bin/"ndifftool", :executable?
    assert_predicate libexec/"ndifftool/ndifftool", :exist?
    assert_predicate libexec/"ndifftool/resources.neu", :exist?
  end
end
