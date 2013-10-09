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
    $key_source = undef
) {

    if $key_source {
	apt::key { $title:
		ensure	   => $ensure,
		key_source => $key_source
	}
    }

    apt::source { $title:
	ensure		    => $ensure,
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
