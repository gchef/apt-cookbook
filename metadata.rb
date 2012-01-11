maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Configures apt and apt services and an LWRP for managing apt repositories"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.1.2"

recipe            "apt", "Runs apt-get update during compile phase and sets up preseed directories"
recipe            "apt::cacher", "Set up an APT cache"
recipe            "apt::cacher-client", "Client for the apt::cacher server"

supports "ubuntu"
supports "debian"
