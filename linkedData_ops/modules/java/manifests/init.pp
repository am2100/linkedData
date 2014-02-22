class java {

  exec { "add-java-repository":
    command => 'echo "deb http://www.duinsoft.nl/pkg debs all" | sudo tee /etc/apt/sources.list.d/oracle-java.list'
  }

  exec { "setup-package-authentication":
    command => "sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26",
    require => Exec["add-java-repository"],
  }

  exec { "apt-get-update":
    command => "sudo apt-get update",
    require => Exec["setup-package-authentication"],
  }

#  exec { "install-jre":
#    command => "sudo apt-get install update-sun-jre",
#    require => Exec["apt-get-update"],
#  }

  package { "update-sun-jre":
    ensure => present,
    require => Exec["apt-get-update"],
  }
}

# echo "deb http://www.duinsoft.nl/pkg debs all" | sudo tee /etc/apt/sources.list.d/oracle-java.list
# sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26
# sudo apt-get update
# sudo apt-get install update-sun-jre
