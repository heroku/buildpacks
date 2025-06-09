```ruby
:::-- pre.erb rundoc.configure
Rundoc.configure do |config|
  # Use ERB defined earlier to generate a template
  config.after_build do |context|
    context.output_dir.join(".gitignore").write(<<~EOF)
      <%= dir_name %>
    EOF

    # Strip ANSI codes
    doc = context.output_markdown_path.read
    doc.gsub!(/\e\[[\d;]*m/, '')
    context.output_markdown_path.write(doc)
  end
end
```
