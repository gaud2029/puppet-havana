class havana::roles::controller {

  class { 'cubbystack::repo': } ->
  class { 'cubbystack::utils': } ->
  class { 'havana::profiles::common::users': } ->
  class { 'havana::profiles::common::ovs': } ->
  class { 'havana::profiles::controller::memcached': } ->
  class { 'havana::profiles::controller::mysql': } ->
  class { 'qpid::server': } ->
  class { 'havana::profiles::controller::keystone': } ->
  class { 'havana::profiles::controller::glance': } ->
  class { 'havana::profiles::controller::nova': } ->
  class { 'havana::profiles::controller::cinder': } ->
  class { 'havana::profiles::controller::neutron': } ->
  class { 'havana::profiles::controller::horizon': }

}
