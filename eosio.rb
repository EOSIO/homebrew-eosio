class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.6.1.tar.gz"
   version "1.6.1"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.6.1"
      sha256 "0cda83dcfdfd722ae505e40143b584e1f4c5fa045a6d19e2bdfa0b86aea81122" => :high_sierra
      sha256 "07683299f0f5beca5ec9d43a5dba6658bcb6f86e814b767a07bf784690102fba" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
