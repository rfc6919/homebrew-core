require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.25.tgz"
  sha256 "b8cb7b3f247d7846392ef2c5bb60c3ff77a779d4157db540927990f056a2d541"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "e8c52261b9cdda244abfec30dcf7bed8f74e92f3505dd47a4926b59d3144c136"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
