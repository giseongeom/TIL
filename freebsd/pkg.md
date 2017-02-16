# FreeBSD

## package management

* pkg

```bash
EXAMPLES
     Some examples are listed here.  The full list of available	commands are
     available in pkg(8) once it is bootstrapped.

     Search for	a package:
	   $ pkg search	perl

     Install a package:
	   % pkg install perl

     List installed packages:
	   $ pkg info

     Upgrade from remote repository:
	   % pkg upgrade

     List non-automatic	packages:
	   $ pkg query -e '%a =	0' %o

     List automatic packages:
	   $ pkg query -e '%a =	1' %o

     Delete an installed package:
	   % pkg delete	perl

     Remove unneeded dependencies:
	   % pkg autoremove

     Change a package from automatic to	non-automatic, which will prevent
     autoremove	from removing it:
	   % pkg set -A	0 perl

     Change a package from non-automatic to automatic, which will make
     autoremove	allow it be removed once nothing depends on it:
	   % pkg set -A	1 perl

     Create package file from an installed package:
	   % pkg create	-o /usr/ports/packages/All perl

     Determine which package installed a file:
	   $ pkg which /usr/local/bin/perl

     Audit installed packages for security advisories:
	   $ pkg audit

     Check installed packages for checksum mismatches:
	   # pkg check -s -a

     Check for missing dependencies:
	   # pkg check -d -a

```


## 참고자료

* [pkg ManPage (FreeBSD 10.0)](http://www.freebsd.org/cgi/man.cgi?query=pkg&apropos=0&sektion=7&manpath=FreeBSD+10.0-stable&arch=default&format=html)
