describe "d3 - curve" do
  let(:curve) { D3.send(name) }
  # 5   x-x
  #    /   \
  # 4 x    |  x
  #        \ /
  # 3       x
  #   0 1 2 3 4
  let(:data) { [[0, 4], [1, 5], [2, 5], [3, 3], [4, 4]] }
  let(:line) { D3.line.curve(curve).(data) }
  describe "curve_basis" do
    let(:name){ :curve_basis }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L0.16666666666666666,4.166666666666667C0.3333333333333333,4.333333333333333,0.6666666666666666,4.666666666666667,1,4.833333333333333C1.3333333333333333,5,1.6666666666666667,5,2,4.666666666666667C2.3333333333333335,4.333333333333333,2.6666666666666665,3.6666666666666665,3,3.5C3.3333333333333335,3.3333333333333335,3.6666666666666665,3.6666666666666665,3.8333333333333335,3.8333333333333335L4,4")
    end
  end

  describe "curve_basis_closed" do
    let(:name){ :curve_basis_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,4.833333333333333C1.3333333333333333,5,1.6666666666666667,5,2,4.666666666666667C2.3333333333333335,4.333333333333333,2.6666666666666665,3.6666666666666665,3,3.5C3.3333333333333335,3.3333333333333335,3.6666666666666665,3.6666666666666665,3.1666666666666665,3.8333333333333335C2.6666666666666665,4,1.3333333333333333,4,0.8333333333333334,4.166666666666667C0.3333333333333333,4.333333333333333,0.6666666666666666,4.666666666666667,1,4.833333333333333")
    end
  end

  describe "curve_basis_open" do
    let(:name){ :curve_basis_open }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,4.833333333333333C1.3333333333333333,5,1.6666666666666667,5,2,4.666666666666667C2.3333333333333335,4.333333333333333,2.6666666666666665,3.6666666666666665,3,3.5")
    end
  end

  describe "curve_bundle" do
    let(:name){ :curve_bundle }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L0.16666666666666666,4.141666666666667C0.3333333333333333,4.283333333333333,0.6666666666666666,4.566666666666666,1,4.708333333333333C1.3333333333333333,4.85,1.6666666666666667,4.85,2,4.566666666666666C2.3333333333333335,4.283333333333333,2.6666666666666665,3.7166666666666663,3,3.5749999999999997C3.3333333333333335,3.4333333333333336,3.6666666666666665,3.716666666666667,3.8333333333333335,3.858333333333333L4,4")
    end
  end

  describe "curve_cardinal" do
    let(:name){ :curve_cardinal }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4C0,4,0.6666666666666667,4.833333333333333,1,5C1.3333333333333333,5.166666666666667,1.6666666666666667,5.333333333333333,2,5C2.3333333333333335,4.666666666666667,2.6666666666666665,3.1666666666666665,3,3C3.3333333333333335,2.8333333333333335,4,4,4,4")
    end
  end

  describe "curve_cardinal_closed" do
    let(:name){ :curve_cardinal_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,5C1.3333333333333333,5.166666666666667,1.6666666666666667,5.333333333333333,2,5C2.3333333333333335,4.666666666666667,2.6666666666666665,3.1666666666666665,3,3C3.3333333333333335,2.8333333333333335,4.5,3.8333333333333335,4,4C3.5,4.166666666666667,0.5,3.8333333333333335,0,4C-0.5,4.166666666666667,0.6666666666666667,4.833333333333333,1,5")
    end
  end

  describe "curve_cardinal_open" do
    let(:name){ :curve_cardinal_open }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,5C1.3333333333333333,5.166666666666667,1.6666666666666667,5.333333333333333,2,5C2.3333333333333335,4.666666666666667,2.6666666666666665,3.1666666666666665,3,3")
    end
  end

  describe "curve_catmull_rom" do
    let(:name){ :curve_catmull_rom }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4C0,4,0.6324067062410562,4.847737872287649,1,5C1.3091078829932015,5.12803667737222,1.7109169531084498,5.178663148550358,2,5C2.4322799818409973,4.732836278566078,2.6188682249873008,3.0618491726648824,3,3C3.3031029444706292,2.9508131633811603,4,4,4,4")
    end
  end

  describe "curve_catmull_rom_closed" do
    let(:name){ :curve_catmull_rom_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,5C1.3091078829932015,5.12803667737222,1.7109169531084498,5.178663148550358,2,5C2.4322799818409973,4.732836278566078,2.6188682249873008,3.0618491726648824,3,3C3.3031029444706292,2.9508131633811603,4.086586529177225,3.7909616269415296,4,4C3.854379396011221,4.351559237110673,0.14562060398877938,3.648440762889328,0,4C-0.08658652917722502,4.20903837305847,0.6324067062410562,4.847737872287649,1,5")
    end
  end

  describe "curve_catmull_rom_open" do
    let(:name){ :curve_catmull_rom_open }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M1,5C1.3091078829932015,5.12803667737222,1.7109169531084498,5.178663148550358,2,5C2.4322799818409973,4.732836278566078,2.6188682249873008,3.0618491726648824,3,3")
    end
  end

  describe "curve_linear" do
    let(:name){ :curve_linear }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L1,5L2,5L3,3L4,4")
    end
  end

  describe "curve_linear_closed" do
    let(:name){ :curve_linear_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L1,5L2,5L3,3L4,4Z")
    end
  end

  describe "curve_monotone_x" do
    let(:name){ :curve_monotone_x }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4C0.3333333333333333,4.5,0.6666666666666667,5,1,5C1.3333333333333333,5,1.6666666666666667,5,2,5C2.3333333333333335,5,2.6666666666666665,3,3,3C3.3333333333333335,3,3.6666666666666665,3.5,4,4")
    end
  end

  describe "curve_monotone_y" do
    let(:name){ :curve_monotone_y }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4C0.16666666666666666,4.333333333333333,0.33333333333333337,4.666666666666667,1,5C1,5,2,5,2,5C2.6666666666666665,4.333333333333333,3,3.6666666666666665,3,3C3,3.3333333333333335,3.5,3.6666666666666665,4,4")
    end
  end

  describe "curve_natural" do
    let(:name){ :curve_natural }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4C0.33333333333333326,4.357142857142858,0.6666666666666665,4.714285714285714,1,5C1.3333333333333335,5.285714285714286,1.666666666666667,5.5,2,5C2.333333333333333,4.5,2.6666666666666665,3.2857142857142856,3,3C3.3333333333333335,2.7142857142857144,3.666666666666667,3.357142857142857,4,4")
    end
  end

  describe "curve_step" do
    let(:name){ :curve_step }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L0.5,4L0.5,5L1.5,5L1.5,5L2.5,5L2.5,3L3.5,3L3.5,4L4,4")
    end
  end

  describe "curve_step_after" do
    let(:name){ :curve_step_after }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L1,4L1,5L2,5L2,5L3,5L3,3L4,3L4,4")
    end
  end

  describe "curve_step_before" do
    let(:name){ :curve_step_before }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(line).to eq("M0,4L0,5L1,5L1,5L2,5L2,3L3,3L3,4L4,4")
    end
  end

end
