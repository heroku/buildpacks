```ruby
:::-- pre.erb rundoc.configure
Rundoc.configure do |config|
  # Use ERB defined earlier to generate a template
  config.after_build do |context|
    context.output_dir.join(".gitignore").write(<<~EOF)
      <%= dir_name %>
    EOF
  end
end
```
