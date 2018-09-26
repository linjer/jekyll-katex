# jekyll-katex

This is a [Jekyll](http://jekyllrb.com) plugin for performing server-side math rendering via the [KaTeX](https://github.com/Khan/KaTeX) library.
KaTeX is a library for rending math on the web using LaTeX, similar to MathJax.

KaTeX differs from MathJax in that it displays faster rendering speed and renders to pure HTML rather than PNGs.
There are various resources in benchmarking and comparing their performance, for more info, [start here](https://khan.github.io/KaTeX/).

Comes packaged with KaTeX `0.9.0` but you can specify a different version in your Jekyll `_config.yml` (see below).

## Installation

### Bundler (recommended)

1. In your Jekyll project, add the plugin to your `_config.yml`, e.g.:

    ```yaml
    plugins:
      - jekyll-katex
    ```

2. Add `jekyll-katex` to your `gems.rb`/`Gemfile` plugin block:

    ```ruby
    group :jekyll_plugins do
      gem 'jekyll-katex'
    end
    ```

    Once done, execute `bundle install`. For more information, see [here](https://jekyllrb.com/docs/plugins/).

3. Add KaTeX CSS and Fonts. Follow the installation instructions on the [KaTeX README](https://github.com/Khan/KaTeX).
    You can skip including the `.js` file unless you want to do client-side in-browser rendering, as well.

    Put the following (adjusting for your version) in your page headers:

    ```html
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.0-alpha/dist/katex.min.css" integrity="sha384-BTL0nVi8DnMrNdMQZG1Ww6yasK9ZGnUxL1ZWukXQ7fygA1py52yPp9W4wrR00VML" crossorigin="anonymous">
    ```

## Configuration

Supported configuration values, shown with default values:

```yml
katex:
  js_path: "{{ Gem::lib_path }}/assets/js"  # Path used to search for katex.min.js
  rendering_options:
    # Default KaTeX rendering options. See https://github.com/Khan/KaTeX#rendering-options
    throw_error: true                       # throwOnError - set to false if you want rendering to output error as text rather than a build error
    error_color: "#cc0000"                  # errorColor
```

## Usage

There are two liquid tags: `katex` and `katexmm`.

### katex

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

### katexmm

The `katex` liquid tag can be cumbersome, particularly if you have many inline blocks, which would need to be opened
and closed repeatedly, cluttering the source text. `katexmm` is an alternative that supports fenced math mode blocks
similar to standard latex:

```latex
{% katexmm %}
This is a mixed environment where you can have text and normal text and $c = \pm\sqrt{a^2 + b^2}$ fenced math. \$!
{% endkatexmm %}
```

* `$` for inline
* `$$` for display mode
* `\$` to escape `$` anywhere within the `katexmm` environment

## Development

```bash
$ bundle install
$ rake build
```

## Contributing

Feel free to open issues and pull requests.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
