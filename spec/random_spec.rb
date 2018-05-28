describe "d3-random" do
  # Not really testing anything more meaningful,
  # just that they return some numbers
  # http://xkcd.com/221/
  it "d3.random_uniform" do
    expect(CY.random_uniform.call).to be_a(Numeric)
    expect(CY.random_uniform(10).call).to be_a(Numeric)
    expect(CY.random_uniform(10, 20).call).to be_a(Numeric)
  end

  it "d3.random_normal" do
    expect(CY.random_normal.call).to be_a(Numeric)
    expect(CY.random_normal(10).call).to be_a(Numeric)
    expect(CY.random_normal(10, 2).call).to be_a(Numeric)
  end

  it "d3.random_log_normal" do
    expect(CY.random_log_normal.call).to be_a(Numeric)
    expect(CY.random_log_normal(10).call).to be_a(Numeric)
    expect(CY.random_log_normal(10, 2).call).to be_a(Numeric)
  end

  it "d3.random_bates" do
    expect(CY.random_bates(5).call).to be_a(Numeric)
  end

  it "d3.random_irwin_hall" do
    expect(CY.random_irwin_hall(5).call).to be_a(Numeric)
  end

  it "d3.random_exponential" do
    expect(CY.random_exponential(3).call).to be_a(Numeric)
  end
end
