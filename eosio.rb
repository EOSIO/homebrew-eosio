class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.4.1.tar.gz"
   version "1.4.1"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.4.1"
      sha256 "a66372ee0c3a4be467265f6fdb535ba1ad08bc409b70dd196c416f1e8aa3b529" => :high_sierra
      sha256 "33d8da3c9b88a8bb06286420249b59d1600e3eac5191b43d2a2dcb47d258be70" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
