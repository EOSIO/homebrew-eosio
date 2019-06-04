class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.7.4.tar.gz"
   version "1.7.4"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.7.4"
      sha256 "235e71dddaa7ffcbd52225490cb057b6b310e9ffc8ed3541ba3761aa9c4f2f36" => :high_sierra
      sha256 "d233ef57466a29619d5170ccf03c545b33219587767ad3ac1e39f9b15e1c6fd8" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
