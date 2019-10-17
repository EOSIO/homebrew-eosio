class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.5.tar.gz"
   version "1.8.5"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.5"
      sha256 "167a64f80fd81a961043523d18f8f7b20a179f7796a34109d226ef8cf11ab573" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
