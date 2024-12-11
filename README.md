# Stimulus Audit

A Ruby gem to analyze Stimulus.js controller usage in your Rails application. Find unused controllers, undefined controllers, and audit your Stimulus controller usage.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stimulus-audit'
```

And then execute:
```bash
bundle install
```

## Usage

### Audit All Controllers

Run an audit to see all defined and used controllers in your application:

```bash
rails stimulus:audit
```

This will show:
- Controllers that are defined but never used
- Controllers that are used but don't have corresponding files
- Active controllers and where they're being used
- Summary statistics

Example output:
```
📊 Stimulus Controller Audit

❌ Defined but unused controllers:
   unused_feature
   └─ app/javascript/controllers/unused_feature_controller.js

⚠️  Used but undefined controllers:
   missing_controller
   └─ app/views/products/show.html.erb (lines: 15, 23)

✅ Active controllers:
   products
   └─ Defined in: app/javascript/controllers/products_controller.js
   └─ Used in:
      └─ app/views/products/index.html.erb (lines: 10, 45)
      └─ app/components/product_card/component.html.erb (lines: 3)
```

### Scan for Specific Controller Usage

Find all uses of a specific controller:

```bash
rails stimulus:scan[controller_name]
```

Example:
```bash
rails stimulus:scan[products]
rails stimulus:scan[users--name]  # For namespaced controllers
```

### Configuration

You can customize the paths that are scanned in an initializer (`config/initializers/stimulus_audit.rb`):

```ruby
StimulusAudit.configure do |config|
  config.view_paths = [
    Rails.root.join('app/views/**/*.{html,erb,haml}'),
    Rails.root.join('app/javascript/**/*.{js,jsx}'),
    Rails.root.join('app/components/**/*.{html,erb,haml,rb}')
  ]
  
  config.controller_paths = [
    Rails.root.join('app/javascript/controllers/**/*.{js,ts}')
  ]
end
```

## Features

- Finds unused Stimulus controllers
- Detects controllers used in views but missing controller files
- Supports namespaced controllers (e.g., `users--name`)
- Handles multiple syntax styles:
  ```ruby
  # HTML attribute syntax
  <div data-controller="products">
  
  # Ruby hash syntax
  <%= f.submit 'Save', data: { controller: 'products' } %>
  
  # Hash rocket syntax
  <%= f.submit 'Save', data: { :controller => 'products' } %>
  ```
- Scans ERB, HTML, and HAML files
- Works with both JavaScript and TypeScript controller files
- Supports component-based architectures

## Development

After checking out the repo:

1. Run `bundle install` to install dependencies
2. Run `rake test` to run the tests
3. Create a branch for your changes (`git checkout -b my-new-feature`)
4. Make your changes and add tests
5. Ensure tests pass

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the MIT License.
