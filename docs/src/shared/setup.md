```ruby
:::-- print.erb
<%
require 'uri'

class << self
  attr_reader :app_url, :dir_name, :tutorial_type, :buildpack_name, :dependency_file, :language_name, :install_cmd_grep, :which_binary
end

def setup(app_url: , tutorial_type: , buildpack_name: , dependency_file: , language_name: , install_cmd_grep:, which_binary: )
  @app_url = app_url
  @dir_name = File.basename(URI.parse(@app_url).path)
  @which_binary = which_binary
  @language_name = language_name
  @tutorial_type = tutorial_type
  @buildpack_name = buildpack_name
  @dependency_file = dependency_file
  @install_cmd_grep = install_cmd_grep
end

%>
```
