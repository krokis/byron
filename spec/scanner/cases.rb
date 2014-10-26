require_relative '../../lib/scanner'

describe "Scanner" do

  describe 'Cases' do
    files = File.expand_path('cases/empty_document.md', File.dirname(__FILE__))

    Dir[files].each do |md_file|
      source = File.read md_file
      yaml_file = md_file.sub /\.md$/, '.yaml'
      expected = File.read yaml_file
      scanner = Byron::Scanner.new
      actual = scanner.scan source
      puts actual.to_yaml
    end
  end
end
