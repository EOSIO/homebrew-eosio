class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.4.3.tar.gz"
   version "1.4.3"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.4.3"
      sha256 "0d80b7d6d439f0c561a358ccc1b25199c9301efa13637d073ebb33d1719dc51e" => :high_sierra
      sha256 "b5f99b768c45025eb91f244d2f1449d1622a7a75fda73e4ece66e6699026783a" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
