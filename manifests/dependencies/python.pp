class vim::dependencies::python inherits vim::params {

  package { "$pythondev":
    ensure => installed,
  }
}
