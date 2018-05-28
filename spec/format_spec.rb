describe "d3 - format" do
  it "d3.format" do
    expect(CY.format(".2").(42)).to eq("42")
    expect(CY.format(".2").(4.2)).to eq("4.2")
    expect(CY.format(".1").(42)).to eq("4e+1")
    expect(CY.format(".1").(4.2)).to eq("4")
    expect(CY.format(".0%").(0.123)).to eq("12%")
    expect(CY.format("($.2f").(-3.5)).to eq("($3.50)")
    expect(CY.format("+20").(42)).to eq("                 +42")
    expect(CY.format(".^20").(42)).to eq(".........42.........")
    expect(CY.format(".2s").(42e6)).to eq("42M")
    expect(CY.format("#x").(48879)).to eq("0xbeef")
    expect(CY.format(",.2r").(4223)).to eq("4,200")
  end

  it "d3.format_prefix" do
    f = CY.format_prefix(",.0", 1e-6)
    expect(f.(0.0042)).to eq("4,200µ")
    expect(f.(0.00042)).to eq("420µ")
  end

  it "d3.format_specifier" do
    expect(CY.format_specifier("s")).to be_instance_of(CY::FormatSpecifier)
    expect(CY.format_specifier("s").to_h).to eq({
      fill: " ",
      align: ">",
      sign: "-",
      symbol: "",
      zero: false,
      width: nil,
      comma: false,
      precision: nil,
      type: "s",
    })
    s = CY.format_specifier("f")
    s.precision = CY.precision_fixed(0.01)
    f = CY.format(s)
    expect(f.(42)).to eq("42.00")
  end

  it "d3.precision_fixed" do
    expect(CY.precision_fixed(0.5)).to eq(1)
  end

  it "d3.precision_prefix" do
    expect(CY.precision_prefix(1e5, 1.3e6)).to eq(1)
  end

  it "d3.precision_round" do
    expect(CY.precision_round(0.01, 1.01)).to eq(3)
  end

  let(:pl) {{
    decimal: ",",
    thousands: ".",
    grouping: [3],
    currency: ["", "zł"],
  }}
  let(:us) {{
    decimal: ".",
    thousands: ",",
    grouping: [3],
    currency: ["$", ""],
  }}
  it "d3.format_locale" do
    locale = CY.format_locale(pl)
    expect(locale).to be_instance_of(CY::FormatLocale)
    expect(locale.format("$.2f").(-3.5)).to eq("-3,50zł")
    expect(locale.format("$.2f").(123456.789)).to eq("123456,79zł")
    expect(locale.format(",.2r").(4223)).to eq("4.200")
    expect(locale.format_prefix(",.0", 1e-3).(123456.789012)).to eq("123.456.789m")
  end

  # This test affects global state, so we must be sure to restore it
  it "d3.format_default_locale" do
    expect(CY.format(",.2r").(4223)).to eq("4,200")

    locale_pl = CY.format_default_locale(pl)
    expect(CY.format(",.2r").(4223)).to eq("4.200")
    expect(locale_pl.format(",.2r").(4223)).to eq("4.200")

    locale_us = CY.format_default_locale(us)
    expect(CY.format(",.2r").(4223)).to eq("4,200")
    expect(locale_pl.format(",.2r").(4223)).to eq("4.200")
    expect(locale_us.format(",.2r").(4223)).to eq("4,200")
  end
end
