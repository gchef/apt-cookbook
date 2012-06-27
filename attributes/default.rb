# Configure extra apt-sources
#
default[:apt][:ubuntu][:additions][:uri]        = "http://us.archive.ubuntu.com/ubuntu/"
default[:apt][:ubuntu][:additions][:sources]    = %w[backports]
default[:apt][:ubuntu][:additions][:components] = %w[main universe multiverse restricted]
