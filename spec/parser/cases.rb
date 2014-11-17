require_relative '../../lib/parser'

describe "Parser" do

  describe 'Cases' do
    files = File.expand_path('cases/*.md', File.dirname(__FILE__))

    Dir[files].each do |md_file|
      source = File.read md_file
      yaml_file = md_file.sub /\.md$/, '.yaml'
      expected = File.read yaml_file
      parser = Byron::Parser.new
      #actual = parser.parse source
    end
  end
end
