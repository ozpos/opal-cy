describe "d3-array - search" do
  it "d3.ascending" do
    expect(CY.ascending(2, 1)).to eq(1)
    expect(CY.ascending(1, 1)).to eq(0)
    expect(CY.ascending(1, 2)).to eq(-1)
  end

  it "d3.descending" do
    expect(CY.descending(2, 1)).to eq(-1)
    expect(CY.descending(1, 1)).to eq(0)
    expect(CY.descending(1, 2)).to eq(1)
  end

  it "d3.scan" do
    array = [13,5,11,26,32]
    expect(CY.scan(array)).to eq(1)
    expect(CY.scan(array){|a,b| (a%10) - (b%10)}).to eq(2)
    expect(CY.scan(array){|a,b| (b%10) - (a%10)}).to eq(3)
  end

  it "d3.bisect_left" do
    array = (100..200).to_a
    expect(CY.bisect_left(array, 117)).to eq(17)
    expect(CY.bisect_left(array, 130.5)).to eq(31)
  end

  it "d3.bisect_right" do
    array = (100..200).to_a
    expect(CY.bisect_right(array, 117)).to eq(18)
    expect(CY.bisect_right(array, 130.5)).to eq(31)
  end

  it "d3.bisect" do
    array = (100..200).to_a
    expect(CY.bisect(array, 117)).to eq(18)
    expect(CY.bisect(array, 130.5)).to eq(31)
  end

  it "d3.bisector" do
    expect(CY.bisector{|x| x.abs}).to be_instance_of(CY::Bisector)
    expect(CY.bisector{|x,y| x.abs - y.abs}).to be_instance_of(CY::Bisector)
  end

  describe "D3::Bisector" do
    let(:array) { (100..200).map{|i| i * (-1)**i} }
    let(:a) { CY.bisector{|x| x.abs} }
    let(:c) { CY.bisector{|x,y| x.abs - y.abs} }

    it "A.left" do
      expect(a.left(array, 117)).to eq(17)
      expect(a.left(array, 130.5)).to eq(31)
    end

    it "C.left" do
      expect(c.left(array, 117)).to eq(17)
      expect(c.left(array, 130.5)).to eq(31)
    end

    it "A.right" do
      expect(a.right(array, 117)).to eq(18)
      expect(a.right(array, 130.5)).to eq(31)
    end

    it "C.right" do
      expect(c.right(array, 117)).to eq(18)
      expect(c.right(array, 130.5)).to eq(31)
    end
  end
end
