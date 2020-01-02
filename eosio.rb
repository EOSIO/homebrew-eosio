class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.8.tar.gz"
   version "1.8.8"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.8"
      sha256 "9cbdba8517b2350e9fa91a9e2dd51d985f8cb5128ef4c93ecd3f7c6afc3f9d93" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
