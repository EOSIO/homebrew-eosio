class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.6.tar.gz"
   version "2.0.6"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.6"
      sha256 "e6c0b890b00eb9218e6e75d0494b660697cd9cbf20c06c8c48a3584e4fd9f8c3" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
