class ShellGpt < Formula
  include Language::Python::Virtualenv

  version = "1.0.1"

  desc "A command-line productivity tool powered by OpenAI's ChatGPT"
  homepage "https://github.com/TheR1D/shell_gpt"
  url "https://github.com/TheR1D/shell_gpt/archive/#{version}.tar.gz"
  sha256 "ecbbf7f707952b29c68d9e394f2196835da8e1d5cc3047e8a46e6d97ceb1e525"
  license "MIT"
  head "https://github.com/TheR1D/shell_gpt.git", branch: "main"

  depends_on "python@3.12"

  depends_on "python-click"
  depends_on "python-distro"
  depends_on "python-requests"
  depends_on "python-rich"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/source/t/typer/typer-0.9.0.tar.gz"
    sha256 "50922fd79aea2f4751a8e0408ff10d2662bd0c8bbfa84755a699f3bada2978b2"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.9.0.tar.gz"
    sha256 "23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ENV["OPENAI_API_KEY"] = "mock-api-key"
    version_output = shell_output("#{bin}/sgpt --version")
    assert_match "ShellGPT #{version}", version_output
  end
end
