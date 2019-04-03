class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.7.1.tar.gz"
   version "1.7.1"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.7.1"
      sha256 "36a2ed761fd08d4fe8875021f1ff62728f2b7edfdb83df972e46c39e56da6441" => :high_sierra
      sha256 "cf1d98ca32c7fb7c62c7267452ccbaec25dffa44fd0219cbf722c29329ed3b76" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
