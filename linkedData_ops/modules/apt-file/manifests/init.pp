class apt-file {
  package {
    "apt-file":
      ensure => present,
      before => Exec["apt-file-update"]
  }

  exec { "apt-file-update":
    command => "apt-file update"
  }
}