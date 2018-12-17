class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.5.1.tar.gz"
   version "1.5.1"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.5.1"
      sha256 "4cbaad84720951784d0f0b0e55c2497de2288114a7afd21b86de70e18c3c6654" => :high_sierra
      sha256 "9a9aba8030e1e04665f4577417db285c588c81ca9870d44c6bdcf1e77ce9205d" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
