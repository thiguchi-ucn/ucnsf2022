	--Define problem
for vals = 1, 20, 1 do

	current =vals/10

	newdocument(0)
	mi_probdef(44000,"centimeters","axi",1e-008)

	mi_getmaterial("Air")
	mi_getmaterial("18 AWG")
	mi_addmaterial("Aluminium 5052", 1, 1, 0, 0, 20.04)
	mi_addmaterial("OxyFreeCopper", 1, 1, 0, 0, 59.172)

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
	mi_saveas("M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\FarShield.FEM")
	mi_createmesh()

	mi_analyze()
	mi_loadsolution()

	--Analysis

	mo_getpointvalues(0,-6)
	mo_addcontour(0,28)
	mo_selectpoint(0,-28)
	mo_makeplot(2, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\Y=0mmPlotNormal.txt", 0)
	mo_makeplot(3, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\Y=0mmPlotTangent.txt", 0)
	mo_clearcontour()

	mo_getpointvalues(0,-6)
	mo_addcontour(4.25,28)
	mo_selectpoint(4.25,-28)
	mo_makeplot(2, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\Y=42.5mmPlotNormal.txt", 0)
	mo_makeplot(3, 560, "M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\Y=42.5mmPlotTangent.txt", 0)
	mo_clearcontour()

	mo_showdensityplot(1, 0, 0.000390318120018651, 1.15660153653664e-009, "bmag")
	mo_savebitmap("M:\\ParticlePhysics\\UCN\\_Users\\dgeorgescu\\CurrentSweep(NoShield)\\" .. Cstring .. "e-1A\\ContourMap.jpg")

end
