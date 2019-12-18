class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.7.tar.gz"
   version "1.8.7"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.7"
      sha256 "06535deeeef7c11ef26ca0915e9715c70baa4ac7296d0840cf9d9d3687caed65" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
