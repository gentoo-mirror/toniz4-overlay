# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An incremental parsing system for programming tools"
HOMEPAGE="https://tree-sitter.github.io/tree-sitter/"
SRC_URI="https://github.com/tree-sitter/tree-sitter/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {

	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LIBDIR="${PREFIX}/lib64" install

	if ! use static-libs; then
		find "${ED}" -name '*.a' -delete || die
	fi
}
