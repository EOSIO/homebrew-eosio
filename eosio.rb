class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.9.tar.gz"
   version "2.0.9"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.9"
      sha256 "d497a0efcca1225f25501434aeffb0def78c35f4a038aedfeba453955be9025e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
