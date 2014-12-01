class vim inherits vim::params {

  anchor { "vim_start": } ->
  class { "::vim::dependencies": } ->
  class { "::vim::base": } ->
  class { "::vim::plugins": }
  anchor { "vim_end": }
}
