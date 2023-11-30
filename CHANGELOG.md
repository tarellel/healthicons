# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.8] - 2023-11-30

- More minor cleanup

## [0.0.7] - 2023-11-30

- Resolve `Healthicons::Errors::UnknownIcon` not properly passing error message
- Update gemspec to support Rails 7+
- Update Gemfile.lock
- Include `activesupport/blank`  require for some instances where `blank?` may be unavailable
- Resolve issue were tests are failing for some version of nokogiri
- Version bump
- Added Github Actions with linters and tests

## [0.0.6] - 2021-11-15

- FIXED: When the icons SVG tags are parsed it should conver `<path />` to `<path></path>` to fix and issue with IE not recognising path as a self-closing tag.

## [0.0.5] - 2021-07-27

- CHANGED: Updated icons to include healthicons latest SVG changes and newly added icons
- CHANGED: Version bump since so many of the icon files changed

## [0.0.4] - 2021-07-9

- CHANGED: Removing adding variant attribute to SVG/XML when a variant is specified
- FIXED: misspelling of `variant` so all icons were being defaulted to to `:outline`

## [0.0.1] - 2021-06-30

- Initial release
