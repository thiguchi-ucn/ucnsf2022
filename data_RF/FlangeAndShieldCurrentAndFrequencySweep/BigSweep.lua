--Define problem
for Freqs = 40,200,20 do
	for vals = 1, 20, 1 do
	
		current = vals/10
		Fwequency = Freqs*1000
		
		newdocument(0)
		mi_probdef(Fwequency,"centimeters","axi",1e-008)

		mi_getmaterial("Air")
		mi_getmaterial("18 AWG")
		mi_addmaterial("Aluminium 5052", 1, 1, 0, 0, 20.04)
		mi_getmaterial("Copper")
		mi_getmaterial("Aluminum, 6061-T6")

		--box

		mi_addnode(26,28)
		mi_addnode(0,28)
		mi_addnode(0,-28)
		mi_addnode(26,-28)
		mi_addnode(0,0)

		mi_addsegment(26,28, 0,28)
		mi_addsegment(26,28, 26, -28)
		mi_addsegment(0,-28, 26,-28)
		mi_addsegment(0,-28, 0,28)

		mi_addnode(4.25,28)
		mi_addnode(4.25,-28)

		--Coil 1

		a_long = 5.5
		a_short = 5.4
		b_long = 7.9
		b_short = 4.9

		mi_addnode(a_long,b_long)
		mi_addnode(a_long,b_short)
		mi_addnode(a_short,b_long)
		mi_addnode(a_short,b_short)


		mi_addsegment(a_long,b_long, a_long,b_short)
		mi_addsegment(a_long,b_long, a_short,b_long)
		mi_addsegment(a_short,b_long, a_short,b_short)
		mi_addsegment(a_short,b_short, a_long,b_short)

		--Coil 2

		mi_addnode(a_long,-b_long)
		mi_addnode(a_long,-b_short)
		mi_addnode(a_short,-b_long)
		mi_addnode(a_short,-b_short)


		mi_addsegment(a_long,-b_long, a_long,-b_short)
		mi_addsegment(a_long,-b_long, a_short,-b_long)
		mi_addsegment(a_short,-b_long, a_short,-b_short)
		mi_addsegment(a_short,-b_short, a_long,-b_short)

		--Shield 1

		position2 = 14.5
		length = 2
		position1 = position2 - length

		inner = 4.5
		outer = inner + 0.3

		mi_addnode(inner,position1)
		mi_addnode(inner,position2)
		mi_addnode(outer,position1)
		mi_addnode(outer,position2)

		mi_addsegment(inner,position1, outer,position1)
		mi_addsegment(inner,position1, inner,position2)
		mi_addsegment(outer,position2, outer,position1)
		mi_addsegment(outer,position2, inner,position2)

		mi_addblocklabel(inner+0.001,position1+0.001)
		mi_selectlabel(inner+0.001,position1+0.001)
		mi_setblockprop("Aluminium 5052", 0, 0.05)
		mi_clearselected()

		--Shield 2

		mi_addnode(inner,-position1)
		mi_addnode(inner,-position2)
		mi_addnode(outer,-position1)
		mi_addnode(outer,-position2)

		mi_addsegment(inner,-position1, outer,-position1)
		mi_addsegment(inner,-position1, inner,-position2)
		mi_addsegment(outer,-position2, outer,-position1)
		mi_addsegment(outer,-position2, inner,-position2)

		mi_addblocklabel(inner+0.001,-position1-0.001)
		mi_selectlabel(inner+0.001,-position1-0.001)
		mi_setblockprop("Aluminium 5052", 0, 0.05)
		mi_clearselected()

		--Middle Shield 

		var = 0.2

		MiddlePos1 = (var)/2

		mi_addnode(5.1,MiddlePos1)
		mi_addnode(5.1,-MiddlePos1)
		mi_addnode(6.025,MiddlePos1)
		mi_addnode(6.025,-MiddlePos1)

		mi_addsegment(5.1,MiddlePos1, 6.025,MiddlePos1)
		mi_addsegment(5.1,MiddlePos1, 5.1,-MiddlePos1)
		mi_addsegment(6.025,-MiddlePos1, 6.025,MiddlePos1)
		mi_addsegment(6.025,-MiddlePos1, 5.1,-MiddlePos1)

		mi_addblocklabel(5.1+0.001,0)
		mi_selectlabel(5.1+0.001,0)
		mi_setblockprop("Copper", 0, 0.05)
		mi_clearselected()

		--AlFlanges(Shielding)1

		L = 15.6

		mi_addnode(4.635, L)
		mi_addnode(6.9, L)
		mi_addnode(6.9, L + 1.3)
		mi_addnode(5.225, L + 1.3)
		mi_addnode(4.635, L + 0.69)

		mi_addnode(4.635, L + 1.6)
		mi_addnode(6.9, L + 1.6)
		mi_addnode(6.9, L + 4.6)
		mi_addnode(4.25, L + 4.6)
		mi_addnode(4.25, L + 2.447)
		mi_addnode(4.635, L + 2.447)

		mi_addsegment(4.635, L,    6.9, L)
		mi_addsegment(6.9, L,    6.9, L + 1.3)
		mi_addsegment(6.9, L + 1.3,     5.225, L + 1.3)
		mi_addsegment(5.225, L + 1.3,     4.635, L + 0.69)
		mi_addsegment(4.635, L + 0.69,    4.635, L)

		mi_addsegment(4.635, L + 1.6,     6.9, L + 1.6)
		mi_addsegment(6.9, L + 1.6,     6.9, L + 4.6)
		mi_addsegment(6.9, L + 4.6,     4.25, L + 4.6)
		mi_addsegment(4.25, L + 4.6,     4.25, L + 2.447)
		mi_addsegment(4.25, L + 2.447,   4.635, L + 2.447)
		mi_addsegment(4.635, L + 2.447,   4.635, L + 1.6)

		mi_addblocklabel(5,L+0.01)
		mi_selectlabel(5,L+0.01)
		mi_setblockprop("Aluminum, 6061-T6", 0, 0.05)
		mi_clearselected()

		mi_addblocklabel(5,L+0.01+1.6)
		mi_selectlabel(5,L+0.01+1.6)
		mi_setblockprop("Aluminum, 6061-T6", 0, 0.05)
		mi_clearselected()

		--AlFlanges(Shielding)2

		mi_addnode(4.635, -L)
		mi_addnode(6.9, -L)
		mi_addnode(6.9, -L - 1.3)
		mi_addnode(5.225, -L - 1.3)
		mi_addnode(4.635, -L - 0.69)

		mi_addnode(4.635, -L - 1.6)
		mi_addnode(6.9, -L - 1.6)
		mi_addnode(6.9, -L - 4.6)
		mi_addnode(4.25, -L - 4.6)
		mi_addnode(4.25, -L - 2.447)
		mi_addnode(4.635, -L - 2.447)

		mi_addsegment(4.635, -L,    6.9, -L)
		mi_addsegment(6.9, -L,    6.9, -L - 1.3)
		mi_addsegment(6.9, -L - 1.3,     5.225, -L - 1.3)
		mi_addsegment(5.225, -L - 1.3,     4.635, -L - 0.69)
		mi_addsegment(4.635, -L - 0.69,    4.635, -L)

		mi_addsegment(4.635, -L - 1.6,     6.9, -L - 1.6)
		mi_addsegment(6.9, -L - 1.6,     6.9, -L - 4.6)
		mi_addsegment(6.9, -L - 4.6,     4.25, -L - 4.6)
		mi_addsegment(4.25, -L - 4.6,     4.25, -L - 2.447)
		mi_addsegment(4.25, -L - 2.447,   4.635, -L - 2.447)
		mi_addsegment(4.635, -L - 2.447,   4.635, -L - 1.6)

		mi_addblocklabel(5,-L-0.01)
		mi_selectlabel(5,-L-0.01)
		mi_setblockprop("Aluminum, 6061-T6", 0, 0.05)
		mi_clearselected()

		mi_addblocklabel(5,-L-0.01-1.6)
		mi_selectlabel(5,-L-0.01-1.6)
		mi_setblockprop("Aluminum, 6061-T6", 0, 0.05)
		mi_clearselected()

		--Setting materials

		mi_addcircprop("coil", current, 1)

		mi_addblocklabel(5.45,6)
		mi_selectlabel(5.45,6)
		mi_setblockprop("18 AWG", 0, 0.1, "coil", 0, 0, 30)
		mi_clearselected()

		mi_addblocklabel(5.45,-6)
		mi_selectlabel(5.45,-6)
		mi_setblockprop("18 AWG", 0, 0.1, 0, 0)
		mi_clearselected()

		mi_addblocklabel(2,2)
		mi_selectlabel(2,2)
		mi_setblockprop("Air", 0, 0.5)
		mi_clearselected()

		--Save and run
		
		Cstring = tostring(vals)
		Pstring = tostring(Freqs)
		
		mi_saveas("M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\FarShield.FEM")
		mi_createmesh()

		mi_analyze()
		mi_loadsolution()

		--Analysis

		mo_getpointvalues(0,-6)
		mo_addcontour(0,28)
		mo_selectpoint(0,-28)
		mo_makeplot(2, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\Y=0mmPlotNormal.txt", 0)
		mo_makeplot(3, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\Y=0mmPlotTangent.txt", 0)
		mo_clearcontour()

		mo_getpointvalues(0,-6)
		mo_addcontour(4.25,28)
		mo_selectpoint(4.25,-28)
		mo_makeplot(2, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\Y=42.5mmPlotNormal.txt", 0)
		mo_makeplot(3, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\Y=42.5mmPlotTangent.txt", 0)
		mo_clearcontour()

		mo_showdensityplot(1, 0, 0.000390318120018651, 1.15660153653664e-009, "bmag")
		mo_savebitmap("M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\TakashiSpinFlipperDesign\\FemmSimulations\\FlangeAndShieldCurrentAndFrequencySweep\\".. Pstring .. "kHz\\" .. Cstring .. "e-1A\\ContourMap.jpg")
		
	end
end
