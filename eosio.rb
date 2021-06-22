class Eosio < Formula
   # typed: false
   # frozen_string_literal: true

   homepage "https://github.com/eosio/eos"
   revision 0
   url "https://github.com/eosio/eos/archive/v2.1.0.tar.gz"
   version "2.1.0"

   option :universal

   depends_on "gmp"
   depends_on "openssl@1.1"
   depends_on "libusb"
   depends_on "libpqxx"
   depends_on macos: mojave
   depends_on arch: intel

   bottle do
      root_url "https://github.com/eosio/eos/releases/download/v2.1.0"
      sha256 mojave: "ab2d846b9ed92ca086f3d1d3974caf5aee27f0fbcfc1e5da42d4466ab913f34f" 
      sha256 catalina: "9956ea19b84df6453513aa4d99dbd09a97192c5beb89e4819d32cafb46f6f5f5" 
   end
   def install
      raise "Error, only supporting binary packages at this time"
   end
end
__END__
