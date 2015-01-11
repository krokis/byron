require 'sinatra'
require 'slim'
require_relative '../lib/byron'

set :public_folder, File.dirname(__FILE__) + '/static'

$byron = Byron.new

# A[Square Rect] -- Link text --> B((Circle))
#   A --> C(Round Rect)
#   B --> D{Rhombus}
#   C --> D

def make_mermaid_node (node)
  s = "\n"
  node.children.each do |child|

    if child.equal? node.head
      arrow = '-->'
    else
      arrow = '---'
    end

    label = (child.class.name.split '::').last

    if child.children.empty?
      label = "[#{label}]"
    else
      label = "(#{label})"
    end

    s += "#{node.id} #{arrow} #{child.id}#{label}"
    s += make_mermaid_node child
  end

  s
end

def make_mermaid_graph (discourse)
  s = "graph TD"

  discourse.sentences.each do |sentence|
    s += "
    #{sentence.id}((Sentence))
    " + (make_mermaid_node sentence)
  end

  s
end

get '/' do
  locals = {
    sentence: nil,
    mermaid: nil
  }

  sentence = params[:sentence]

  if sentence
    locals[:sentence] = sentence

    if discourse = $byron.parse(sentence)
      unless discourse.sentences.empty?
        locals[:mermaid] = make_mermaid_graph discourse
      end
    end
  end

  erb :index, locals: locals
end
