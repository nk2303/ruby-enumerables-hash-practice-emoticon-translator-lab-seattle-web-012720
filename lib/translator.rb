require "yaml"
def load_library(file_path)
  file = YAML.load_file(file_path)
  translator = {}
  translator[:get_meaning] = {}
  translator[:get_emoticon] = {}
  file.each {|trans, emoji|
  translator[:get_emoticon][emoji[0]] = emoji[1]
  translator[:get_meaning][emoji[1]] = trans
  }
  return translator
end

def get_japanese_emoticon(file, emo)
  dict = load_library(file)
  dict[:get_emoticon].each {
    if dict[:get_emoticon][emo]
      return dict[:get_emoticon][emo]
    end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file,emo)
  dict = load_library(file)
  dict[:get_meaning].each {
    if dict[:get_meaning][emo]
      return dict[:get_meaning][emo]
    end
  }
  return "Sorry, that emoticon was not found"
end