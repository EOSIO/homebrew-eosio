class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.4.4.tar.gz"
   version "1.4.4"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.4.4"
      sha256 "d3df1b6359c306490764ecae820a615710ed51603489f419a02df1d3e374efbf"=> :high_sierra
      sha256 "07bdc94d561c72bee5ac57650e9a199dab8ef2e9eed8f8f9aec18df530b34d46" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
