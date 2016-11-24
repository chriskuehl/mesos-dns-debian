mesos-dns-debian
========

Debian packaging for [mesos-dns][mesos-dns].

These are low-effort packages that just take the binary compiled by upstream
and shove it into a Debian package. There's no attempt at quality here, but
maybe they'll give you a better way to deploy mesos-dns than some `wget`
command.

The binary is statically-linked (and enormous, thanks Go), so the packages
published here are usable on lots of Debian-likes.


## Using these packages

Either clone the repo and run `make builddeb`, or grab them from [the releases
tab][releases].



[mesos-dns]: https://github.com/mesosphere/mesos-dns
[releases]: https://github.com/chriskuehl/mesos-dns-debian/releases
