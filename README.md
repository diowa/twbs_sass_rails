# Twbs Sass Rails
[![Build Status](https://secure.travis-ci.org/diowa/twbs_sass_rails.png?branch=master)](https://travis-ci.org/diowa/twbs_sass_rails)
[![Dependency Status](https://gemnasium.com/diowa/twbs_sass_rails.png)](https://gemnasium.com/diowa/twbs_sass_rails)
[![Code Climate](https://codeclimate.com/github/diowa/twbs_sass_rails.png)](https://codeclimate.com/github/diowa/twbs_sass_rails)
[![Coverage Status](https://coveralls.io/repos/diowa/twbs_sass_rails/badge.png?branch=master)](https://coveralls.io/r/diowa/twbs_sass_rails)

Brings [Bootstrap](http://getbootstrap.com/) and [Font Awesome](http://fontawesome.io) assets into your Rails application. **In Less, at the moment.**



## Quick start

Add the gem to your Gemfile
```rb
gem 'twbs_sass_rails'
```

Run the generator
```bash
$ rails g twbs_sass_rails:install
```



## Customization

Twbs Sass Rails defaults with Font Awesome. If you want to switch to Glyphicons, edit your `twbs.css.less`:
```css
@import "twbs/bootstrap";
@import "twbs/bootstrap/glyphicons";
//@import "fontawesome/font-awesome";

/* ... */
```

Use `twbs-variables.css.less` to override Bootstrap defaults:
```css
/* New variables */
@flat-ui-emerald:       #2ecc71;
@flat-ui-nephritis:     #27ae60;

@flat-ui-peter-river:   #3498db;
@flat-ui-belize-hole:   #2980b9;

/* Overrides */
@brand-primary:         @flat-ui-belize-hole;
@brand-success:         @flat-ui-nephritis;
```
NOTE: Remember to import `twbs-variables.css.less` instead of `twbs/bootstrap/variables` in each new stylesheet.

If you want to exclude some css components, remove `@import "twbs/bootstrap";` and add the components you need:
```css
/* Customization Example */
// Core variables and mixins
@import "twbs/bootstrap/variables";
@import "twbs/bootstrap/mixins";

// Reset
@import "twbs/bootstrap/normalize";
@import "twbs/bootstrap/print";

/* ... */
```

You can do the same for the javascript counterpart. Remove `//= require twbs/bootstrap` and add the components you need:
```js
/* Customization Example */
//= require jquery_ujs
//= require twbs/bootstrap/transition
//= require twbs/bootstrap/alert
//= require twbs/bootstrap/button
//= require turbolinks
/* ... */
```



## Versioning

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, Twbs Sass Rails will be maintained under the Semantic Versioning guidelines as much as possible. Twbs Sass Rails will not follow Bootstrap's version number.

Releases will be numbered with the following format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit [http://semver.org/](http://semver.org/).



## Authors

**Geremia Taglialatela**

+ http://github.com/tagliala
+ http://twitter.com/gtagliala

**Cesidio Di Landa**

+ http://github.com/cesidio
+ http://twitter.com/cesid



## Copyright and license

Copyright 2013 diowa under [the BSD 2-Clause license](LICENSE).

Twitter Bootstrap is licensed under the Apache License, Version 2.0

Font Awesome is licensed under the MIT License

Font Awesome font is licensed under the SIL Open Font License

Font Awesome pictograms are licensed under the CC BY 3.0 License
