class NumCoder
  class << self

    def encode(cs, i)
      s = ""
      t = i
      while t > 0
        s = cs[t % cs.size] + s
        t = t / cs.size
      end
      return s
    end

    def decode(cs, s)
      i = 0
      s.each_char { |c| i = cs.size * i + cs.index(c) }
      return i
    end

    def cs95
      cs = ""
      32.upto(126) { |c| cs << c }
      return cs
      # " !\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
    end

    def encode95(i)
      encode(cs95, i)
    end

    def decode95(s)
      decode(cs95, s)
    end

    def cs64
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    end

    def encode64(i)
      encode(cs64, i)
    end

    def decode64(s)
      decode(cs64, s)
    end

    def cs16
      "0123456789abcdef"
    end

    def encode16(i)
      encode(cs16, i)
    end

    def decode16(s)
      decode(cs16, s)
    end

  end
end
