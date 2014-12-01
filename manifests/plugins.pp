class vim::plugins inherits vim::params {
  require vim::base
  require vim::dependencies

  file { '.vim':
    path    => '/home/vagrant/.vim',
    ensure  => link,
    target  => '/home/vagrant/.dotfiles/vim',
  } ->
  vcsrepo { "dotfiles":
    owner     => 'vagrant',
    group     => 'vagrant',
    path       => '/home/vagrant/.dotfiles',
    ensure   => present,
    provider => git,
    source   => 'https://github.com/tcuthbert/dotfiles.git',
    } ~>
    vcsrepo { "/home/vagrant/.vim/bundle/Vundle.vim":
      ensure   => present,
      provider => git,
      source   => 'https://github.com/gmarik/Vundle.vim.git',
      owner     => 'vagrant',
      group     => 'vagrant',
    } ->
    file { "/home/vagrant/.dotfiles":
      owner   => "vagrant",
      group   => "vagrant",
      recurse => true,
    } ->
    file { '.vimrc':
      path    => '/home/vagrant/.vimrc',
      ensure  => link,
      target  => '/home/vagrant/.dotfiles/vimrc',
      } ~>
      exec { "clone_vim_plugins":
        path        => "/bin:/usr/bin:/usr/local/bin",
        user        => 'vagrant',
        provider    => "shell",
        command     => '! echo -e "\r" | sudo -u vagrant vim \'+PluginInstall\' \'+q\'; exit 0',
        timeout     => 1200,
        refreshonly => true,
        notify      => Class["vim::plugins::build"],
      }

      include vim::plugins::build
      anchor { 'begin': } -> Class['vim::plugins::build'] -> anchor { 'last': }
}
