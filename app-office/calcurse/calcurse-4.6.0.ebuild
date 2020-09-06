# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..8} )

inherit autotools python-single-r1

DESCRIPTION="A text-based calendar and scheduling application"
HOMEPAGE="https://calcurse.org/"
SRC_URI="https://calcurse.org/files/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/httplib2[${PYTHON_MULTI_USEDEP}]')
	sys-libs/ncurses:0="

DEPEND="
	${RDEPEND}"

# Most tests fail.
RESTRICT="test"

pkg_setup() {
	:
}

src_prepare() {
	default
}

src_compile() {
	default
	python_setup
	python_fix_shebang contrib/caldav/calcurse-caldav
}

src_configure() {
	econf LIBS="-ltinfow"
}
