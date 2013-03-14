require 'irb/completion'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = ("%s/.irb_history" % ENV['HOME'])
IRB.conf[:EVAL_HISTORY] = 200
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:USE_READLINE] = true
