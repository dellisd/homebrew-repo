class Porter < Formula
  desc "Command line tool for syncing arbitrary files."
  homepage "https://github.com/dellisd/porter"
  version "latest"
  head "https://github.com/dellisd/porter.git"

  if OS.mac?
    depends_on "curl"

    if Hardware::CPU.arm?
      url "https://github.com/dellisd/porter/releases/download/latest/porter-macosArm64.zip"
    else
      odie "X64 is not currently supported."
    end
  else
    if Hardware::CPU.intel?
      url "https://github.com/dellisd/porter/releases/download/latest/porter-linuxX64.zip"
    else
      odie "ARM is not currently supported."
    end
  end

  def install
    bin.install "porter.kexe" => "porter"
  end

  test do
    output = shell_output("#{bin}/porter --help")
    assert_includes output, "Usage: porter"
  end
end
