class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.8.0.tar.gz"
   version "1.8.0"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.8.0"
      sha256 "7934edc77f0f07443cfb18d253c898ed22179c721d55b4c02846bf9d82b90b9e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
