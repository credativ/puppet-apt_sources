class apt_sources::source(
    $location,
    $release,
    $repos,
    $required_packages,
    $key,
    $key_server,
    $pin,
    $include_src,
    $keycontent
) {

    if $keycontent {
        file { '/etc/apt/key.d':
            ensure  => directory,
            owner   => 'root'
        }

        file { '/etc/apt/key.d/$title.key':
            ensure  => present,
            content => $keycontent,
            notify  => Exec["apt_key_$title"],
            require => File['/etc/apt/key.d']
        }

        exec { "apt_key_$title":
            command     => "/usr/bin/apt-key add /etc/apt/key.d/$title.key",
            refreshonly => yes
        }
}

    apt::source { $title:
        location            => $location,
        release             => $release,
        repos               => $repos,
        required_packages   => $required_packages,
        key                 => $key,
        key_server          => $key_server,
        pin                 => $pin,
        include_src         => $include_src,
    }
}