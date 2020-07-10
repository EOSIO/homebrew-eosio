class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.7.tar.gz"
   version "2.0.7"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.7"
      sha256 "28fd8730d78dc9ef177ac0f7ae25d351dea52af32f065016d693c271d25c48e4" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
