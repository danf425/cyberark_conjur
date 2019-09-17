pkg_name=conjur
pkg_origin=danf
pkg_version="1.4.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_description="Conjur OSS"
pkg_bin_dirs=(bin)
pkg_svc_user=root
pkg_svc_group=root
pkg_upstream_url="https://github.com/cyberark/${pkg_name}"
pkg_source="https://github.com/cyberark/${pkg_name}/archive/v${pkg_version}.tar.gz"
pkg_shasum="6a78d299d48b6678db4caf311cc9490fedf50609eda64c4ed5eb5889ddbbe6e6"
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"


pkg_deps=(
    core/cacerts
    core/bundler
    core/docker 
    core/docker-compose
)

pkg_build_deps=(
    core/git
)

pkg_bin_dirs=(bin)

do_unpack(){
    tar xzf "${HAB_CACHE_SRC_PATH}"/"${pkg_filename}" --directory ${HAB_CACHE_SRC_PATH}  
}

do_build(){
    return 0
}

do_install(){
    echo "here's cache path"
    ls "${HAB_CACHE_SRC_PATH}"
    echo "here's pkg_prefix"
    ls "$pkg_prefix"
    cp -r "${HAB_CACHE_SRC_PATH}"/"${pkg_name}"-"${pkg_version}" "$pkg_prefix"
    cd "$pkg_prefix"/"${pkg_name}"-"${pkg_version}" 
    ./build.sh
    echo "helllo"   
    echo "docker images | grep conjur"
    docker images | grep conjur
    ls
 #   cd dev
 #   ./start
 
 
 #   conjurctl role retrieve-key cucumber:user:admin
}



# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)


# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."



