describe "d3-colors" do
  it "d3.color" do
    expect(CY.color("blue")).to be_instance_of(CY::Color)
  end

  it "supported syntax" do
    expect(CY.color("rgb(255, 255, 255)").to_s).to eq("rgb(255, 255, 255)")
    expect(CY.color("rgb(10%, 20%, 30%)").to_s).to eq("rgb(26, 51, 77)")
    expect(CY.color("rgba(255, 255, 255, 0.4)").to_s).to eq("rgba(255, 255, 255, 0.4)")
    expect(CY.color("rgba(10%, 20%, 30%, 0.4)").to_s).to eq("rgba(26, 51, 77, 0.4)")
    expect(CY.color("hsl(120, 50%, 20%)").to_s).to eq("rgb(25, 77, 25)")
    expect(CY.color("hsla(120, 50%, 20%, 0.4)").to_s).to eq("rgba(25, 77, 25, 0.4)")
    expect(CY.color("#ffeeaa").to_s).to eq("rgb(255, 238, 170)")
    expect(CY.color("#fea").to_s).to eq("rgb(255, 238, 170)")
    expect(CY.color("steelblue").to_s).to eq("rgb(70, 130, 180)")
  end

  it "invalid colors" do
    expect{ CY.color("poop_emoji") }.to raise_error(/Invalid color/)
  end

  it "color.brighter" do
    steelblue = CY.color("steelblue")
    expect(steelblue.brighter.to_s).to eq("rgb(100, 186, 255)")
    expect(steelblue.brighter(0.25).to_s).to eq("rgb(77, 142, 197)")
  end

  it "color.darker" do
    steelblue = CY.color("steelblue")
    expect(steelblue.darker.to_s).to eq("rgb(49, 91, 126)")
    expect(steelblue.darker(0.25).to_s).to eq("rgb(64, 119, 165)")
  end

  it "color.displayable?" do
    expect(CY.color("rgb(255,255,255)")).to be_displayable
    expect(CY.color("rgb(260,260,260)")).to_not be_displayable
  end

  it "d3.rgb" do
    steelblue = CY.rgb("steelblue")
    expect([steelblue.r, steelblue.g, steelblue.b]).to eq([70, 130, 180])
    expect(CY.rgb(10, 20, 30).to_s).to eq("rgb(10, 20, 30)")
    expect(CY.rgb(10, 20, 30, 0.5).to_s).to eq("rgba(10, 20, 30, 0.5)")
    expect(CY.rgb(CY.hsl("steelblue")).to_s).to eq("rgb(70, 130, 180)")
  end

  it "d3.hsl" do
    steelblue = CY.hsl("steelblue")
    expect([steelblue.h, steelblue.s, steelblue.l]).to eq([207.27272727272728, 0.44, 0.4901960784313726])
    expect(CY.hsl(207.27272727272728, 0.44, 0.4901960784313726).to_s).to eq("rgb(70, 130, 180)")
    expect(CY.hsl(207.27272727272728, 0.44, 0.4901960784313726, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.lab" do
    steelblue = CY.lab("steelblue")
    expect([steelblue.l, steelblue.a, steelblue.b]).to eq([52.46551718768575, -4.0774710123572255, -32.19186122981343])
    expect(CY.lab(52.46551718768575, -4.0774710123572255, -32.19186122981343).to_s).to eq("rgb(70, 130, 180)")
    expect(CY.lab(52.46551718768575, -4.0774710123572255, -32.19186122981343, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.hcl" do
    steelblue = CY.hcl("steelblue")
    expect([steelblue.h, steelblue.c, steelblue.l]).to eq([262.78126775909277, 32.44906314974561, 52.46551718768575])
    expect(CY.hcl(262.78126775909277, 32.44906314974561, 52.46551718768575).to_s).to eq("rgb(70, 130, 180)")
    expect(CY.hcl(262.78126775909277, 32.44906314974561, 52.46551718768575, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.cubehelix" do
    steelblue = CY.cubehelix("steelblue")
    expect([steelblue.h, steelblue.s, steelblue.l]).to eq([202.84837896488932, 0.6273147230777709, 0.460784355920337])
    expect(CY.cubehelix(202.84837896488932, 0.6273147230777709, 0.460784355920337).to_s).to eq("rgb(70, 130, 180)")
    expect(CY.cubehelix(202.84837896488932, 0.6273147230777709, 0.460784355920337, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end
end
