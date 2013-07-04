# = Class: apt_repos
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
# include apt_repos

class apt_repos (
    $ensure     = params_lookup('ensure'),
    $repos      = params_lookup('apt_repos', 'global')
    ) inherits apt_repos::params {

    if $ensure == 'present' {
        create_resources(apt_repos::repo, $repos)
    }
}
