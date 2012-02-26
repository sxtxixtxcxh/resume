require 'iconv'
class String
  def to_permalink
    Iconv.iconv('ascii//translit//IGNORE', 'utf-8', self).first.gsub("'", "").gsub(/[^\x00-\x7F]+/, '').gsub(/[^a-zA-Z0-9-]+/, '-').gsub(/^-/, '').gsub(/-$/, '').downcase
  end
end