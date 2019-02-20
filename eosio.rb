class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.6.2.tar.gz"
   version "1.6.2"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.6.2"
      sha256 "bc8f64e22ba5fa3de786625675053c6c797c85d4c3aeb7723e765c21612c2f86" => :high_sierra
      sha256 "f3071253176c0fe99a1fd3e44289c4d9bc42a74d2597217348defed852e67b42" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
