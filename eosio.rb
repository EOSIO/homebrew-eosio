class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.7.2.tar.gz"
   version "1.7.2"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.7.2"
      sha256 "0a513e03d7750a317ad877261386482d6730222b1237bac4cdaf0b188563df61" => :high_sierra
      sha256 "8821a4afaca30512cf8c43861bd4677b13ccb9b4c803b7f80b237e58c4616463" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
