# jekyll-katex

This is a [Jekyll](http://jekyllrb.com) plugin for performing server-side math rendering via the [KaTeX](https://github.com/Khan/KaTeX) library.
KaTeX is a library for rending math on the web using LaTeX, similar to MathJax.

KaTeX differs from MathJax in that it displays faster rendering speed and renders to pure HTML rather than PNGs.
There are various resources in benchmarking and comparing their performance, for more info, [start here](https://khan.github.io/KaTeX/).

Comes packaged with KaTeX `^0.6.0`.

## Installation

### Bundler (recommended)

In your Jekyll project, add `jekyll-katex` to your Gemfile plugin block:

```ruby
group :jekyll_plugins do
  gem 'jekyll-katex'
end
```

Once done, execute `bundle install`.

For alternative install methods, see [here](https://jekyllrb.com/docs/plugins/).

### Config

Once plugin is included in your project, follow the installation instructions on the [KaTeX](https://github.com/Khan/KaTeX) README for the CSS and font files.
You can skip including the `.js` file unless you want to do in-browser rendering as well.

#### tl;dr

Put the following in your page headers:

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.6.0/katex.min.css">
```

## Usage

Use the `katex` liquid tag for LaTeX math equations like so:

```latex
{% katex %}
c = \pm\sqrt{a^2 + b^2}
{% endkatex %}
```

If you want the equation to be rendered in display mode (on its own line, centered, large symbols), just pass in the `display` parameter:

```latex
{% katex display %}
c = \pm\sqrt{a^2 + b^2}
{% endkatex %}
```

## Development

### Getting Started

```
bundle install
cd lib
npm i
```

### TODOs

1. Build and push to rubygems.org
2. Better stand-alone packaging of KaTeX - currently packages entire node_modules
3. Provide easy way to leverage packaged KaTeX fonts and CSS

## Contributing

Feel free to open issues and pull requests.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
