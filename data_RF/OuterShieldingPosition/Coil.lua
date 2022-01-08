	--Define problem

for variable = 0,35,5 do
	
	var = variable/10
	
	newdocument(0)
	mi_probdef(44000,"centimeters","axi",1e-008)

	mi_getmaterial("Air")
	mi_getmaterial("18 AWG")
	mi_addmaterial("Aluminium 5052", 1, 1, 0, 0, 20.04)

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

	position2 = 16.5 - var
	length = 3
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









	--Setting materials

	mi_addcircprop("coil", 0.6, 1)

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
	
	newstr = tostring(variable)
	mi_saveas("C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\FarShield.FEM")
	mi_createmesh()
	
	mi_analyze()
	mi_loadsolution()

	--Analysis

	mo_getpointvalues(0,-6)
	mo_addcontour(0,28)
	mo_selectpoint(0,-28)
	mo_makeplot(2, 560, "C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\Y=0mmPlotNormal.txt", 0)
	mo_makeplot(3, 560, "C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\Y=0mmPlotTangent.txt", 0)
	mo_clearcontour()
	
	mo_getpointvalues(0,-6)
	mo_addcontour(4.25,28)
	mo_selectpoint(4.25,-28)
	mo_makeplot(2, 560, "C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\Y=42.5mmPlotNormal.txt", 0)
	mo_makeplot(3, 560, "C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\Y=42.5mmPlotTangent.txt", 0)
	mo_clearcontour()
	
	mo_showdensityplot(1, 0, 0.000390318120018651, 1.15660153653664e-009, "bmag")
	mo_savebitmap("C:\\Users\\marta\\Desktop\\Denis Stuff\\DistanceFromEdge" .. newstr .. "mm\\ContourMap.jpg")
	
	
	
end