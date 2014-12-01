class vim::base inherits vim::params {

  package { $vimpkg:
    ensure  => installed,
  }
}
