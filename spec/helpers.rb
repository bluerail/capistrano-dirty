require 'tmpdir'

module Helpers
  def with_dir
    with_dir_with_fixture { yield }
  end

  def with_dir_with_fixture(fixture_name = nil)
    Dir.mktmpdir do |temp_path|
      Dir.chdir(temp_path) do
        if fixture_name
          FileUtils.cp fixture_path(fixture_name), "#{temp_path}/"
        end

        yield
      end
    end
  end

  def fixture_path(name)
    [root, 'spec', 'fixtures', name].join('/')
  end

  def root
    File.dirname __dir__
  end
end
