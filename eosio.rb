class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.3.tar.gz"
   version "1.8.3"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.3"
      sha256 "120fc0c5cecfc7b89e8407b73346dc18c5e6e37261db9baf6eae5c2c3e3bef1a" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
