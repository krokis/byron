require_relative '../../lib/scanner'

describe "Scanner" do

  describe 'Cases' do
    Dir["#{__dir__ }/cases/*.md"].each do |md_file|
      it 'hey' do
        source = File.read md_file
        yaml_file = md_file.sub /\.md$/, '.yaml'
        expected = File.read yaml_file
        scanner = Byron::Scanner.new
        #actual = scanner.scan source
      end
    end
  end
end
