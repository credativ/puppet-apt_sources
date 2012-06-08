# = Define: apt_repos::repo
#
# Creates apt configuration file for an apt repo

define osf::repo (
    $key,
    $release=$title,
    $method='http',
    $host='localhost',
    $uri='repos/custom',
    $repos='main',
    $include_src=false
    ) {
    
    $location = "${method}://${host}/${uri}"
    apt::source { "osf_repo_${release}":
        location    => $location,
        release     => $release,
        repos       => $repos,
        include_src => $include_src,
        key         => $key,
        notify      => Exec['update_cache']
    }

    exec { 'update_cache':
        command     => '/usr/bin/apt-get update',
        refreshonly => true
    }
}
