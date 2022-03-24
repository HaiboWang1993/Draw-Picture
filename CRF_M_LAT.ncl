fil1=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_DJF_climo.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_JJA_climo.nc", "r")

varname1=(/"FSNT","FSNTC"/)
varname2=(/"FLNT","FLNTC"/)
;djf
vl1=dim_avg_n_Wrap(dim_avg_n_Wrap(fil1->$varname1(0)$, 0),1) ;2 all sw
vl2=dim_avg_n_Wrap(dim_avg_n_Wrap(fil1->$varname1(1)$, 0),1) ;2 clr sw
vl3=dim_avg_n_Wrap(dim_avg_n_Wrap(fil2->$varname1(0)$, 0),1) ;lcf all sw
vl4=dim_avg_n_Wrap(dim_avg_n_Wrap(fil2->$varname1(1)$, 0),1) ;lcf clr sw

vl5=-dim_avg_n_Wrap(dim_avg_n_Wrap(fil1->$varname2(0)$, 0),1) ;2 all lw
vl6=dim_avg_n_Wrap(dim_avg_n_Wrap(fil1->$varname2(1)$, 0),1) ;2 clr lw
vl7=-dim_avg_n_Wrap(dim_avg_n_Wrap(fil2->$varname2(0)$, 0),1) ;lcf all lw
vl8=dim_avg_n_Wrap(dim_avg_n_Wrap(fil2->$varname2(1)$, 0),1) ;lcf clr lw

copy_VarMeta(vl1,vl5)
copy_VarMeta(vl1,vl7)
;jja
vl11=dim_avg_n_Wrap(dim_avg_n_Wrap(fil3->$varname1(0)$, 0),1) ;2 all sw
vl22=dim_avg_n_Wrap(dim_avg_n_Wrap(fil3->$varname1(1)$, 0),1) ;2 clr sw
vl33=dim_avg_n_Wrap(dim_avg_n_Wrap(fil4->$varname1(0)$, 0),1) ;lcf all sw
vl44=dim_avg_n_Wrap(dim_avg_n_Wrap(fil4->$varname1(1)$, 0),1) ;lcf clr sw

vl55=-dim_avg_n_Wrap(dim_avg_n_Wrap(fil3->$varname2(0)$, 0),1) ;2 all lw
vl66=dim_avg_n_Wrap(dim_avg_n_Wrap(fil3->$varname2(1)$, 0),1) ;2 clr lw
vl77=-dim_avg_n_Wrap(dim_avg_n_Wrap(fil4->$varname2(0)$, 0),1) ;lcf all lw
vl88=dim_avg_n_Wrap(dim_avg_n_Wrap(fil4->$varname2(1)$, 0),1) ;lcf clr lw

copy_VarMeta(vl1,vl55)
copy_VarMeta(vl1,vl77)

var_all_diff=new((/4,64/),float)
var_clr_diff=new((/4,64/),float)

var_all_diff(0,:)=vl3-vl1 ;djf sw
var_all_diff(1,:)=vl7-vl5;djf lw
var_all_diff(2,:)=vl33-vl11;jja sw
var_all_diff(3,:)=vl77-vl55;jja lw

copy_VarMeta(vl1,var_all_diff(0,:))
copy_VarMeta(vl1,var_all_diff(1,:))
copy_VarMeta(vl1,var_all_diff(2,:))
copy_VarMeta(vl1,var_all_diff(3,:))


var_clr_diff(0,:)=vl4-vl2 ;djf sw
var_clr_diff(1,:)=vl8-vl6;djf lw
var_clr_diff(2,:)=vl44-vl22;jja sw
var_clr_diff(3,:)=vl88-vl66;jja lw

copy_VarMeta(vl1,var_clr_diff(0,:))
copy_VarMeta(vl1,var_clr_diff(1,:))
copy_VarMeta(vl1,var_clr_diff(2,:))
copy_VarMeta(vl1,var_clr_diff(3,:))

;因为四条线挤在一张图上，想将其俩俩分开

alllw=new((/2,64/),float)
allsw=new((/2,64/),float)
clrlw=new((/2,64/),float)
clrsw=new((/2,64/),float)

alllw(0,:)=var_all_diff(1,:) ;DJF_LW
alllw(1,:)=var_all_diff(3,:) ;JJA_LW

allsw(0,:)=var_all_diff(0,:) ;DJF_SW
allsw(1,:)=var_all_diff(2,:) ;JJA_SW

clrlw(0,:)=var_clr_diff(1,:) ;DJF_LW
clrlw(1,:)=var_clr_diff(3,:) ;JJA_LW

clrsw(0,:)=var_clr_diff(0,:) ;DJF_SW
clrsw(1,:)=var_clr_diff(2,:) ;JJA_SW


wks=gsn_open_wks("eps", "Fig.10")

plot=new((/4/),"graphic")


res                         =True
res@gsnFrame                = False
res@gsnDraw                 =False
; res@tiMainString            = "Flux Difference (W/m~S~2~N~) "
; ;res@tiMainOffsetYF          =0.03
; res@tiMainFontHeightF       =0.02
res@tiXAxisString           =""
res@tiYAxisString           ="(L~B~cf~N~*-L~B~cf~N~=2km) All sky"
res@tiXAxisSide             ="Bottom"
res@tiXAxisFontHeightF      =0.03
res@tiYAxisFontHeightF      =0.03
res@gsnRightString= ""
res@gsnRightStringFontHeightF  = 0.03
res@gsnLeftString = "(a) LW" 
res@gsnLeftStringFontHeightF  = 0.03
res@tmXBLabelFontHeightF=0.03
res@tmYLLabelFontHeightF=0.03
; res@tmYLMode                ="Explicit"
; res@tmYLValues=(/-0.2,-0.1,0,0.1,0.2,0.3/)
; res@tmYLLabels=(/"-0.2","-0.1","0","0.1","0.2","0.3"/)
res@tmXBMode                ="Explicit"
res@tmXBValues = (/90,45,0,-45,-90/)
res@tmXBLabels = (/"90~S~o~N~N","45~S~o~N~N","0","45~S~o~N~S","90~S~o~N~S"/)
res@tmXBLabelsOn=False
res@xyExplicitLegendLabels  =(/"DJF_LW","JJA_LW"/)
res@xyLineColors            =(/"blue","red"/)
res@xyDashPatterns          =(/2,3/)
res@xyLineThicknessF        =2
res@vpHeightF=0.4
res@vpWidthF=0.5

plot(0)=gsn_csm_xy(wks, vl1&lat, alllw, res)

ypts = (/ 0, 0/)
xpts = (/-90, 90/)

resp                  = True                      
resp@gsLineColor      = "black"                    
resp@gsLineThicknessF = 2.0    

dum1=gsn_add_polyline(wks,plot(0),xpts(0:1),ypts(0:1),resp)


res1                         =True
res1@gsnFrame                = False
res1@gsnDraw                 =False
; res@tiMainString            = "Total Cloud Fraction Difference "
; res@tiMainOffsetYF          =0.03
; res@tiMainFontHeightF       =0.02
res1@tiXAxisString           =""
res1@tiYAxisString           =""
res1@tiXAxisSide             ="Bottom"
res1@tiXAxisFontHeightF      =0.03
res1@tiYAxisFontHeightF      =0.03
res1@gsnRightString= ""
res1@gsnRightStringFontHeightF  = 0.03
res1@gsnLeftString = "(b) SW" 
res1@gsnLeftStringFontHeightF  = 0.03
res1@tmXBLabelFontHeightF=0.03
res1@tmYLLabelFontHeightF=0.03
; res1@tmYLMode                ="Explicit"
; res1@tmYLValues=(/-0.2,-0.1,0,0.1,0.2,0.3/)
; res1@tmYLLabels=(/"-0.2","-0.1","0","0.1","0.2","0.3"/)
res1@tmXBMode                ="Explicit"
res1@tmXBValues = (/90,45,0,-45,-90/)
res1@tmXBLabels = (/"90~S~o~N~N","45~S~o~N~N","0","45~S~o~N~S","90~S~o~N~S"/)
res1@tmXBLabelsOn=False
res1@xyExplicitLegendLabels  =(/"DJF_SW","JJA_SW"/)
res1@xyLineColors            =(/"green","purple"/)
res1@xyDashPatterns          =(/4,5/)
res1@xyLineThicknessF        =2
res1@vpHeightF=0.4
res1@vpWidthF=0.5

plot(1)=gsn_csm_xy(wks, vl1&lat, allsw, res1)  

dum2=gsn_add_polyline(wks,plot(1),xpts(0:1),ypts(0:1),resp)

res2                         =True
res2@gsnFrame                = False
res2@gsnDraw                 =False
; res@tiMainString            = "Total Cloud Fraction Difference "
; res@tiMainOffsetYF          =0.03
; res@tiMainFontHeightF       =0.02
res2@tiXAxisString           ="Latitude"
res2@tiYAxisString           ="(L~B~cf~N~*-L~B~cf~N~=2km) Clear sky"
res2@tiXAxisSide             ="Bottom"
res2@tiXAxisFontHeightF      =0.03
res2@tiYAxisFontHeightF      =0.03
res2@gsnRightString= ""
res2@gsnRightStringFontHeightF  = 0.03
res2@gsnLeftString = "(c) LW" 
res2@gsnLeftStringFontHeightF  = 0.03
res2@tmXBLabelFontHeightF=0.03
res2@tmYLLabelFontHeightF=0.03
; res2@tmYLMode                ="Explicit"
; res2@tmYLValues=(/-0.2,-0.1,0,0.1,0.2,0.3/)
; res2@tmYLLabels=(/"-0.2","-0.1","0","0.1","0.2","0.3"/)
res2@tmXBMode                ="Explicit"
res2@tmXBValues = (/90,45,0,-45,-90/)
res2@tmXBLabels = (/"90~S~o~N~N","45~S~o~N~N","0","45~S~o~N~S","90~S~o~N~S"/)
;res2@tmYLLabelsOn=False
res2@xyExplicitLegendLabels  =(/"DJF_LW","JJA_LW"/)
res2@xyLineColors            =(/"blue","red"/)
res2@xyDashPatterns          =(/2,3/)
res2@xyLineThicknessF        =2
res2@vpHeightF=0.4
res2@vpWidthF=0.5
plot(2)=gsn_csm_xy(wks, vl1&lat, clrlw, res2)  
dum3=gsn_add_polyline(wks,plot(2),xpts(0:1),ypts(0:1),resp)


res3                         =True
res3@gsnFrame                = False
res3@gsnDraw                 =False
res3@tiXAxisString           ="Latitude"
res3@tiYAxisString           =""
res3@tiXAxisSide             ="Bottom"
res3@tiXAxisFontHeightF      =0.03
res3@tiYAxisFontHeightF      =0.03
res3@gsnRightString= ""
res3@gsnRightStringFontHeightF  = 0.03
res3@gsnLeftString = "(d) SW" 
res3@gsnLeftStringFontHeightF  = 0.03
res3@tmXBLabelFontHeightF=0.03
res3@tmYLLabelFontHeightF=0.03
; res3@tmYLMode                ="Explicit"
; res3@tmYLValues=(/-0.2,-0.1,0,0.1,0.2,0.3/)
; res3@tmYLLabels=(/"-0.2","-0.1","0","0.1","0.2","0.3"/)
res3@tmXBMode                ="Explicit"
res3@tmXBValues = (/90,45,0,-45,-90/)
res3@tmXBLabels = (/"90~S~o~N~N","45~S~o~N~N","0","45~S~o~N~S","90~S~o~N~S"/)
;res3@tmYLLabelsOn=False
res3@xyExplicitLegendLabels  =(/"DJF_SW","JJA_SW"/)
res3@xyLineColors            =(/"green","purple"/)
res3@xyDashPatterns          =(/4,5/)
res3@xyLineThicknessF        =2
res3@vpHeightF=0.4
res3@vpWidthF=0.5
plot(3)=gsn_csm_xy(wks, vl1&lat, clrsw, res3)  
dum4=gsn_add_polyline(wks,plot(3),xpts(0:1),ypts(0:1),resp)


respp=True
respp@gsnMaximize=True
respp@gsnFrame           = False
gsn_panel(wks, plot, (/2,2/), respp)

genres                           = True
genres@XPosPercent               = 70                    ; orientation on page
genres@YPosPercent               = 30
genres@ItemSpacePercent          = 3
textres                          = True
textres@lgLabels                 = (/"DJF_LW","JJA_LW","DJF_SW","JJA_SW"/)
textres@lgPerimOn                = False                   ; no perimeter
textres@lgItemCount              = 2                      ; how many
lineres                          = True
lineres@lgLineLabelFontHeightF   = 0.015                   ; font height
lineres@lgDashIndexes            = (/2,3,4,5/)             ; line patterns
lineres@lgLineColors             = (/"blue","red","green","purple"/)
lineres@lgLineThicknesses        = 2.5                     ; line thicknesses

simple_legend_ndc(wks, genres, lineres, textres)
;drawNDCGrid(wks)
frame(wks)