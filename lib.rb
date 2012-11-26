require 'base64'

class Numbers
  def self.encode(obj)
    return Base64.encode64(Marshal.dump(obj))
  end

  def self.decode(str)
    return Marshal.load(Base64.decode64(str))
  end

end