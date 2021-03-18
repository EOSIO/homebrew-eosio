class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.11.tar.gz"
   version "2.0.11"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.11"
      sha256 "a17e43ed61c665be93b93b20f794e451197c0b7756bc7632e740e744f4a4ef05" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
