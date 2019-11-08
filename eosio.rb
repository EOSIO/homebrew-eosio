class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.6.tar.gz"
   version "1.8.6"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.6"
      sha256 "98f87d631420ffd576779398db4f31931857654b9b7be07ef637383460eb827d" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
