class azkaban::solo (
    $install_path = "/opt/",
) inherits azkaban::params {
    notice("Installing Solo")
    
    $pkg_path = "/tmp/$::azkaban::params::package_name"
    exec { 'fetching-solo-package':
        command => "wget $::azkaban::params::azkaban_package -O $pkg_path",
        onlyif  => "test -f $pkg_path",
        logoutput => true,
    }

    file { "$pkg_path":
        ensure  => present,
        require => Exec["fetching-solo-package"]
    }
    
    exec { 'extract-azkaban-package':
        cwd       => "$install_path",
        command   => "tar -xzvf /tmp/$::azkaban::params::package_name -C $install_path",
        logoutput => on_failure,
        require   => [ File [$pkg_path] ]
    }
        
}
