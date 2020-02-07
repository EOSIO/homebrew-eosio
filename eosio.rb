class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.2.tar.gz"
   version "2.0.2"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.2"
      sha256 "676ec95042718686e37ea9f6f30b828217bc3f798a85dd67c48d17538e276c5b" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
