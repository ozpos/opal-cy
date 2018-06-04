describe "d3-collections - maps" do
  it "d3.map" do
    expect(CY.map).to be_instance_of(CY::Map)
  end

  it "d3.has?" do
    expect(CY.map().has?("1")).to eq(false)
    expect(CY.map(["a", "b"]).has?("0")).to eq(true)
    expect(CY.map(["a", "b"]).has?(0)).to eq(true)
    expect(CY.map(["a", "b"]).has?(2)).to eq(false)
    expect(CY.map(["a", "b"]).has?("a")).to eq(false)
  end

  it "d3.get" do
    a = CY.map(["a", "b"])
    expect(nil).to eq(nil)
    expect(a[0]).to eq("a")
    expect(a[2]).to eq(nil)
    expect(a.get(0)).to eq("a")
    expect(a.get(2)).to eq(nil)
  end

  it "d3.set" do
    a = CY.map.set("foo", 1).set("bar", 2)
    a["baz"] = 3
    expect(a["foo"]).to eq(1)
    expect(a["bar"]).to eq(2)
    expect(a["baz"]).to eq(3)
  end

  it "map.remove" do
    a = CY.map.set("a", 1).set("b", 2).remove("a").set("c", 3)
    expect(a.keys).to eq(["b", "c"])
  end

  it "map.clear" do
    a = CY.map.set("a", 1).set("b", 2).clear.set("c", 3)
    expect(a.keys).to eq(["c"])
  end

  it "map.keys" do
    a = CY.map.set("foo", 1).set("bar", 2)
    expect(a.keys).to eq(["foo", "bar"])
  end

  it "map.values" do
    a = CY.map.set("foo", 1).set("bar", 2)
    expect(a.values).to eq([1, 2])
  end

  it "map.entries" do
    a = CY.map.set("foo", 1).set("bar", 2)
    expect(a.entries).to eq([["foo", 1], ["bar", 2]])
  end

  it "map.to_h" do
    a = CY.map.set("foo", 1).set("bar", 2)
    expect(a.to_h).to eq({"foo" => 1, "bar" => 2})
  end

  it "map.each" do
    called = []
    a = CY.map.set("foo", 1).set("bar", 2)
    a.each do |v,k|
      called << [k,v]
    end
    expect(called).to eq([["foo",1], ["bar",2]])

  end

  it "map.empty" do
    expect(CY.map).to be_empty
    expect(CY.map(["a"])).to_not be_empty
  end

  it "map.size" do
    expect(CY.map.size).to eq(0)
    expect(CY.map(["a"]).size).to eq(1)
  end
end
