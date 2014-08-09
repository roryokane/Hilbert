$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'q'
require 'pry'
describe Q do
  describe 'Function' do
    it do
      expect(
        Q.compile('f(x, y) = x + y')
      ).to eq(
        "f <- function(x ,y) x + y"
      )
    end
  end

  describe 'List' do
    it do
      expect(
        Q.compile('{name: "Gogotanaka", age:  21, birth: (1992 8 10) }')
      ).to eq(
        "list(name=\"Gogotanaka\", age=21, birth=c(1992, 8, 10))"
      )
    end
  end

  describe 'Matrix' do
    it do
      expect(
        Q.to_r.compile('(1 2 3; 4 5 6)')
      ).to eq(
        "matrix(c(1, 2, 3, 4, 5, 6), 2, 3, byrow = TRUE)"
      )
      expect(
        Q.to_ruby.compile('(1 2 3; 4 5 6)')
      ).to eq(
        "Matrix[[1, 2, 3], [4, 5, 6]]"
      )
    end
  end

  describe 'Vector' do
    it do
      expect(
        Q.to_r.compile('(1 2 3)')
      ).to eq(
        "c(1, 2, 3)"
      )
      expect(
        Q.to_ruby.compile('(1 2 3)')
      ).to eq(
        "Vector[1, 2, 3]"
      )
    end
  end
end
