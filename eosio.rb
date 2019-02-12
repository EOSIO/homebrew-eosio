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
      sha256 "9ee3e4caf021667204cb773740cfd4223790349f79a6d6bc5b3a43695f9fb7de" => :high_sierra
      sha256 "69de0649dc60109bfa8462e2c6f124e40e54efcd8a6c13ba38251e812ec0342e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
