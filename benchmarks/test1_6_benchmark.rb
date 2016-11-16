require_relative "../test1_6.rb"
require 'benchmark'


def gen(n)
  s = ''
  i = 0
  while i < n
    case rand(3)
    when 0
      s += 'A'
    when 1
      s += 'B'
    when 2
      s += 'C'
    end
    i += 1
  end
  s
end

ba05 = "B" * 50000 + "A"
ba1 = "B" * 100000 + "A"
ba2 = "B" * 200000 + "A"
ba4 = "B" * 400000 + "A"
ba8 = "B" * 800000 + "A"
ba16 = "B" * 1600000 + "A"

ab05 = "A" + "B" * 50000
ab1 = "A" + "B" * 100000
ab2 = "A" + "B" * 200000
ab4 = "A" + "B" * 400000
ab8 = "A" + "B" * 800000
ab16 = "A" + "B" * 1600000

g05 = gen(50000)
g1 = g05 * 2
g2 = g1 * 2
g4 = g2 * 2
g8 = g4 * 2
g16 = g8 * 2


Benchmark.bm(18) do |x|

  x.report("A + 50000B") { 1.times do ; solution(ab05); end }
  x.report("A + 100000B") { 1.times do ; solution(ab1); end }
  x.report("A + 200000B") { 1.times do ; solution(ab2); end }
  x.report("A + 400000B") { 1.times do ; solution(ab4); end }
  x.report("A + 800000B") { 1.times do ; solution(ab8); end }
  x.report("A + 1600000B") { 1.times do ; solution(ab16); end }

  x.report("50000B + A") { 1.times do ; solution(ba05); end }
  x.report("100000B + A") { 1.times do ; solution(ba1); end }
  x.report("200000B + A") { 1.times do ; solution(ba2); end }
  x.report("400000B + A") { 1.times do ; solution(ba4); end }
  x.report("800000B + A") { 1.times do ; solution(ba8); end }
  x.report("1600000B + A") { 1.times do ; solution(ba16); end }

  x.report("rand 50000") { 1.times do ; solution(g05); end }
  x.report("rand 100000") { 1.times do ; solution(g1); end }
  x.report("rand 200000") { 1.times do ; solution(g2); end }
  x.report("rand 400000") { 1.times do ; solution(g4); end }
  x.report("rand 800000") { 1.times do ; solution(g8); end }
  x.report("rand 1600000") { 1.times do ; solution(g16); end }
end
