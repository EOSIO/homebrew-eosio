class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.4.2.tar.gz"
   version "1.4.2"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.4.2"
      sha256 "465d1e9674ba530a63ea05548cc4bfe01ef564a3f4b842c24a21aca0a5cc3c50" => :high_sierra
      sha256 "969b018633ce59064ef956123bc051e85b9fc8b7f7c88804a06cda3ed2a27792" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
