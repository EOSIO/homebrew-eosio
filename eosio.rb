class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.0.10.tar.gz"
   version "2.0.10"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on :macos => :mojave
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.0.10"
      sha256 "fa395380186f3cd545da7444f3b38ccf5bd0ace0f4f85bd7023f15eb5066bfb8" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
