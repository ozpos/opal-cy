describe "d3-array - transformations" do
  it "d3.merge" do
    expect(CY.merge([[1], [2, 3]])).to eq([1, 2, 3])
  end

  it "d3.pairs" do
    expect(CY.pairs([1, 2, 3, 4])).to eq([[1, 2], [2, 3], [3, 4]])
  end

  it "d3.permute" do
    expect(CY.permute(["a", "b", "c"], [1, 2, 0])).to eq(["b", "c", "a"])
  end

  it "d3.shuffle" do
    a = (1..20).to_a
    b = (1..20).to_a
    CY.shuffle(b)  # modifies in place
    expect(a).not_to eq(b) # 61 bit chance of random test fail
    expect(a.sort).to eq(b.sort)
  end

  it "d3.ticks" do
    expect(CY.ticks(1, 47, 5)).to eq([10, 20, 30, 40])
  end

  it "d3.tick_step" do
    expect(CY.tick_step(1, 47, 5)).to eq(10)
  end

  it "d3.range" do
    expect(CY.range(5)).to eq([0, 1, 2, 3, 4])
    expect(CY.range(2, 7)).to eq([2, 3, 4, 5, 6])
    expect(CY.range(10, 50, 5)).to eq([10, 15, 20, 25, 30, 35, 40, 45])
    expect(CY.range(0, 1, 0.2)).to eq([0, 0.2, 0.4, 0.6000000000000001, 0.8])
  end

  it "d3.transpose" do
    expect(CY.transpose([[1, 2], [3, 4]])).to eq([[1, 3], [2, 4]])
  end

  it "d3.zip" do
    expect(CY.zip([1, 2], [3, 4])).to eq([[1, 3], [2, 4]])
    expect(CY.zip([1, 2, 5], [3, 4])).to eq([[1, 3], [2, 4]])
    expect(CY.zip([1, 2], [3, 4, 5])).to eq([[1, 3], [2, 4]])
    expect(CY.zip([1, 2], [3, 4], [5, 6])).to eq([[1, 3, 5], [2, 4, 6]])
    expect(CY.zip([1, 2])).to eq([[1], [2]])
    expect(CY.zip([1, 2], [])).to eq([])
    expect(CY.zip([])).to eq([])
    expect(CY.zip()).to eq([])
  end
end
