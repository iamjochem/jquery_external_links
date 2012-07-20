jQuery External Links Plugin 1.0.0 [![Build Status](https://secure.travis-ci.org/iamjochem/jquery_external_links.png?branch=master)](http://travis-ci.org/iamjochem/jquery_external_links)
======================================

This is a jQuery plugin use to mark external links with CSS, set their target attribute to '_blank' and display a favicon next to the link for the relevant site, the display/injection of the favicon can be turned off.

A [Yandex](https://www.google.com/search?q=what+is+Yandex) service is used to retrieve the favicons of all links in a single HTTP request, the request returns a sprite containing all the favicons of the requested domain names.

The plugin supports the ability to use an alternative service for the 'favicon sprite', but currently I don't know of any that exist.


Usage
-------

### The Basics

Basic usage is simply a question of calling the `externalLinks` method on a jQuery collection, e.g.:

```javascript
(function($) {
    $('a').externalLinks();
})(jQuery);
```

It is assumed that the jQuery collection contains elements representing links ('a' tags), by default elements in the collection that do not represent links will be ignored by the plugin, this means you can do something like the following without affecting the relevant 'div' DOM elements:

```javascript
(function($) {
    $('a,div').externalLinks();
})(jQuery);
```

### The Options

When calling the `externalLinks` method you can pass in an object literal as the first argument, the following property options are supported (all options are optional!):

+ **favicon**<span style="white-space: pre">      </span> - (boolean), defines whether favicons are displayed, *defaults to* `TRUE`
+ **favicon_url**<span style="white-space: pre">  </span> - (string), the base URL used when generating the URL for the favicon sprite image, *defaults to* 'http://favicon.yandex.net/favicon'
+ **url_seperator**<span style="white-space: pre"></span> - (string), the string used to seperate domain names in the generated URL, *defaults to* `'/'`
+ **link_class**<span style="white-space: pre">   </span> - (string), css class to add to the 'a' DOM element, *defaults to* `'external-link'`
+ **link_selector**<span style="white-space: pre"></span> - (string), a jQuery selector used to determine whether a element in the collection will be affected by this plugin, *defaults to* `'a'`
+ **span_class**<span style="white-space: pre">   </span> - (string), css class to add to the favicon 'span' DOM element injected into the 'a' DOM element, *defaults to* `'ext-favicon'`
+ **span_position**<span style="white-space: pre"></span> - (string), determines whether the favicon 'span' DOM element is, value can be either 'left' or 'right', *defaults to* `'right'`
+ **special_hosts**<span style="white-space: pre"></span> - (array), an array of arrays, each inner array must contains 2 elements, the first is a regexp, the second a hostname, links with hostnames that match a given regexp will have their favicons set to that of the hostname corresponding regexp, *the default value of* `[[/github\.com$/, 'github.com']]` is merged with any user supplied values

A More Complicated Example:

```javascript
// wrap code in a lambda that is executed immediately (allows use of $ without the risk of global/library conflicts)
(function($) {
    // define a 'ready' function that initializes the plugin and give it jQuery
    $(function() {
        // grab a content container div
        $('body > div.container')
        // find children in the container that are links with a suitable href and/or have a rel attribute set to 'external'
            .find("a[href^='http'], a[href^='//'], a[rel='external']")
        // initial the plugin on the found links with the given options
            .externalLinks({
                favicon         : true,
                favicon_url     : 'http://favicon.yandex.net/favicon',
                url_seperator   : '/',
                link_class      : 'external-link',
                link_selector   : 'a',
                span_class      : 'ext-favicon',
                span_position   : 'right',
                special_hosts   : [
                    [/iamjochem\.com$/, 'github.com']
                ]
            });
    });
})(jQuery);
```

### Reverting / Destroying

the changes the plugin makes to relevant DOM items can be reversed using the 'destroy' method:

```javascript
(function($) {
    $('a').externalLinks('destroy');
})(jQuery);
```

Testing
-------

This plugin comes with a QUnit test suite that you can find in the test/ directory and run by opening index.html in your browser.

Versioning
----------
Releases of this project will be numbered with the follow format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit http://semver.org/.


Compatibility
-------------

This plugin has been tested with jQuery 1.2.3 to 1.7.0 and should work in all browsers supported by jQuery itself (it has been tested with Safari 5.1.1, Google Chrome 15.0.874.121, Mozilla Firefox 3.6, Mozilla Firefox 8, Opera 11.52 and Internet Explorer 6).


Author
------

This plugin was written by and is maintained by Jochem Maas aka "iamjochem". Please do not hesitate to contact me with comments and bug reports through GitHub: https://github.com/iamjochem/jquery_external_links/issues

You can view the latest source code (and fork the entire project if you wish) at http://github.com/iamjochem/jquery_external_links


Licensing
---------

Copyright (c) Jochem Maas (http://iamjochem.com), 2012.

Dual-licensed under the BSD (BSD-LICENSE.txt) and GPL (GPL-LICENSE.txt) Licenses.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.