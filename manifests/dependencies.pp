class vim::dependencies {

  notify { 'Checking dependencies': } ->
  class { "::vim::dependencies::git": } ->
  class { "::vim::dependencies::clang": } ->
  class { "::vim::dependencies::cmake": } ->
  class { "::vim::dependencies::python": } ->
  notify { 'Finished dependencies': }
}
