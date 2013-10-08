# = Class: apt_sources
#
# Simple class to configure a bunch of custom repos
# (e.g. from hiera)
#
# == Parameters:
#
# [* repos *]
#   The repos to configure. See examples/repos.yaml for an example.
#
# == Example usage:
#
# include apt_sources

class apt_sources (
    $ensure     = params_lookup('ensure'),
    $repos      = params_lookup('apt_sources', 'global')
    ) inherits apt_sources::params {

    Class['apt'] -> Class['apt_sources']

    if $ensure == 'present' {
        create_resources(apt::source, $repos)
    }
}
