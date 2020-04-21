class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.5.tar.gz"
   version "2.0.5"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.5"
      sha256 "b6993a7089847be52e1e0754b132ae774f5c5b707c87ffce6af29b15d923e842" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
