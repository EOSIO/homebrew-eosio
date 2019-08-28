class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.2.tar.gz"
   version "1.8.2"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.2"
      sha256 "a63e92b5b8214dd5d18be919b5815d08adb404561ce60bfff64fb88dd037bb4b" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
