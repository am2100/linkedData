class arq {

  # create /applications directory
  file { "/applications":
    ensure => "directory",
  }

  # fetch the arq tar file
  file { "/applications/apache-jena-2.11.1.tar.gz":
    source => "puppet:///modules/arq/apache-jena-2.11.1.tar.gz",
    require => File["/applications"],
  }

  # Untar arq files
  exec { "untar-arq":
    command => "tar xzf /applications/apache-jena-2.11.1.tar.gz",
    cwd => "/applications",
    require => File["/applications/apache-jena-2.11.1.tar.gz"],
  }

  # Setup the arq path
  exec { "arq-root":
    command => "bash -c \"export ARQROOT='/applications/apache-jena-2.11.1'\"",
    require => Exec["untar-arq"],
  }
}
