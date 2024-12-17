```ruby
:::-- print.erb
<%
require 'uri'

class << self
  attr_reader :app_url, :buildpack_url, :dir_name, :tutorial_type, :buildpack_name, :dependency_file, :language_name, :install_cmd_grep, :which_binary, :fir_tutorial_url, :pack_build_head_tail
end

def setup(app_url: , buildpack_url:, tutorial_type: , buildpack_name: , dependency_file: , language_name: , install_cmd_grep:, which_binary: , fir_tutorial_url:, pack_build_head_tail: false)
  @app_url = app_url
  @dir_name = File.basename(URI.parse(@app_url).path)
  @which_binary = which_binary
  @buildpack_url = buildpack_url
  @language_name = language_name
  @tutorial_type = tutorial_type
  @buildpack_name = buildpack_name
  @dependency_file = dependency_file
  @install_cmd_grep = install_cmd_grep
  @fir_tutorial_url = fir_tutorial_url
  # Falsey or an integer for number of lines to show of the head and Tail of the `pack build` command
  # When `false` it will emit the entire command
  @pack_build_head_tail = pack_build_head_tail
end

%>
```
