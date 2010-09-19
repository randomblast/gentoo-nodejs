# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="MySQL bindings for node.js"
HOMEPAGE="http://github.com/Sannis/node-mysql-libmysqlclient/"
SRC_URI="http://github.com/Sannis/node-mysql-libmysqlclient/tarball/v${PV} -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="doc"
S="${WORKDIR}/Sannis-node-mysql-libmysqlclient-d6e6d37"
LICENSE="MIT"

EAPI=2

DEPEND="dev-lang/nodejs virtual/mysql"
RDEPEND="${DEPEND}"

src_compile () {
	node-waf configure || die "Configure failed"
	node-waf build || die "Compilation failed"
}

src_install() {
	insinto /usr/lib/node/libraries
	doins mysql_bindings.node || die
	doins mysql-libmysqlclient.js || die
	dodoc README.markdown LICENSE CHANGELOG || die
	if use doc; then
		dohtml docs/* || die
	fi
}