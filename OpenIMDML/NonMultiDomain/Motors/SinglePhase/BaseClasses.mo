within OpenIMDML.NonMultiDomain.Motors.SinglePhase;
package BaseClasses
  extends Modelica.Icons.BasesPackage;
  model BaseSPIM_DPIM "Base class model for the single-phase and dual-phase induction motor models"

    extends OpenIPSL.Electrical.Essentials.pfComponent(
      final enabledisplayPF=false,
      final enablefn=false,
      final enableV_b=false,
      final enableangle_0=true,
      final enablev_0=true,
      final enableQ_0=true,
      final enableP_0=true,
      final enableS_b=true);

    OpenIPSL.Interfaces.PwPin p
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Text(
            extent={{-100,-60},{100,-100}},
            lineColor={28,108,200},
            textString="%name"),             Text(
            extent={{-50,50},{50,-50}},
            lineColor={0,0,0},
            textString="M"),                Ellipse(
            fillColor={255,255,255},
            extent={{-56,-56},{55.932,56}}),
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end BaseSPIM_DPIM;
end BaseClasses;
