https://ngfpm-deng3h.c9users.io/
https://docs.c9.io/docs/custom-runners

edit nginx_dru8.conf
root /home/ubuntu/workspace/drupal-8.1.4;

https://ngfpm-deng3h.c9users.io:8080


//=== https://github.com/GabrielGil/c9-lemp
Prerequisite

Setup a c9 workspace using the Apache, PHP5 and MySQL template


//=== install.sh
# Check if sources.list is a symlink and make a copy so `apt-get update` succeeds
if [ -f /etc/apt/sources.list ] && [ -L /etc/apt/sources.list ]; then
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
  sudo cp /etc/apt/sources.list.old /etc/apt/sources.list
fi

$cp link1 dest1

though link1 is a link, dest1 will be a real file containing the whole contents of the file link1 points to.

//===
[Q] what is redis?
Redis is an open source (BSD licensed), in-memory data structure store, 
used as database, cache and message broker.

Redis is a different evolution path in the key-value DBs where values can contain more complex data types, with atomic operations defined on those data types.


//===
[Q] why php7 for drupal8 ?
Why Drupal 8 is defaulting its testing to PHP7 and why you should, too?
Submitted by Fabianx on Tue, 11/17/2015 - 21:32
http://fabianx.drupalgardens.com/blog/why-drupal-8-defaulting-its-testing-php7-and-why-you-should-too

PHP7 features lots of new things, but the most significant part is a 20-50% speed increase, which comes from the completely rebuilt Zend engine VM that powers PHP under-the-hood.

The new code is not only easier to understand, but also cleaner, faster and doing much less memory copying.
However as with all bleeding-edge software there are bugs and sometimes those bugs can be so tricky that during normal development they do not occur.

incompatibilities have been resolved in the Drupal 8 and Symfony 2 code bases.
For example Null, False, True, which had been classes in Symfony 2, are now reserved keywords. Or Drupal 8 used the String namespace, which also now is reserved. Also Drupal 8 had been relying on uasort behavior being deterministic (which it is not) - though some cases still remain: https://www.drupal.org/node/2466097.


In the end Drupal 8's test suite did almost pass on PHP7, but there were some remaining test failures. Drupal’s tests run on DrupalCI, which is hosted and fully integrated into Drupal.org itself, supporting PHP 5.3-7, MySQL, sqlite and PostgreSQL for both Drupal 7 and Drupal 8 core and contrib modules.

With the help of a 10 hour Drupal 8 Accelerate grant (thank you very much Drupal Association), 
neclimdul, me (Fabianx) and alexpott embarked  on a journey to track down and 
fix the remaining really really tricky test failures. 
(https://www.drupal.org/node/2603152, https://bugs.php.net/bug.php?id=70805 and https://bugs.php.net/bug.php?id=70808)

They succeed after close collaboration with the PHP internals team with me (Fabianx) 
providing the core developers with an EC2 instance, where the bug was easily reproducible 
and such the PHP internals team finally tracked down the bug in the garbage collector. 
I reported another bug with a script to reproduce ("array_merge_recursive corrupts memory of unset items")
and it was fixed within 3-5 hours after posting the bug report(!).

PHP7 became green on Drupal CI on Oct 30, 2015 (https://www.drupal.org/pift-ci-job/73342).

Lessons learned
Drupal 8 and PHP7 is an open-source community collaboration success story with close collaboration of PHP with Drupal 8 and Drupal 8 with Symfony.
Drupal 8 was able to find many many strange bugs with its very extensive test suite and being a complex application itself. 
That made PHP7 more stable for everyone, as well as finding Symfony/PHP7 incompatibilities earlier than they might otherwise have been discovered

All of this means that Drupal 8 and PHP 7 will be viable for production more or less as soon as they reach stable releases, so that real sites can take advantage of the ~30% performance improvement relative to PHP 5.6.


You can do the following:

sudo apt-get install python-software-properties
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
Optionally purge PHP 5:

sudo apt-get remove php5-common -y
Or directly purge it including configuration files:

sudo apt-get purge php5-common -y
And finally install PHP 7:

sudo apt-get install php7.0 php7.0-fpm php7.0-mysql -y
Optionally clean up unneeded packages afterwards:

sudo apt-get --purge autoremove -y
Alternatively, you can install PHP 7.0 from sources using this script script or following instruction on this blog.



//===
You are running composer with xdebug enabled. This has a major impact on runtime performance. See https://getcomposer.org/xdebug
; cp /etc/php5/cli/conf.d/20-xdebug.ini php5-cli/xdebug.ini.bak

//===
E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem. 
E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem. 
E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem. 
./step1.sh: line 30: php7.0-intl: command not found
E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem. 
 * Stopping web server apache2
 * 
ln: failed to create symbolic link ‘/etc/nginx/sites-enabled/c9’: File exists
sed: can't read /etc/php/7.0/fpm/pool.d/www.conf: No such file or directory
sed: can't read /etc/php/7.0/fpm/pool.d/www.conf: No such file or directory
sed: can't read /etc/php/7.0/fpm/pool.d/www.conf: No such file or directory

run sudo dpkg --configure -a is it says. 