require_relative '../../lib/scanner'

describe "Scanner" do

  describe 'Cases' do
    files = File.expand_path('cases/*.md', File.dirname(__FILE__))

    Dir[files].each do |md_file|
      source = File.read md_file
      html_file = md_file.sub /\.md$/, '.html'
      expected = File.read html_file
      it (File.basename md_file) do
        scanner = Byron::Scanner.new
        actual = scanner.scan source
        puts actual.to_html
      end
    end
  end
end
