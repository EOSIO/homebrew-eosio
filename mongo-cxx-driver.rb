class MongoCxxDriver < Formula
  desc "C++ driver for MongoDB"
  homepage "https://github.com/mongodb/mongo-cxx-driver"
  url "https://github.com/mongodb/mongo-cxx-driver/archive/r3.4.0.tar.gz"
  sha256 "e9772ac5cf1c996c2f77fd78e25aaf74a2abf5f3864cb31b18d64955fd41c14d"
  head "https://github.com/mongodb/mongo-cxx-driver.git"

  bottle do
    cellar :any
    sha256 "da2aacd94c60bbdd1c4f7b4c0103ac90857d41733f0d95666370a878539a9084" => :mojave
    sha256 "f08a8bc08e9320b81a2142b100a43cc40aa010040c01815f345f9556d45e7a41" => :high_sierra
    sha256 "98fec6ef3256c3955dd29fcfe825faf575f9d71f0f3061b65be62f2b558148ed" => :sierra
  end

  depends_on "cmake" => :build
  depends_on "mongo-c-driver"

  needs :cxx11

  def install
    mongo_c_prefix = Formula["mongo-c-driver"].opt_prefix
    system "cmake", ".", *std_cmake_args, "-DBUILD_SHARED_LIBS=OFF", "-DLIBBSON_DIR=#{mongo_c_prefix}", "-DLIBMONGOC_DIR=#{mongo_c_prefix}"
    system "make"
    system "make", "install"
    pkgshare.install "examples"
  end

  test do
    mongo_c_include = Formula["mongo-c-driver"]

    system ENV.cc, "-o", "test", pkgshare/"examples/bsoncxx/builder_basic.cpp",
      "-I#{include}/bsoncxx/v_noabi",
      "-I#{mongo_c_include}/libbson-1.0",
      "-L#{lib}", "-lbsoncxx", "-std=c++11", "-lstdc++"
    system "./test"

    system ENV.cc, "-o", "test", pkgshare/"examples/mongocxx/connect.cpp",
      "-I#{include}/mongocxx/v_noabi",
      "-I#{include}/bsoncxx/v_noabi",
      "-I#{mongo_c_include}/libmongoc-1.0",
      "-I#{mongo_c_include}/libbson-1.0",
      "-L#{lib}", "-lmongocxx", "-lbsoncxx", "-std=c++11", "-lstdc++"
    assert_match "No suitable servers",
      shell_output("./test mongodb://0.0.0.0 2>&1", 1)
  end
end
