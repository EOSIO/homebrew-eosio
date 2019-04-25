class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.7.3.tar.gz"
   version "1.7.3"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.7.3"
      sha256 "6341735bd9644daf70103f5d866acb4f7389a3a51bdbb880c8b3245fb674a258" => :high_sierra
      sha256 "b7568a21bd3b8cc3e2d5a140efa12ab9053ce5ae9f2ec7f0b22faf17e48ff091" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
