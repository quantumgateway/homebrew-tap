class Dbmigrate < Formula
  desc "Database migration tool for ClickHouse"
  homepage "https://github.com/quantumgateway/dbmigrate"
  url "https://github.com/quantumgateway/dbmigrate/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/dbmigrate --help", 1)
  end
end
