describe "d3 - stack" do
  it "d3.stack" do
    expect(CY.stack).to be_instance_of(CY::StackGenerator)
  end
end
