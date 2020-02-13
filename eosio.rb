class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.3.tar.gz"
   version "2.0.3"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.3"
      sha256 "f9ce0c4c0e9315c4c0ac9aa94a654eac61c28e0e94303e670e718dd5d622631e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
