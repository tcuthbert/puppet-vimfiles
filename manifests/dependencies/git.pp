class vim::dependencies::git {

  package { "git":
    ensure => installed,
  }
}
