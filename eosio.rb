class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.9.tar.gz"
   version "1.8.9"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.9"
      sha256 "e8c890f031d911a832a193898aa106184fdf55eeb12adb72690d7e0833430699" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
