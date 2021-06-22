# typed: false
# frozen_string_literal: true

class Eosio < Formula
  homepage "https://github.com/eosio/eos"
  url "https://github.com/eosio/eos/archive/v2.1.0.tar.gz"
  version "2.1.0"
  revision 0

  bottle do
    root_url "https://github.com/eosio/eos/releases/download/v2.1.0"
    sha256 mojave: "c3f66cdf5fb02469a9e8d11cb2637eb347ba44b2b68ef77d84bdb1401d6bb685"
  end

  bottle do
    root_url "https://github.com/eosio/eos/releases/download/v2.1.0"
    sha256 catalina: "b1562e0e2d97288104839884871212d4c2ab1b54b0764aa9bb5f24bb1d5d37ab"
  end
  option :universal

  depends_on arch: :intel
  depends_on "gmp"
  depends_on "libpqxx"
  depends_on "libusb"
  depends_on macos: :mojave
  depends_on "openssl@1.1"
  def install
    raise "Error, only supporting binary packages at this time"
  end
end
__END__
