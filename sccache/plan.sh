pkg_name=sccache
pkg_origin=core
pkg_version=0.2.13
pkg_license=('Apache-2.0')
pkg_upstream_url="https://github.com/mozilla/sccache"
pkg_description="sccache is ccache with cloud storage"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://github.com/mozilla/sccache/archive/${pkg_version}.tar.gz"
pkg_shasum=81c973cf9a89e77f02a6b5710298531ba2e50d2555e8a931e505fbf570522e2a
pkg_bin_dirs=(bin)
pkg_deps=(
  core/glibc
  core/gcc-libs
  core/openssl
)
pkg_build_deps=(
  core/rust
  core/gcc
  core/pkg-config
  core/openssl
  core/make
)
pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  cargo build \
    --features="all" \
    --release
}

do_install() {
  install -v -D "${CACHE_PATH}/target/release/sccache" "${pkg_prefix}/bin/sccache"
}
