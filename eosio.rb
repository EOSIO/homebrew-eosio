class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.7.0.tar.gz"
   version "1.7.0"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on "libusb"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.7.0"
      sha256 "a7a07d94da8b0de1f7ba93d1601e35ab16633256562a8e1c490c750de495d57b" => :high_sierra
      sha256 "aa01b4bc4fb0c06dfdbfb849cb5e37ecd8a0f3277dce8798ab239bd4322e8abd" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
