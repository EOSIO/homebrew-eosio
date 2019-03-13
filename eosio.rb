class Eosio < Formula

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v1.6.3.tar.gz"
   version "1.6.3"

   option :universal

   depends_on "gmp"
   depends_on "gettext"
   depends_on "openssl"
   depends_on :macos => :high_sierra
   depends_on :arch =>  :intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v1.6.3"
      sha256 "ea267ebb3f6c2ddd73b4bf53120197190cb476b390134856a20a56069c20dbaa" => :high_sierra
      sha256 "457a3604196624458258aefc21eaf007b0e07401decfbcb1a1f3b603c053b87d" => :mojave
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
