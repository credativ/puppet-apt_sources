define apt_sources::source(
    $ensure,
    $location,
    $release,
    $repos,
    $required_packages = undef,
    $key = undef,
    $key_server = undef,
    $pin = undef,
    $include_src = undef,
    $key_source = undef,
    $key_content = undef,
    $architecture = undef,
) {

    if $key_content {
        if !defined(Apt::Key[$key]) {
            apt::key { $key:
                ensure      => $ensure,
                key_content => $key_content,
                before      => Apt::Source[$title]
            }
        }
    }

    if $key_source {
        if !defined(Apt::Key[$key]) {
            apt::key { $key:
                ensure      => $ensure,
                key_source  => $key_source,
                before      => Apt::Source[$title]
            }
        }
    }

    apt::source { $title:
        ensure              => $ensure,
        location            => $location,
        release             => $release,
        repos               => $repos,
        required_packages   => $required_packages,
        key                 => $key,
        key_server          => $key_server,
        pin                 => $pin,
        include_src         => $include_src,
        architecture        => $architecture,
    }
}
