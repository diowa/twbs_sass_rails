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

### Variables
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
**NOTE**: Remember to import `twbs-variables.css.less` instead of `twbs/bootstrap/variables` in any new LESS file.

### Icon Font
Twbs Sass Rails defaults with Font Awesome. If you want to switch to Glyphicons, edit your `twbs.css.less` as the following:
```css
@import "twbs/bootstrap/glyphicons";
//@import "fontawesome/font-awesome";
```

### Bootstrap theme
If you want to use the [Bootstrap theme](http://getbootstrap.com/examples/theme/), uncomment `//@import "twbs/bootstrap/theme"` in your `twbs.css.less`.

### Custom LESS components
If you want to exclude some LESS components, remove `@import "twbs/bootstrap";` from your `twbs.css.less` and add the components you need, e.g.:
```css
// Core variables and mixins
@import "twbs/bootstrap/variables";
@import "twbs/bootstrap/mixins";

// Reset
@import "twbs/bootstrap/normalize";
@import "twbs/bootstrap/print";
/* ... */
```
Take a look at [the whole list of LESS components](/vendor/assets/stylesheets/twbs/bootstrap/bootstrap.less). **Respect the order of the files and remember to edit paths**.

### Custom Javascript components
If you want to exclude some Javascript components, remove `//= require twbs/bootstrap` from `twbs.js.coffee` and add the components you need, e.g:
```js
/* ... */
//= require jquery_ujs
//= require twbs/bootstrap/transition
//= require twbs/bootstrap/alert
//= require twbs/bootstrap/button
//= require turbolinks
/* ... */
```
Take a look at [the whole list of Javascript components](/vendor/assets/javascripts/twbs/bootstrap.js). **Respect the order of the files and remember to edit paths**.



## Testing

To launch the tests against Rails 4, run from the root folder of the repository:
```bash
BUNDLE_GEMFILE=$PWD/gemfiles/Gemfile.rails-4.0.x rake
```

For Rails 3.2 run instead:
```bash
BUNDLE_GEMFILE=$PWD/gemfiles/Gemfile.rails-3.2.x rake
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
