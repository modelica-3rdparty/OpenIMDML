within OpenIMDML.Examples.NonMultiDomainExamples.SinglePhaseInductionMotors;
model DualPhaseInductionMotor
  extends Modelica.Icons.Example;

  inner OpenIPSL.Electrical.SystemBase SysData(fn=60, S_b=100000000) annotation (Placement(transformation(extent={{40,30},
            {80,50}})));
  OpenIMDML.NonMultiDomain.Motors.SinglePhase.NMD_DPIM DPIM(
    V_b=230,
    init=2,
    switch_open_speed=0.2,
    Lmainr=0.000588,
    Lmain=0.0806,
    Lauxr=0.000909,
    Laux=0.196,
    Lr=0.0000047,
    Rmain=0.58,
    Rr=0.0000376,
    Raux=3.37,
    Cc(displayUnit="F") = 0.001,
    H=0.00005,
    a=0.000039,
    b=0,
    c=0) annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  OpenIPSL.Electrical.Buses.Bus inf_bus(V_b=230)
    annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(V_b=230)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Buses.Bus load_bus(V_b=230)
    annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{-2,6},{18,26}})));
  OpenIPSL.Electrical.Events.PwFault Fault(
    R=0.001,
    X=0.001,
    t1=50,
    t2=50.3)
            annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
  OpenIPSL.Electrical.Branches.PwLine Line1(
    G=0,
    B=0,
    R=0.5*2.50000E-3,
    X=0.5*2.50000E-3)
    annotation (Placement(transformation(extent={{-18,-26},{2,-6}})));
  OpenIPSL.Electrical.Branches.PwLine Line2(
    G=0,
    B=0,
    R=0.5*2.50000E-3,
    X=0.5*2.50000E-3)
    annotation (Placement(transformation(extent={{10,-26},{30,-6}})));
equation
  connect(gENCLS.p, inf_bus.p)
    annotation (Line(points={{-40,0},{-26,0}}, color={0,0,255}));
  connect(Line.n, load_bus.p)
    annotation (Line(points={{17,16},{32,16},{32,0},{42,0}}, color={0,0,255}));
  connect(inf_bus.p, Line.p) annotation (Line(points={{-26,0},{-20,0},{-20,16},{
          -1,16}}, color={0,0,255}));
  connect(Line1.p, Line.p) annotation (Line(points={{-17,-16},{-20,-16},{-20,16},
          {-1,16}}, color={0,0,255}));
  connect(Line1.n, Line2.p)
    annotation (Line(points={{1,-16},{11,-16}}, color={0,0,255}));
  connect(Line2.n, load_bus.p) annotation (Line(points={{29,-16},{32,-16},{32,0},
          {42,0}}, color={0,0,255}));
  connect(Fault.p, Line2.p) annotation (Line(points={{38.3333,-36},{6,-36},{6,
          -16},{11,-16}},
                     color={0,0,255}));
  connect(load_bus.p, DPIM.p)
    annotation (Line(points={{42,0},{60,0}}, color={0,0,255}));
  annotation (                                        experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_Algorithm="Dassl"));
end DualPhaseInductionMotor;
