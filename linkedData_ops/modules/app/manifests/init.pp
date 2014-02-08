class app {
  file {
    ["/var/app/", 
    "/var/app/shared/",
    "/var/app/shared/config/"]:
    ensure => directory,
    owner  => vagrant,
    group  => vagrant,
    mode   => 775
  }
}