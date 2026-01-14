class Dbmigrate < Formula
  desc "Database migration tool for ClickHouse"
  homepage "https://github.com/quantumgateway/dbmigrate"
  url "https://github.com/quantumgateway/dbmigrate/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e6af719e221407d8b2e6e4a0613904e2e82a428a97619c5ff9d16e05e25d63e2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/dbmigrate --help", 1)
  end
end
