.. -*- restructuredtext -*-


========
Homeware
========

Ubuntu stopped using screensavers.
http://www.howtogeek.com/114027/how-to-add-screensavers-to-ubuntu-12.04/

http://askubuntu.com/questions/11805/how-to-open-ssh-usernamehostname-link

```bash
    gconftool-2 --set --type=bool /desktop/gnome/url-handlers/ssh/enabled true
    gconftool-2 --set --type=string /desktop/gnome/url-handlers/ssh/command 'xterm-light -e "%s"'
    gconftool-2 --set --type=bool /desktop/gnome/url-handlers/ssh/needs_terminal false
```
![solarized ripen-screenshot](https://raw.github.com/bewest/homeware/master/ripen-screenshot-2011-11-02.png)


Personal Cloud Computing
========================

The open source community has a lot of great tools for managing packages.
Several companies I've worked for have used Debian, and I use Ubuntu for my
laptop and workstation.  With the right suite of services you can get free
computing to work and demo your application for a limited time.

Motivation
----------

It'd be great if I could hack on some software on my laptop, check in the
code, and then fire up a webserver to watch it work.  If I can get a webserver
running, maybe I can get other components running as well.
It'd be very nifty to set up a kind of VPN in the cloud that I can use to
orchestrate various things.  Family members or co-workers could VPN into my
network.  The network could advertise applications through mdns/bonjour and I
could show off demos or share music...

I do a lot of web development, so I need web servers to run my applications.
EC2 is ideal because I don't actually want the responsibility that comes with
a colocated server somewhere.  If the box gets compromised or breaks, I don't
want the hassle.  With ec2, if there is an exploit I can change my keys and
terminate naughty instances.

Launchpad
---------

Launchpad provides a suite of services:

  * identity management::

    They will store ssh keys and manage an openid account associated with
    them.  This ties your openid to your ssh keys (your new distributed
    ~/.ssh/authorized_keys).

  * EC2 integration:

    There's an Ubuntu package called cloudinit which will do a bunch of
    ubuntu/launchpad/debian specific stuff with your user data.

  * PPA[#]_ Ubuntu integration:
    
    You can only upload to a PPA if you've signed the Ubuntu Code of Conduct
    using your GPG key.
    
  * code hosting, project management, code reviews, bug tracking
    
    Right now I'm just hacking on a few projects and getting a basic
    computing environment up and running.  However, if any thing turns into an
    open source project, this is the place it'll go.  They support external
    development mainline imports automatically from git, mercurial, and svn.
    They also offer private accounts for commercial organizations, I'm not
    sure how much they are.

Getting an account is kind of a hassle, but you can do it in steps.  Signing
the code of conduct requires generating manipulating some keys, and I failed
to upload my ssh keys the first few tries.


Amazon AWS/EC2
--------------

Amazon's EC2 provides an easy to use run time environment based on
virtualization.  Since it's a virtual image, you have complete control over
the image.

A lot of the focus is on building AMI's[#]_, which requires configuring the
entire virtual image, probably on your hard disk.  The default AWS AMI has
almost nothing installed, but there are thousands of AMIs that are available
for free in Amazon's AMI store.  I typically just pick on of the free ubuntu
releases.

Eventually, it would be nice to get an AMI, but I don't want to deal with
building an AMI on my laptop.  Perhaps I can checkpoint an existing image and
build an AMI using that.  There are companies that offer some services to help
manage this kind of thing including RightScale and Alestic.


Change Control
--------------

I'm using git+svn at work and quite like it.  Git makes it easy to shoot
yourself in the foot, which has prevented me from depending on it exclusively
for personal projects.  However, I have been missing the concept of topic
branches, and wished I could move a bunch of changesets around to different
topic branches independently.  You can't do easily with hg, although the
remote branch refspec syntax still intimidates me a bit.  It might be worth
checking out bzr, which is what Canonical advocates.

These distributed systems are nice because they encourage working on lots of
tiny commits, which you can then reorganize and submit to another branch has a
single coherent commit with a clean feature to go with it.  With hg I find
myself blathering incoherently about tiny knits and things that don't quite
work until they do, or waiting for the "big moment" when everything works and
is clean enough to commit has arrived.

However, without a canonical place to serve the code, it's stuck on your hard
drive somewhere.  I've tried github and bitbucket.  Bitbucket goes down from
time to time and github is kind of pricey.  Sometime soon I'll run into a
situation where I'll need to deploy a file with passwords in it, and I'm not
sure of the best way to handle that.  Perhaps a secret repo on my hard disk
that I push to the machine after it starts?  That would break one touch
operation?

http://bitbucket.org/bewest/

Packages
--------

Debian packages:
  
  * homeware-ec2-dev
    
    Installs python, favorite libraries, and other tools needed for developing
    in ec2.


  * bewest-lighttpd-conf
    
    Confiure lighttpd.
    http://debathena.mit.edu/config-packages/

A patched equivs-build is needed to create a package suitable for upload.
TODO: look into CDBS.

Debian/Ubuntu
~~~~~~~~~~~~~
  * http://www.debian.org/doc/manuals/developers-reference/pkgs.html#distribution
  * https://wiki.ubuntu.com/PackagingGuide/Basic#changelog
  * https://wiki.kubuntu.org/PackagingGuide/Howtos/CDBS
  * http://paulstamatiou.com/how-to-getting-started-with-amazon-ec2


Building
________

Building a debian package is mostly a matter of creating a control file and a
changelog.  There are tools: equivs, and dh_make that help with this.

Debian includes hooks through maintainer scripts for doing things after
install, or to uninstall.

Once a package is built, you can upload it to your PPA.
The PPA is subject to a great number of policies.  Most of
the policies are oriented around targeting the
distribution channel, which Ubuntu and Debian both take
pretty seriously.  They both have stringent quality
controls on what software is considered stable and
compatible, which means developing on them makes it easy
to transition  to a production environment.  When software
is added to a repository, it must advertise a distribution
that is compatible with the version of ubuntu you intend
to run.



.. [#]: Personal Package Archive
.. [#]: Amazaon Machine Image

http://mail.gnome.org/archives/gdm-list/2008-June/msg00010.html

#####
# EOF
