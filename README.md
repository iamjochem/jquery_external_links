[SGFun](https://github.com/iamjochem/sgfun)
=================

.....


Quick start
-----------

Clone the repo, `git clone git://github.com/iamjochem/sgfun.git`, or [download the latest release](https://github.com/iamjochem/sgfun/zipball/master).



Versioning
----------
Releases of this project will be numbered with the follow format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit http://semver.org/.



Bug tracker
-----------

Have a bug? Please create an issue here on GitHub! Also, when filing please make sure you're familiar with [necolas's guidelines](https://github.com/necolas/issue-guidelines). thanks! <3

https://github.com/iamjochem/sgfun/issues


Developers
----------

A Makefile with convenience methods is included for building the site, the Makefile is based on the one supplied with the the [Twitter Bootstrap](http://twitter.github.com/bootstrap) project (their docs might be helpful to you).

+ **dependencies**
The Makefile depends on you having recess, uglify.js, and jshint installed. To install, just run the following command in npm:

```
$ sudo npm install recess uglify-js jshint -g
```

+ **build** - `make`
Runs the recess compiler to rebuild the `/less` files and compiles the site's pages. Requires recess and uglify-js.

+ **test** - `make test`
Runs jshint and qunit tests headlessly in phantom js (used for ci). Depends on having phatomjs installed.

+ **watch** - `make watch`
This is a convenience method for watching just Less files and automatically building them whenever you save. Requires the Watchr gem.


Contributing
------------

Please make all pull requests against wip-* branches. Also, if your unit test contains javascript patches or features - you must include relevant unit tests. Thanks!


Authors
-------

**Jochem Maas**

+ http://www.iamjochem.com/
+ http://github.com/iamjochem



Copyright and license
---------------------

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
