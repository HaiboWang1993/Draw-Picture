quyu=(/"A","B","C","D"/)
;hangshu=(/"540","390","750","176"/)
hangshu=(/504,390,750,176/)

fname1  ="/mnt/h/Twoparameter/N_NET_"+quyu(0)+".txt"
fname2  ="/mnt/h/Twoparameter/N_NET_CERES_"+quyu(0)+".txt"
data11   = asciiread(fname1,(/hangshu(0),8/),"float") 
data22   = asciiread(fname2,(/hangshu(0),4/),"float") 
;model djf
data1=data11(:,4);x1
data2=data11(:,0);y1
data3=data11(:,5);x2
data4=data11(:,1);y2
;model jja
data5=data11(:,6);x3
data6=data11(:,2);y3
data7=data11(:,7);x4
data8=data11(:,3);y4
;ceres  djf
data1_1=data22(:,2);x11
data2_2=data22(:,0);y11
;ceres jja
data3_3=data22(:,3);x22
data4_4=data22(:,1);y22


wks  = gsn_open_wks("eps","scatter")             ; send graphics to PNG file


plot=new((/24/),"graphic")

 
res                     = True                   ; plot mods desired
res@gsnFrame             = False
res@gsnDraw             =False
res@xyMarkLineModes     = (/"Markers"/)  ; choose which have markers
res@xyMarkers           = 16                     ; choose type of marker 
res@xyMarkerColor       = "black"                  ; Marker color
res@xyMarkerSizeF       = 0.005                  ; Marker size (default 0.01)
;res@xyDashPatterns      = 1                      ; solid line 
res@trYMinF                 =-1
res@trYMaxF                 =8
res@tmYLMode                ="Manual"
res@tmYLTickSpacingF        =1
res@tmYLMinorPerMajor       =4
res@trXMaxF                 =10
res@trXMinF                 =-80
res@tmXBMode                ="Manual"
res@tmXBTickSpacingF        =20
res@tmXBMinorPerMajor       =4
res@xyLineThicknesses   = (/2/)                ; set second line to 2
res@tmXBLabelFontHeightF=0.065
res@tmYLLabelFontHeightF=0.065
res@tiXAxisFontHeightF=0.065
res@tiYAxisFontHeightF=0.065
res@tiMainFontHeightF=0.065
res@tmYLMode                ="Explicit"
res@tmYLValues=ispan(-1, 8, 1)
res@tmYLLabels=(/"-1","","1","","3","","5","","7",""/)


res1=True
res1@gsLineColor      = "black"
res1@gsLineThicknessF =1


res@tiXAxisString           =""
res@tiYAxisString           ="N"
res@tiMainString        = "(a) TWO_L~B~cf~N~=2km_DJF"  ; title
plot(0)  = gsn_csm_xy (wks,data1,data2,res)        ; create plot
xx = (/-80,10/)
yy = (/1,1/)
xx1 = (/0,0/)
yy1 = (/-1,8/)
dum1 = gsn_add_polyline(wks,plot(0),xx,yy,res1)              ; add polyline
dum2 = gsn_add_polyline(wks,plot(0),xx1,yy1,res1)              ; add polyline

res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(b) TWO_L~B~cf~N~*_DJF"  ; title
plot(1)  = gsn_csm_xy (wks,data3,data4,res)        ; create plot
dum3 = gsn_add_polyline(wks,plot(1),xx,yy,res1)              ; add polyline
dum4 = gsn_add_polyline(wks,plot(1),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(c) CERES_DJF"  ; title
plot(2)  = gsn_csm_xy (wks,data1_1,data2_2,res)        ; create plot
dum5 = gsn_add_polyline(wks,plot(2),xx,yy,res1)              ; add polyline
dum6 = gsn_add_polyline(wks,plot(2),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(d) TWO_L~B~cf~N~=2km_JJA"  ; title
plot(3)  = gsn_csm_xy (wks,data5,data6,res)        ; create plot
dum7 = gsn_add_polyline(wks,plot(3),xx,yy,res1)              ; add polyline
dum8 = gsn_add_polyline(wks,plot(3),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(e) TWO_L~B~cf~N~*_JJA"  ; title
plot(4)  = gsn_csm_xy (wks,data7,data8,res)        ; create plot
dum9 = gsn_add_polyline(wks,plot(4),xx,yy,res1)              ; add polyline
dum10 = gsn_add_polyline(wks,plot(4),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(f) CERES_JJA"  ; title
plot(5)  = gsn_csm_xy (wks,data3_3,data4_4,res)        ; create plot
dum11 = gsn_add_polyline(wks,plot(5),xx,yy,res1)              ; add polyline
dum12 = gsn_add_polyline(wks,plot(5),xx1,yy1,res1)              ; add polyline

delete([/fname1,fname2,data11,data22/])
delete([/data1,data2,data3,data4,data5,data6,data7,data8/])
delete([/data1_1,data2_2,data3_3,data4_4/])

fname1  ="/mnt/h/Twoparameter/N_NET_"+quyu(1)+".txt"
fname2  ="/mnt/h/Twoparameter/N_NET_CERES_"+quyu(1)+".txt"
data11   = asciiread(fname1,(/hangshu(1),8/),"float") 
data22   = asciiread(fname2,(/hangshu(1),4/),"float") 
;model djf
data1=data11(:,4);x1
data2=data11(:,0);y1
data3=data11(:,5);x2
data4=data11(:,1);y2
;model jja
data5=data11(:,6);x3
data6=data11(:,2);y3
data7=data11(:,7);x4
data8=data11(:,3);y4
;ceres  djf
data1_1=data22(:,2);x11
data2_2=data22(:,0);y11
;ceres jja
data3_3=data22(:,3);x22
data4_4=data22(:,1);y22

res@tiXAxisString           =""
res@tiYAxisString           ="N"
res@tiMainString        = "(a) TWO_L~B~cf~N~=2km_DJF"  ; title
plot(6)  = gsn_csm_xy (wks,data1,data2,res)        ; create plot
xx = (/-80,10/)
yy = (/1,1/)
xx1 = (/0,0/)
yy1 = (/-1,8/)
dum13 = gsn_add_polyline(wks,plot(6),xx,yy,res1)              ; add polyline
dum14 = gsn_add_polyline(wks,plot(6),xx1,yy1,res1)              ; add polyline

res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(b) TWO_L~B~cf~N~*_DJF"  ; title
plot(7)  = gsn_csm_xy (wks,data3,data4,res)        ; create plot
dum15 = gsn_add_polyline(wks,plot(7),xx,yy,res1)              ; add polyline
dum16 = gsn_add_polyline(wks,plot(7),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(c) CERES_DJF"  ; title
plot(8)  = gsn_csm_xy (wks,data1_1,data2_2,res)        ; create plot
dum17 = gsn_add_polyline(wks,plot(8),xx,yy,res1)              ; add polyline
dum18 = gsn_add_polyline(wks,plot(8),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(d) TWO_L~B~cf~N~=2km_JJA"  ; title
plot(9)  = gsn_csm_xy (wks,data5,data6,res)        ; create plot
dum19 = gsn_add_polyline(wks,plot(9),xx,yy,res1)              ; add polyline
dum20 = gsn_add_polyline(wks,plot(9),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(e) TWO_L~B~cf~N~*_JJA"  ; title
plot(10)  = gsn_csm_xy (wks,data7,data8,res)        ; create plot
dum21 = gsn_add_polyline(wks,plot(10),xx,yy,res1)              ; add polyline
dum22 = gsn_add_polyline(wks,plot(10),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(f) CERES_JJA"  ; title
plot(11)  = gsn_csm_xy (wks,data3_3,data4_4,res)        ; create plot
dum23 = gsn_add_polyline(wks,plot(11),xx,yy,res1)              ; add polyline
dum24 = gsn_add_polyline(wks,plot(11),xx1,yy1,res1)              ; add polyline

delete([/fname1,fname2,data11,data22/])
delete([/data1,data2,data3,data4,data5,data6,data7,data8/])
delete([/data1_1,data2_2,data3_3,data4_4/])

fname1  ="/mnt/h/Twoparameter/N_NET_"+quyu(2)+".txt"
fname2  ="/mnt/h/Twoparameter/N_NET_CERES_"+quyu(2)+".txt"
data11   = asciiread(fname1,(/hangshu(2),8/),"float") 
data22   = asciiread(fname2,(/hangshu(2),4/),"float") 
;model djf
data1=data11(:,4);x1
data2=data11(:,0);y1
data3=data11(:,5);x2
data4=data11(:,1);y2
;model jja
data5=data11(:,6);x3
data6=data11(:,2);y3
data7=data11(:,7);x4
data8=data11(:,3);y4
;ceres  djf
data1_1=data22(:,2);x11
data2_2=data22(:,0);y11
;ceres jja
data3_3=data22(:,3);x22
data4_4=data22(:,1);y22

res@tiXAxisString           =""
res@tiYAxisString           ="N"
res@tiMainString        = "(a) TWO_L~B~cf~N~=2km_DJF"  ; title
plot(12)  = gsn_csm_xy (wks,data1,data2,res)        ; create plot
xx = (/-80,10/)
yy = (/1,1/)
xx1 = (/0,0/)
yy1 = (/-1,8/)
dum25 = gsn_add_polyline(wks,plot(12),xx,yy,res1)              ; add polyline
dum26 = gsn_add_polyline(wks,plot(12),xx1,yy1,res1)              ; add polyline

res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(b) TWO_L~B~cf~N~*_DJF"  ; title
plot(13)  = gsn_csm_xy (wks,data3,data4,res)        ; create plot
dum27 = gsn_add_polyline(wks,plot(13),xx,yy,res1)              ; add polyline
dum28 = gsn_add_polyline(wks,plot(13),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(c) CERES_DJF"  ; title
plot(14)  = gsn_csm_xy (wks,data1_1,data2_2,res)        ; create plot
dum29 = gsn_add_polyline(wks,plot(14),xx,yy,res1)              ; add polyline
dum30 = gsn_add_polyline(wks,plot(14),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(d) TWO_L~B~cf~N~=2km_JJA"  ; title
plot(15)  = gsn_csm_xy (wks,data5,data6,res)        ; create plot
dum31 = gsn_add_polyline(wks,plot(15),xx,yy,res1)              ; add polyline
dum32 = gsn_add_polyline(wks,plot(15),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(e) TWO_L~B~cf~N~*_JJA"  ; title
plot(16)  = gsn_csm_xy (wks,data7,data8,res)        ; create plot
dum33 = gsn_add_polyline(wks,plot(16),xx,yy,res1)              ; add polyline
dum34 = gsn_add_polyline(wks,plot(16),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           =""
res@tiYAxisString           =""
res@tiMainString        = "(f) CERES_JJA"  ; title
plot(17)  = gsn_csm_xy (wks,data3_3,data4_4,res)        ; create plot
dum35 = gsn_add_polyline(wks,plot(17),xx,yy,res1)              ; add polyline
dum36 = gsn_add_polyline(wks,plot(17),xx1,yy1,res1)              ; add polyline


delete([/fname1,fname2,data11,data22/])
delete([/data1,data2,data3,data4,data5,data6,data7,data8/])
delete([/data1_1,data2_2,data3_3,data4_4/])

fname1  ="/mnt/h/Twoparameter/N_NET_"+quyu(3)+".txt"
fname2  ="/mnt/h/Twoparameter/N_NET_CERES_"+quyu(3)+".txt"
data11   = asciiread(fname1,(/hangshu(3),8/),"float") 
data22   = asciiread(fname2,(/hangshu(3),4/),"float") 
;model djf
data1=data11(:,4);x1
data2=data11(:,0);y1
data3=data11(:,5);x2
data4=data11(:,1);y2
;model jja
data5=data11(:,6);x3
data6=data11(:,2);y3
data7=data11(:,7);x4
data8=data11(:,3);y4
;ceres  djf
data1_1=data22(:,2);x11
data2_2=data22(:,0);y11
;ceres jja
data3_3=data22(:,3);x22
data4_4=data22(:,1);y22

res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           ="N"
res@tiMainString        = "(a) TWO_L~B~cf~N~=2km_DJF"  ; title
plot(18)  = gsn_csm_xy (wks,data1,data2,res)        ; create plot
xx = (/-80,10/)
yy = (/1,1/)
xx1 = (/0,0/)
yy1 = (/-1,8/)
dum37 = gsn_add_polyline(wks,plot(18),xx,yy,res1)              ; add polyline
dum38 = gsn_add_polyline(wks,plot(18),xx1,yy1,res1)              ; add polyline

res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(b) TWO_L~B~cf~N~*_DJF"  ; title
plot(19)  = gsn_csm_xy (wks,data3,data4,res)        ; create plot
dum39 = gsn_add_polyline(wks,plot(19),xx,yy,res1)              ; add polyline
dum40 = gsn_add_polyline(wks,plot(19),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(c) CERES_DJF"  ; title
plot(20)  = gsn_csm_xy (wks,data1_1,data2_2,res)        ; create plot
dum41 = gsn_add_polyline(wks,plot(20),xx,yy,res1)              ; add polyline
dum42 = gsn_add_polyline(wks,plot(20),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(d) TWO_L~B~cf~N~=2km_JJA"  ; title
plot(21)  = gsn_csm_xy (wks,data5,data6,res)        ; create plot
dum43 = gsn_add_polyline(wks,plot(21),xx,yy,res1)              ; add polyline
dum44 = gsn_add_polyline(wks,plot(21),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(e) TWO_L~B~cf~N~*_JJA"  ; title
plot(22)  = gsn_csm_xy (wks,data7,data8,res)        ; create plot
dum45 = gsn_add_polyline(wks,plot(22),xx,yy,res1)              ; add polyline
dum46 = gsn_add_polyline(wks,plot(22),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(f) CERES_JJA"  ; title
plot(23)  = gsn_csm_xy (wks,data3_3,data4_4,res)        ; create plot
dum47 = gsn_add_polyline(wks,plot(23),xx,yy,res1)              ; add polyline
dum48 = gsn_add_polyline(wks,plot(23),xx1,yy1,res1)              ; add polyline


resp1=True
resp1@gsnMaximize=True
;resp@gsnPanelMainString    = quyu(0)
resp1@gsnPanelYWhiteSpacePercent=8
resp1@gsnPanelXWhiteSpacePercent=3 

gsn_panel(wks, plot, (/4,6/), resp1)
