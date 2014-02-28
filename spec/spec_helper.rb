require 'rcleaner'

def cd(cwd)
  old_cwd = Dir.getwd

  Dir.chdir cwd
  begin
    yield if block_given?
  ensure 
    Dir.chdir old_cwd
  end

end

