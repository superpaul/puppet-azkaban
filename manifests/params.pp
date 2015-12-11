class azkaban::params {
    $server_type     = "solo" # Allowable options "web","executor","solo"
    $package_version = $::azkaban_package_version ? {
        undef   => $server_type ? {
            "solo"  => "2.5.0",
            default => "2.1",
        },
        default => $::azkaban_package_version,
    }

    $package_source    = "https://s3.amazonaws.com/azkaban2/azkaban2"
    $package_name      = "azkaban-${server_type}-server-${package_version}.tar.gz"
    $azkaban_package   = "${package_source}/${package_version}/${package_name}"
}
