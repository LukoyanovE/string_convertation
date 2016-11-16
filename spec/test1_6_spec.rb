require_relative "../test1_6.rb"

# describe "#convert_string_arr" do
#   context "convert required rules right" do
#     it "convert AB to AA" do
#       expect(convert_string_arr(["A","B"])).to eq(["A","A"])
#     end

#     it "convert AB to AA" do
#       expect(convert_string_arr(["B","A"])).to eq(["A","A"])
#     end

#     it "convert BC to CC" do
#       expect(convert_string_arr(["B","C"])).to eq(["C","C"])
#     end

#     it "convert CB to CC" do
#       expect(convert_string_arr(["C","B"])).to eq(["C","C"])
#     end

#     it "convert AA to A" do
#       expect(convert_string_arr(["A","A"])).to eq(["A", nil])
#     end

#     it "convert CC to C" do
#       expect(convert_string_arr(["C","C"])).to eq(["C", nil])
#     end
#   end
# end

# describe "#in_arr_rules?" do
#   context 'check if in rules exist' do
#     it "AB" do
#       expect(in_arr_rules?("AB".split(''))).to be true
#     end

#     it "BA" do
#       expect(in_arr_rules?("BA".split(''))).to be true
#     end

#     it "CB" do
#       expect(in_arr_rules?("CB".split(''))).to be true
#     end

#     it "BC" do
#       expect(in_arr_rules?("BC".split(''))).to be true
#     end

#     it "CC" do
#       expect(in_arr_rules?("CC".split(''))).to be true
#     end

#     it "AA" do
#       expect(in_arr_rules?("AA".split(''))).to be true
#     end
#   end

#   context 'check if in rules does not exist' do
#     it "BB" do
#       expect(in_arr_rules?("BB".split(''))).to be false
#     end

#     it "AC" do
#       expect(in_arr_rules?("AC".split(''))).to be false
#     end

#     it "CA" do
#       expect(in_arr_rules?("CA".split(''))).to be false
#     end
#   end
# end

describe "#solution" do
  context "converts right primitives" do
    it "" do
      expect(solution("")).to eq("")
    end

    it "A" do
      expect(solution("A")).to eq("A")
    end

    it "B" do
      expect(solution("B")).to eq("B")
    end

    it "C" do
      expect(solution("C")).to eq("C")
    end

    it "AB" do
      expect(solution("AB")).to eq("A")
    end

    it "BA" do
      expect(solution("BA")).to eq("A")
    end

    it "BC" do
      expect(solution("BC")).to eq("C")
    end

    it "CB" do
      expect(solution("CB")).to eq("C")
    end

    it "AA" do
      expect(solution("AA")).to eq("A")
    end

    it "CC" do
      expect(solution("CC")).to eq("C")
    end

    it "AC" do
      expect(solution("AC")).to eq("AC")
    end

    it "CA" do
      expect(solution("CA")).to eq("CA")
    end

    it "BB" do
      expect(solution("BB")).to eq("BB")
    end
  end

  context 'convert right complex strings' do
    it "B * 100 + A" do
      expect(solution("B" * 100 + "A")).to eq("A")
    end

    it "A + B * 100" do
      expect(solution("A" + "B" * 100)).to eq("A")
    end

    it "ACACACACACACA" do
      expect(solution("ACACACACACACA")).to eq("ACACACACACACA")
    end

    it "BBBBAAAB" do
      expect(solution("BBBBAAAB")).to eq("A")
    end

    it "ABC" do
      expect(solution("ABC")).to eq("AC")
    end

    it "BBBBBBBBCACABBBBBBB" do
      expect(solution("BBBBBBBBCACABBBBBBB")).to eq("CACA")
    end
  end
end
