require_relative '../../lib/parser'

describe "Scanner" do

  describe 'Cases' do
    Dir["#{__dir__ }/cases/*.md"].each do |md_file|
      it 'hey' do
        source = File.read md_file
        yaml_file = md_file.sub /\.md$/, '.yaml'
        expected = File.read yaml_file
        parser = Byron::Parser.new
        #actual = parser.parse source
      end
    end
  end
end
