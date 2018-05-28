describe "d3-array - statistics" do
  it "d3.min" do
    expect(CY.min([2, 1, 3])).to eq(1)
    expect(CY.max([2, -1, -3, 0], &:-@)).to eq(3)
    expect(CY.min([2, 1, nil, 3])).to eq(1)
    expect(CY.min(["20", "3"])).to eq("20")
    expect(CY.min([20, 3])).to eq(3)
  end

  it "d3.max" do
    expect(CY.max([2, 1, 3, 0])).to eq(3)
    expect(CY.max([2, -1, -3, 0], &:abs)).to eq(3)
  end

  it "d3.extent" do
    expect(CY.extent([2, -1, 3])).to eq([-1, 3])
    expect(CY.extent([2, -1, nil, 3])).to eq([-1, 3])
    expect(CY.extent([2, -1, 3], &:abs)).to eq([1, 3])
    expect(CY.extent([1])).to eq([1, 1])
    expect(CY.extent([])).to eq([nil, nil])
  end

  it "d3.sum" do
    expect(CY.sum([1, 2, 3])).to eq(6)
    expect(CY.sum([1, 2, 3, nil])).to eq(6)
    expect(CY.sum([1, 2, 3]){|x| x**2}).to eq(1+4+9)
    expect(CY.sum([])).to eq(0)
  end

  it "d3.mean" do
    expect(CY.mean([1, 2, 3])).to eq(2)
    expect(CY.mean([1, 2, 3, nil])).to eq(2)
    expect(CY.mean([1, 2, 3]){|x| x**2}).to eq((1+4+9)/3)
    expect(CY.mean([1, 2, 3, 4]){|x| x > 3 ? nil : x**2}).to eq((1+4+9)/3)
    expect(CY.mean([])).to eq(nil)
  end

  it "d3.median" do
    expect(CY.median([1, 2, 3])).to eq(2)
    expect(CY.median([1, 2, 3, nil, nil])).to eq(2)
    expect(CY.median([])).to eq(nil)
  end

  it "d3.quantile" do
    # Examples from d3 documentation
    expect(CY.quantile([0, 10, 30], 0)).to eq(0)
    expect(CY.quantile([0, 10, 30], 0.5)).to eq(10)
    expect(CY.quantile([0, 10, 30], 1)).to eq(30)
    expect(CY.quantile([0, 10, 30], 0.25)).to eq(5)
    expect(CY.quantile([0, 10, 30], 0.75)).to eq(20)
    expect(CY.quantile([0, 10, 30], 0.1)).to eq(2)
  end

  it "d3.variance" do
    expect(CY.variance([])).to eq(nil)
    expect(CY.variance([1])).to eq(nil)
    expect(CY.variance([10, 20, 30])).to eq(100)
  end

  it "d3.deviation" do
    expect(CY.deviation([])).to eq(nil)
    expect(CY.deviation([1])).to eq(nil)
    expect(CY.deviation([10, 20, 30])).to eq(10)
  end
end
