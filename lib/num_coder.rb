class NumCoder
  class << self

    def fixed_encode(cs, i, l)
      if i.is_a? Array
        r = ""
        i.each { |e| r << fixed_encode(cs, e, l) }
        return r
      else
        raise "Won't fit" unless i < cs.size ** l
        s = cs[0] * l
        l.times do |p|
          s[-1-p] = cs[i / cs.size ** p % cs.size]
        end
        return s
      end
    end

    def fixed_decode(cs, s, l)
      raise "Can't split" unless s.size % l == 0
      r = []
      (s.size / l).times do |p|
        i = 0
        s[p*l..p*l+l-1].each_char { |c| i = cs.size * i + cs.index(c) }
        r << i
      end

      if r.size == 1
        return r[0]
      else
        return r
      end
    end

    def encode(cs, i)
      fixed_encode(cs, i, Math.log(i, cs.size).ceil)
    end

    def decode(cs, s)
      fixed_decode(cs, s, s.size)
    end

    def cs95
      # cs = ""
      # 32.upto(126) { |c| cs << c }
      # return cs
      " !\"#\$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
    end

    def encode95(i)
      encode(cs95, i)
    end

    def fixed_encode95(i, l)
      fixed_encode(cs95, i, l)
    end

    def decode95(s)
      decode(cs95, s)
    end

    def fixed_decode95(s, l)
      fixed_decode(cs95, s, l)
    end

    def cs64
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    end

    def encode64(i)
      encode(cs64, i)
    end

    def fixed_encode64(i, l)
      fixed_encode(cs64, i, l)
    end

    def decode64(s)
      decode(cs64, s)
    end

    def fixed_decode64(s, l)
      fixed_decode(cs64, s, l)
    end

    def cs16
      "0123456789abcdef"
    end

    def encode16(i)
      encode(cs16, i)
    end

    def fixed_encode16(i, l)
      fixed_encode(cs16, i, l)
    end

    def decode16(s)
      decode(cs16, s)
    end

    def fixed_decode16(s, l)
      fixed_decode(cs16, s, l)
    end

  end
end
