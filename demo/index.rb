require 'sinatra'
require 'slim'
require_relative '../lib/byron'

set :public_folder, File.dirname(__FILE__) + '/static'

$_id = 0

def get_id
  $_id++
  "N#{$_id}"
end

def make_mermaid (sentence)
  return "
  graph TD
  A[Square Rect] -- Link text --> B((Circle))
  A --> C(Round Rect)
  B --> D{Rhombus}
  C --> D
  "
end

def make_mermaid_node (node)
end

get '/' do
  locals = {
    sentence: nil,
    mermaid: nil
  }

  sentence = params[:sentence]

  if sentence
    locals[:sentence] = sentence
    locals[:mermaid] = make_mermaid sentence
  end

  erb :index, locals: locals
end
