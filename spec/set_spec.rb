describe "d3-collections - sets" do
  it "d3.set" do
    expect(CY.set).to be_instance_of(CY::Set)
    expect(CY.set.values).to eq([])
    expect(CY.set([1, -2, 3, 1]).values).to eq(["1", "-2", "3"])
    expect(CY.set([1, -2, 3, -1], &:abs).values).to eq(["1", "2", "3"])
  end

  it "set.has?" do
    expect(CY.set(["1"]).has?("2")).to eq(false)
    # everything converted to strings
    expect(CY.set(["1"]).has?("1")).to eq(true)
    expect(CY.set([1]).has?(1)).to eq(true)
    expect(CY.set([1]).has?("1")).to eq(true)
    expect(CY.set(["1"]).has?(1)).to eq(true)
  end

  it "set.add" do
    s = CY.set()
    s.add(1).add(2).add(3).add(1)
    expect(s.values).to eq(["1", "2", "3"])
  end

  it "set.clear" do
    s = CY.set()
    s.add(1).add(2).add(3).clear().add(1)
    expect(s.values).to eq(["1"])
  end

  it "set.values" do
    expect(CY.set().values).to eq([])
    expect(CY.set([1]).values).to eq(["1"])
    expect(CY.set([1, 2, "1", "2", 3]).values).to eq(["1", "2", "3"])
  end

  it "set.each" do
    called = []
    CY.set([1, 2, 3]).each{|x|
      called << x
    }
    expect(called).to eq(["1","2","3"])
  end

  it "set.empty?" do
    a = CY.set()
    expect(a).to be_empty
    b = CY.set([1])
    expect(b).to_not be_empty
  end

  it "set.size" do
    a = CY.set()
    expect(a.size).to eq(0)
    b = CY.set([1, 2, 3])
    expect(b.size).to eq(3)
  end
end
