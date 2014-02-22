node 'dev.ultramarin.wp' {

  class {"web_server":}
  ->
  file {"/home/vagrant/opt/UltraMarinWp":
    ensure => link,
    target => "/project",
  }
  ->
  web_server::php {"php-${environment}": }
  ->
  class { 'web_server::vhosts::test':
    client_max_body_size => hiera('web_server::nginx::client_max_body_size')
  }
}
