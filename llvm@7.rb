class LlvmAT7 < Formula
  desc "Next-gen compiler infrastructure"
  homepage "https://llvm.org/"
  url "https://github.com/llvm-mirror/llvm.git",
    :branch   => "release_70",
    :revision => "dd3329aeb25d87d4ac6429c0af220f92e1ba5f26"
  version "7.1.0"

  bottle do
    root_url "https://eos-public-oss-binaries.s3-us-west-2.amazonaws.com"
    sha256 "1a60218550d6fda9a79e695e975675785823a25675626daf1dc1076b63bf2814" => :catalina
    sha256 "7e62b1d35995b4a23e02a82e846d39fdcfb7141dae7918e6a34f5d005539e9e5" => :mojave
    cellar :any
  end

  # Clang cannot find system headers if Xcode CLT is not installed
  pour_bottle? do
    reason "The bottle needs the Xcode CLT to be installed."
    satisfy { MacOS::CLT.installed? }
  end

  depends_on "cmake" => :build
  depends_on "libffi"

  def install
    ENV.libcxx if ENV.compiler == :clang
    ENV.permit_arch_flags

    args = %W[
      -DLLVM_TARGETS_TO_BUILD='host'
      -DLLVM_BUILD_TOOLS=false
      -DLLVM_ENABLE_RTTI=1
      -DCMAKE_BUILD_TYPE=Release
    ]

    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *(std_cmake_args + args)
      system "make -j#{ENV.make_jobs}"
      system "make", "install"
    end
    (share/"cmake").install "cmake/modules"
  end
end
