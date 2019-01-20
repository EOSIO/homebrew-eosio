class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.5.1.tar.gz"
   version "1.6.0"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.6.0"
      sha256 "1b27064e91c02b5963cd2ae4492e6cdd9f92d353f4005445d75fbf95ce2d2a07" => :high_sierra
      sha256 "f0321b228bcd63df0e2ec4a68048dd9ac6b15f83c86d758d66d9e3a03219c659" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
