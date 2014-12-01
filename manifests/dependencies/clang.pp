class vim::dependencies::clang inherits vim::params {

  $clang = $osfamily ? {
    "RedHat" => 'clang-devel',
    default => 'clang',
  }

  $clang_deps = $osfamily ? {
    'RedHat' => "epel-release",
    default  => "",
  }

  if $clang_deps != "" {
    package { "$clang_deps":
      ensure => installed,
    }
  }

  package { "$clang":
    ensure  => installed,
    require => Package[$clang_deps],
  }
}
