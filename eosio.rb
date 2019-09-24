class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.4.tar.gz"
   version "1.8.4"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.4"
      sha256 "c347b0fecbbc25c01e6e5187bc7f3b815859f8eb6231cf6394e473fa101e98f9" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
