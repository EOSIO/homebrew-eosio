class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.4.tar.gz"
   version "2.0.4"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.4"
      sha256 "3a4ade57555c16a225341f868b66ea3b1b900399e4e6662a3d5505dc3e95161b" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
