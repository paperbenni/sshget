PREFIX = /usr/

all: install

install:
	install -Dm 755 sshget.sh ${DESTDIR}${PREFIX}bin/sshget

uninstall:
	rm ${DESTDIR}${PREFIX}bin/sshget
