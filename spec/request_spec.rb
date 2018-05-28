# opal-rspec and async testing don't currently work very well
# so these are completely untested, except for the doesn't crash part
describe "d3-random" do
  it "d3.json" do
    CY.json("/test.json")
  end

  it "d3.json" do
    CY.json("/test.json")
  end

  it "d3.json" do
    CY.json("/test.json")
  end

  it "d3.text" do
    CY.text("/test.text")
  end

  it "d3.tsv" do
    CY.tsv("/test.tsv")
  end

  it "d3.xml" do
    CY.xml("/test.xml")
  end
end
