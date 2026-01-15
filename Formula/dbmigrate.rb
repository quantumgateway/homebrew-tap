class Dbmigrate < Formula
  desc "Database migration tool for ClickHouse"
  homepage "https://github.com/quantumgateway/dbmigrate"
  url "https://github.com/quantumgateway/dbmigrate/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7d87ef7cd2c6c3a33c1565b7917addd4eb4910ab603c2221f4db0a5f239264e0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=v1.0.2")
  end

  test do
    assert_match "dbmigrate", shell_output("#{bin}/dbmigrate --help 2>&1")
  end
end
