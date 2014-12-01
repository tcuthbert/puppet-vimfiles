class vim::plugins::build inherits vim::plugins {

  notify { "building YCM plugin": }
  exec { "YouCompleteMe/install.sh":
    user         => "vagrant",
    path         => "/bin:/usr/bin:/usr/local/bin",
    command      => "/home/vagrant/.vim/bundle/YouCompleteMe/install.sh --clang-completer",
    provider     => "shell",
    logoutput    => false,
    timeout      => 1800,
    require      => Package["$cmakepkg"],
    refreshonly => true,
  } ->
  file { "/home/vagrant/.dotfiles/vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so":
    ensure => link,
    target => '/usr/lib64/llvm/libclang.so',
  } ->
  notify { "YCM built": }
}
