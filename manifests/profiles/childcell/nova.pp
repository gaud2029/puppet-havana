class havana::profiles::childcell::nova {

  anchor { 'havana::profiles::childcell::nova': }
  Class { require => Anchor['havana::profiles::childcell::nova'] }

  class { 'cubbystack::nova':
    settings => hiera_hash('havana::nova::settings'),
  }

  class { 'cubbystack::nova::cells': }
  class { 'cubbystack::nova::cert': }
  class { 'cubbystack::nova::conductor': }
  class { 'cubbystack::nova::objectstore': }
  class { 'cubbystack::nova::scheduler': }
  class { 'cubbystack::nova::vncproxy': }
  class { 'cubbystack::nova::db_sync': }

  ## Generate an openrc file
  cubbystack::functions::create_openrc { '/root/openrc':
    keystone_host  => hiera('havana::keystone_host'),
    admin_password => hiera('havana::keystone::admin::password'),
    admin_tenant   => 'admin',
    region         => hiera('havana::region'),
  }

  ## Copy the prep file
  file { '/root/prep.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/havana/prep.sh',
  }

}
