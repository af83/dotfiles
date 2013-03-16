require 'irb/completion'
require 'pp'
require "pathname"

# Look for a file in a directory and its parents
def nearest_file(start_directory, filename)
  file = nil
  Pathname(start_directory).ascend do |path|
    f = path.join(filename)
    if File.file?(f) && File.readable?(f)
      file = File.expand_path(f).to_s
      break
    end
  end

  file
end


IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = nearest_file(Dir.pwd, '.irb_history') || File.expand_path("~/.irb_history")
IRB.conf[:EVAL_HISTORY] = 200
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:USE_READLINE] = true

undef nearest_file
