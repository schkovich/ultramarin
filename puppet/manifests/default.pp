node 'dev.ultramarin.wp' {

  class {"web_server":}
  ->
  file {"/home/vagrant/opt/wordpress":
    ensure => link,
    target => "/ultramarin",
  }
  ->
  web_server::php {"php-${environment}": }
  ->
  class { 'web_server::vhosts::test':
    client_max_body_size => hiera('web_server::nginx::client_max_body_size')
  }
  ->
  class { 'mysql::server':
    root_password => 'x248aGent#'
  }
  ->
  class { 'mysql::bindings':
    php_enable => true
  }
  ->
  class { 'wordpress':
    wp_owner    => 'www-data',
    wp_group    => 'www-data',
    install_dir => '/home/vagrant/opt/wordpress',
    db_user     => 'wordpress',
    db_password => 'x248agent',
  }
  ->
  file {"/home/vagrant/opt/wordpress/wp-content/themes/ultramarin":
    ensure => link,
    target => "/ultramarin",
  }
}
