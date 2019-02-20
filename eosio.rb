class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.6.1.tar.gz"
   version "1.6.1"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on "gmp"
   depends_on :xcode
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.6.1"
      sha256 "947f40cb3a8ba66666a30f6f57395ae1bd9ea1a54396bad67c43b0bc1e7a5259" => :high_sierra
      sha256 "cfb4f6b097c8bb915095df845b7ab35ed4cedf65c732c0f8c229d9611a2ed35c" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
