# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

#
# The following code comes from Rails and thus is licensed
#
# Copyright (c) 2005-2010 David Heinemeier Hansson
#  
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#  
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#  
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# source: http://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/blank.rb
#

class Object
  # An object is blank if it's false, empty, or a whitespace string.
  # For example, "", "   ", +nil+, [], and {} are blank.
  #
  # This simplifies:
  #
  #   if !address.nil? && !address.empty?
  #
  # ...to:
  #
  #   if !address.blank?
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
 
  # An object is present if it's not blank.
  def present?
    !blank?
  end
  
  # Returns object if it's #present? otherwise returns nil.
  # object.presence is equivalent to object.present? ? object : nil.
  #
  # This is handy for any representation of objects where blank is the same
  # as not present at all.  For example, this simplifies a common check for
  # HTTP POST/query parameters:
  #
  #   state   = params[:state]   if params[:state].present?
  #   country = params[:country] if params[:country].present?
  #   region  = state || country || 'US'
  #
  # ...becomes:
  #
  #   region = params[:state].presence || params[:country].presence || 'US'
  def presence
    self if present?
  end
end
 
class NilClass #:nodoc:
  def blank?
    true
  end
end
 
class FalseClass #:nodoc:
  def blank?
    true
  end
end
 
class TrueClass #:nodoc:
  def blank?
    false
  end
end
 
class Array #:nodoc:
  alias_method :blank?, :empty?
end
 
class Hash #:nodoc:
  alias_method :blank?, :empty?
end
 
class String #:nodoc:
  def blank?
    self !~ /\S/
  end
end
 
class Numeric #:nodoc:
  def blank?
    false
  end
end

