class vim::params {

  Package { allow_virtual => true }

  $vimpkg = $osfamily ? {
    'RedHat' => 'vim-enhanced',
    default => 'vim',
  }

  $cmakepkg = $osfamily ? {
    default => 'cmake',
  }

  $pythondev = $osfamily ? {
    'RedHat' => 'python-devel.x86_64',
    default => 'cmake',
  }
}
