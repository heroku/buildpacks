require "test_helper"

class BashTest < Minitest::Test
  def test_bash_returns_cd
    original_dir = `pwd`
    Rundoc::CodeCommand::Bash.new("cd ..").call
    now_dir = `pwd`
    refute_equal original_dir, now_dir
  ensure
    Dir.chdir(original_dir.strip)
  end

  def test_bash_stderr_with_or_is_capture
    command = "1>&2 echo 'msg to STDERR 1' || 1>&2 echo 'msg to STDERR 2'"
    bash = Rundoc::CodeCommand::Bash.new(command)
    assert_equal "$ #{command}", bash.to_md
    assert_equal "msg to STDERR 1\n", bash.call
  end

  def test_bash_shells_and_shows_correctly
    ["pwd", "ls"].each do |command|
      bash = Rundoc::CodeCommand::Bash.new(command)
      assert_equal "$ #{command}", bash.to_md
      assert_equal `#{command}`, bash.call
    end
  end

  def test_stdin
    command = "tail -n 2"
    bash = Rundoc::CodeCommand::Bash.new(command)
    bash << "foo\nbar\nbaz\n"
    assert_equal "bar\nbaz\n", bash.call
  end
end
