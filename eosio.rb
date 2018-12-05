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
      sha256 "9116553737415b3e6c9f541fb6c6a58bdbc48479e950fae8874ac175574e45e6" => :high_sierra
      sha256 "f0142128f4749edb2a3da9aaaefbf5587428769340c0444f8702094c28e201ee" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
