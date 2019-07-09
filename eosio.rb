class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.1.tar.gz"
   version "1.8.1"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.1"
      sha256 "28e79aa1261f8b58000d65a61561498dd868c75c0c7f974439b1164bda78d50f" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
