class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.12.tar.gz"
   version "2.0.12"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.12"
      sha256 "2e03b4fe73e0cdc70e607b35e35294f49d6833439176b4dedc846e62a3b77005" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
