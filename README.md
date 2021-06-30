[![Healthicons][rubygems-downloads]][rubygems-link]
[![Gem Version][rubygems-version]][rubygems-link]
[![MIT License][license-shield]][license-url]
# Healthicons

Is a Rails based helper to add Healthicons SVG icons directly to your applications views.

To view a searchable list of all the healthicons visit their homepage at [https://healthicons.org/](https://healthicons.org/)

**NOTE:** This gem is in no way associated with the official Healthicons package, it's just a helper to easily inject the icons SVG icons into your applications views.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'healthicons'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install healthicons

## Usage

After installing the gem you will than have availability to call the `healthicons('icon')` helper within your views. Which will output the the icons raw SVG/XML to your page.
Something to note in order to output the icon to the page need to known the icons group and it's icon name. This is because some icons such as `fever` have multiple entries within different groups. (Such as `devices/fever` and `people/fever`.)

Thus in order to output the icons to you application your icon reference needs to me the icon group + icon name, seperated by `/`.

 `<%= healthicons('devices/fever') %>` or `<%= healthicon('body/dna') %>`


### Icon Varients

As of the most recent release Healthicons provides two different icon varients (solid, outline).

The default variant in this gem is to use the `outline` version. If you want to use the solid version when pulling an icon you use the variant keyword when fetching the icon.

`<%= healthicon('body/dna', variant: :solid) %>` - It accepts the variant as a string or a symbol.

### Icon Sizes

In order for the icons to display properly the height and width of the icons must be proportionate. Thus in order to to adjust their size you can pass a numeric value for the size keyword. This size will be applied to both the height and width of the icon. If you attempt to pass a height/width value they will be stripped.

`<%= healthicon('body/dna', size: 14) %>`

### Additional options

It is very easy to add additional attributes to the icons `<svg></svg>` element. Please note there are a handful of attributes filtered in order to prevent from breaking the icon.
Any additional attributes you want to modify or add to the icons `<svg>` element you just use a a keyword attribute with a value such as the following.

`<%= healthicon('body/dna', alt: 'A double helic carrying genetic instructions.') %>`
### Adding color

I'm sure you won't want to stick with with using gray/black as the icons default color.
By default this gem adds `stroke='currentColor'` the the icons SVg, this allows you set set `color` in CSS to apply a color to the icons primary stroke.

The easiest two methods to add color to the icon can be done with the following methods:

**First method:**

Add inline CSS to the icon

`<%= healthicon('body/dna', style: 'color: red') %>`


**Second Method:**

Create a class in your stylesheets and add the class to the icon.

```css
.red { color: red; }
```

`<%= healthicon('body/dna', class: 'red' ) %>`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tarellel/healthicons.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The icons associated from the original package in this gem are licenses under the [CC0 License](https://healthicons.org/about#license)

[license-shield]: https://img.shields.io/github/license/tarellel/healthicons.svg?style=flat-square
[license-url]: https://github.com/tarellel/healthicons/blob/main/LICENSE.txt
[rubygems-downloads]: https://ruby-gem-downloads-badge.herokuapp.com/healthicons?type=total
[rubygems-link]: https://rubygems.org/gems/healthicons
[rubygems-version]: https://badge.fury.io/rb/healthicons.svg