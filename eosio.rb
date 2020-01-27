class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.1.tar.gz"
   version "2.0.1"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.1"
      sha256 "86f0f019729482ea963786a1d99943b316ce94ecc66e3a893f82b3dad33b473e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
