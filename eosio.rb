# typed: false
# frozen_string_literal: true

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.1.0.tar.gz"
   version "2.1.0"

  bottle do
    root_url "https://github.com/eosio/eos/releases/download/v2.0.12"
    sha256 mojave: "2e03b4fe73e0cdc70e607b35e35294f49d6833439176b4dedc846e62a3b77005"
  end

   depends_on "gmp"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on "libpqxx"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.1.0"
      sha256 "b1562e0e2d97288104839884871212d4c2ab1b54b0764aa9bb5f24bb1d5d37ab" => :catalina
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
