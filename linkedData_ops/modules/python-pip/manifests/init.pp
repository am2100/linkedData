class python-pip {
  package {
    "python-pip":
      ensure => present,
	  before => Exec["pip-install-rdflib"]
  }
  
  exec { "pip-install-rdflib":
    command => "pip install rdflib"
  }
}