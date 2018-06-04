describe "d3 - creator" do
  after(:each) do
    CY.select("#test-area").html("")
  end
  let(:root) { CY.select("#test-area") }
  let(:html) { root.html }

  it "d3.creator" do
    expect(CY.creator("div")).to be_instance_of(CY::Creator)
    CY.select("div").append(CY.creator("span"))
    expect(html).to eq(
      "<span></span>"
    )
  end
end
