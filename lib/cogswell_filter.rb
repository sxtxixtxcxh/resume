class CogswellFilter < Nanoc3::Filter
  identifier :cogswell
  require 'jsmin'
  
  def run(content, params={})
    # content.gsub('nanoc sucks', 'nanoc rocks')
    processed = self.preprocess(content)
    self.preprocess(content)
    JSMin.minify(processed).strip
  end
  
  def preprocess content
    # loop through lines
    @processed = ''
    content.each{|line| 
      self.import line
    }
    @processed
  end
  
  def import line
    if line.match(/^\/\/=\s+import\s+['|"](.*?)['|"]\s*$/)
      import_lib = line.gsub(/^\/\/=\s+import\s+['|"](.*?)['|"]\s*$/,$1)
      filepath = Dir.pwd.to_s + '/content/javascripts/' + import_lib
      import_lines = ''
      f = File.open(filepath, "r") 
      f.each_line do |ln|
        import_lines += ln
      end
      @processed << line.gsub(/^\/\/=\s+import\s+['|"]#{import_lib}['|"]\s*$/, import_lines)
    else
      @processed << line
    end
  end

end

