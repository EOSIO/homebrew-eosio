class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.4.0.tar.gz"
   version "1.4.0"
   
   option :universal

   depends_on "gmp" 
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel
  
   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.4.0"
      sha256 "b257e4505dcb1b11f7425ec3b85b8020018293948c93ebe3300ee650959c150e" => :high_sierra
      sha256 "b647c1bc91146d1393882f84adff96bfb7276db1fec729dbb43894b19dd5e24e" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
