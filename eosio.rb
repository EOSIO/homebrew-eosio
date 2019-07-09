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
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.1"
      sha256 "f29fe13e6afe372d98d4b8b6003381a6d96c0773f049cf116515a4e46e4379a1" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
