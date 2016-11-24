mesos-dns-debian
========

Debian packaging for [mesos-dns][mesos-dns].

These are low-effort packages that just take the binary compiled by upstream
and shove it into a Debian package. There's no attempt at quality here, but
maybe they'll give you a better way to deploy mesos-dns than some `wget`
command.

The binary is statically-linked (and enormous, thanks Go), so the packages
published here are usable on lots of Debian-likes.



[mesos-dns]: https://github.com/mesosphere/mesos-dns
