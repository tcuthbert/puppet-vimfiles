class vim::dependencies::cmake inherits vim::params {

  package { "$cmakepkg":
    ensure => installed,
  }

  if $osfamily == "RedHat" {
    package { ["libstdc++-devel.i686", "libstdc++-devel.x86_64", "libstdc++-static.x86_64"]:
      ensure => installed,
    }
  }
}
