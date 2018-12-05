class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.5.0.tar.gz"
   version "1.5.0"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.5.0"
      sha256 "6d7e0b594b1c26fa6d7eb958df75bb99246752ee387bc0fb4dd8ef791c75d53a" => :high_sierra
      sha256 "230102632e03a6db72c9ce335e3753e80acfcb04f40cba2fdfc01f5c0bd49e22" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
