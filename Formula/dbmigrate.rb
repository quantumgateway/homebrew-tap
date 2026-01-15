class Dbmigrate < Formula
  desc "Database migration tool for ClickHouse"
  homepage "https://github.com/quantumgateway/dbmigrate"
  url "https://github.com/quantumgateway/dbmigrate/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "26f04804bd7a3509a27dfff99667cd8163a6835dc0f75fd89bd42ca69ef60f3a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=v1.0.3")
  end

  test do
    assert_match "dbmigrate", shell_output("#{bin}/dbmigrate --help 2>&1")
  end
end
