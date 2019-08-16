# Twbs Sass Rails
[![Gem Version](https://badge.fury.io/rb/twbs_sass_rails.svg)](https://badge.fury.io/rb/twbs_sass_rails)
[![Build Status](https://secure.travis-ci.org/diowa/twbs_sass_rails.svg?branch=master)](https://travis-ci.org/diowa/twbs_sass_rails)
[![Code Climate](https://codeclimate.com/github/diowa/twbs_sass_rails/badges/gpa.svg)](https://codeclimate.com/github/diowa/twbs_sass_rails)
[![Coverage Status](https://coveralls.io/repos/github/diowa/twbs_sass_rails/badge.svg?branch=master)](https://coveralls.io/github/diowa/twbs_sass_rails?branch=master)

An opinionated gem which brings [Bootstrap for Sass 3.4.1](https://getbootstrap.com/docs/3.4/), [Font Awesome 4.7.0](https://fontawesome.com/v4.7.0/) and [Respond.js](https://github.com/scottjehl/Respond) assets into your Rails application.


## Deprecated

We need this gem for some old projects that require Bootstrap 3.

In our new development stack, we are loading Bootstrap and Font Awesome via yarn.

## Quick start

Add the gem to your Gemfile
```rb
gem 'twbs_sass_rails', '~> 7.2'
```

Run the generator
```bash
$ rails g twbs_sass_rails:install
```


#### Rails 5.1.x

Rails 5.1 [drops jQuery as a default dependency](https://weblog.rubyonrails.org/2017/2/23/Rails-5-1-beta1/).

If you need the JavaScript part of Bootstrap, add to your Gemfile

```rb
gem 'jquery-rails', '~> 4.3'
```

and replace `//= require rails-ujs` in your application JavaScript manifest with

```js
//= require jquery
//= require jquery_ujs
```


## Customization

### Variables
Use `twbs-variables.css.scss` to override Bootstrap defaults:
```scss
/* New variables */
$flat-ui-emerald:       #2ecc71;
$flat-ui-nephritis:     #27ae60;

$flat-ui-peter-river:   #3498db;
$flat-ui-belize-hole:   #2980b9;

/* Overrides */
$brand-primary:         $flat-ui-belize-hole;
$brand-success:         $flat-ui-nephritis;

/* Do not edit below this line */
@import "twbs/bootstrap/variables";
```
**NOTE**: Remember to import `twbs-variables` instead of `twbs/bootstrap/variables` in any new SCSS file.
**WARNING**: Leave `@import "twbs/bootstrap/variables";` at the very end of the file.

### Glyphs
Twbs Sass Rails comes with Glyphicons and Fontawesome, both disabled by default. Edit your `twbs.css.scss` to enable them.

Use Glyphicons:
```scss
@import "twbs/bootstrap/glyphicons";
//@import "fontawesome/font-awesome";
```

Use FontAwesome:
```scss
//@import "twbs/bootstrap/glyphicons";
@import "fontawesome/font-awesome";
```

### Bootstrap theme
If you want to use the [Bootstrap theme](https://getbootstrap.com/examples/theme/), uncomment `//@import "twbs/bootstrap/theme"` in your `twbs.css.scss`.

### Customize SCSS components
If you want to exclude some SCSS components, remove `@import "twbs/bootstrap";` from your `twbs.css.scss` and add the components you need, e.g.:
```scss
/* Use twbs-variables to define new variables and override Bootstrap defaults.
 * Import "twbs-variables" instead of "twbs/bootstrap/variables"
 * in each new stylesheet.
 */
@import "twbs-variables";

/* Start editing below this line */
// Core variables and mixins
@import "twbs/bootstrap/variables";
@import "twbs/bootstrap/mixins";

// Reset
@import "twbs/bootstrap/normalize";
@import "twbs/bootstrap/print";
/* ... */
```
Take a look at [the whole list of SCSS components](/vendor/assets/stylesheets/twbs/_bootstrap.scss). **Respect the order of the files and remember to edit paths**.

### Customize Javascript components
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

Twbs Sass Rails uses [Appraisal](https://github.com/thoughtbot/appraisal) for testing against multiple gem dependency versions.
```bash
$ appraisal install; appraisal update # Make sure your appraisals are installed and up to date
$ appraisal rake
```



## Contributing

Please read through our [contributing guidelines](CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development.

More over, if your pull request contains patches or features, you must include relevant unit tests.

Editor preferences are available in the [editor config](.editorconfig) for easy use in common text editors. Read more and download plugins at <https://editorconfig.org/>.



## Versioning

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, Twbs Sass Rails will be maintained under the Semantic Versioning guidelines as much as possible. Twbs Sass Rails will not follow Bootstrap's version number.

Releases will be numbered with the following format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit [https://semver.org/](https://semver.org/).



## Authors

**Geremia Taglialatela**

+ https://github.com/tagliala
+ https://twitter.com/gtagliala

**Cesidio Di Landa**

+ https://github.com/cesidio
+ https://twitter.com/cesid



## Copyright and license

Copyright 2018 diowa under [the BSD 2-Clause license](LICENSE).

bootstrap-sass is licensed under the MIT License

Font Awesome is licensed under the MIT License

Font Awesome font is licensed under the SIL Open Font License

Font Awesome pictograms are licensed under the CC BY 3.0 License

Respond.js is licensed under the MIT License
