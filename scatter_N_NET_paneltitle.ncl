quyu=(/"A","B","C","D"/)
;hangshu=(/"540","390","750","176"/)
hangshu=(/504,390,750,176/)

fname1  ="/mnt/i/Twoparameter/N_NET_"+quyu(3)+".txt"
fname2  ="/mnt/i/Twoparameter/N_NET_CERES_"+quyu(3)+".txt"
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


wks  = gsn_open_wks("eps","scatter_"+quyu(3))             ; send graphics to PNG file


plot=new((/6/),"graphic")
 
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
res@tmXBLabelFontHeightF=0.04
res@tmYLLabelFontHeightF=0.04
res@tiXAxisFontHeightF=0.04
res@tiYAxisFontHeightF=0.04
res@tiMainFontHeightF=0.04
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


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           ="N"
res@tiMainString        = "(d) TWO_L~B~cf~N~=2km_JJA"  ; title
plot(3)  = gsn_csm_xy (wks,data5,data6,res)        ; create plot
dum7 = gsn_add_polyline(wks,plot(3),xx,yy,res1)              ; add polyline
dum8 = gsn_add_polyline(wks,plot(3),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(e) TWO_L~B~cf~N~*_JJA"  ; title
plot(4)  = gsn_csm_xy (wks,data7,data8,res)        ; create plot
dum9 = gsn_add_polyline(wks,plot(4),xx,yy,res1)              ; add polyline
dum10 = gsn_add_polyline(wks,plot(4),xx1,yy1,res1)              ; add polyline


res@tiXAxisString           ="NETCRF(W m~S~-2~N~)"
res@tiYAxisString           =""
res@tiMainString        = "(f) CERES_JJA"  ; title
plot(5)  = gsn_csm_xy (wks,data3_3,data4_4,res)        ; create plot
dum11 = gsn_add_polyline(wks,plot(5),xx,yy,res1)              ; add polyline
dum12 = gsn_add_polyline(wks,plot(5),xx1,yy1,res1)              ; add polyline


resp=True
resp@gsnMaximize=True
resp@gsnPanelMainString    = quyu(3)
resp@gsnPanelMainFontHeightF=0.02
resp@gsnPanelYWhiteSpacePercent=8
resp@gsnPanelXWhiteSpacePercent=3 

gsn_panel(wks, plot, (/2,3/), resp)
