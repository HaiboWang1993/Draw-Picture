;overlay TS and UV
fil1=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_DJF_climo.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_JJA_climo.nc", "r")

fil11=addfile("/mnt/i/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_DJF_climo.nc","r")
fil22=addfile("/mnt/i/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_DJF_climo.nc", "r")
fil33=addfile("/mnt/i/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_JJA_climo.nc","r")
fil44=addfile("/mnt/i/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_JJA_climo.nc", "r")

vl1=fil1->TS(0,:,:)
vl2=fil11->TS(0,:,:)
vl3=fil2->TS(0,:,:)
vl4=fil22->TS(0,:,:)
vl5=fil3->TS(0,:,:)
vl6=fil33->TS(0,:,:)
vl7=fil4->TS(0,:,:)
vl8=fil44->TS(0,:,:)

u1 = fil1->U(0,25,:,:) 
u2 = fil11->U(0,25,:,:) 
u3 = fil2->U(0,25,:,:) 
u4 = fil22->U(0,25,:,:) 
u5 = fil3->U(0,25,:,:) 
u6 = fil33->U(0,25,:,:) 
u7 = fil4->U(0,25,:,:) 
u8 = fil44->U(0,25,:,:) 

v1 = fil1->V(0,25,:,:) 
v2 = fil11->V(0,25,:,:) 
v3 = fil2->V(0,25,:,:) 
v4 = fil22->V(0,25,:,:) 
v5 = fil3->V(0,25,:,:) 
v6 = fil33->V(0,25,:,:) 
v7 = fil4->V(0,25,:,:) 
v8 = fil44->V(0,25,:,:) 

var2=vl1-vl2  ;djf shuang
var3=vl3-vl4  ;jja shuang
var5=vl5-vl6 ;jja dan 
var6=vl7-vl8 ;jja dan

u22=u1-u2 ;djf shuang
u33=u3-u4   ;jja shuang
u55=u5-u6  ;jja dan 
u66=u7-u8  ;jja dan

v22=u2-u1  ;djf shuang
v33=u4-u3   ;jja shuang
v55=u6-u5  ;jja dan 
v66=u8-u7  ;jja dan

copy_VarMeta(vl1, var2)
copy_VarMeta(vl1, var3)
copy_VarMeta(vl1, var5)
copy_VarMeta(vl1, var6)

copy_VarMeta(u1, u22)
copy_VarMeta(u1, u33)
copy_VarMeta(u1, u55)
copy_VarMeta(u1, u66)

copy_VarMeta(v1, v22)
copy_VarMeta(v1, v33)
copy_VarMeta(v1, v55)
copy_VarMeta(v1, v66)

wks = gsn_open_wks("eps","Fig.11")   
gsn_define_colormap(wks,"MPL_RdBu")    
gsn_reverse_colormap(wks)        
uv_plot=new((/4/),"graphic")
ts_plot=new((/4/),"graphic")

cnres                             = True
cnres@gsnMaximize                 = True
cnres@gsnDraw                     = False
cnres@gsnFrame                    = False
cnres@cnLinesOn                   = False
cnres@cnFillOn                    = True
cnres@mpCenterLonF                =180.
cnres@lbLabelBarOn                = False       
cnres@gsnAddCyclic                = True          
cnres@cnLineLabelsOn              = False

cnres@cnLevelSelectionMode = "ManualLevels"  
cnres@cnMinLevelValF=-5
cnres@cnMaxLevelValF=5
cnres@cnLevelSpacingF =1


cnres@tmXBLabelFontHeightF = 0.04
cnres@tmXBLabelFontThicknessF = 3
; cnres@tmXBMode = 2
cnres@tmXBValues = (/0,30,60,90,120,150,180,210,240,270,300,330,360/)
cnres@tmXBLabels = (/"0~S~o~N","","","90~S~o~N~E","","","180~S~o~N","","","90~S~o~N~W","","","0~S~o~N"/)

cnres@tmYLLabelFontHeightF = 0.04
cnres@tmYLLabelFontThicknessF = 3
; cnres@tmYLMode = 2
cnres@tmYLValues = (/90,45,0,-45,-90/)
cnres@tmYLLabels = (/"90~S~o~N~N","45~S~o~N~N","0~S~o~N","45~S~o~N~S","90~S~o~N~S"/)

vnres                         = True
vnres@gsnDraw                 = False
vnres@gsnFrame                = False
vnres@vcRefAnnoOrthogonalPosF = -1.0             ; move ref vector up
vnres@vcRefMagnitudeF         = 2.0            ; define vector ref mag
vnres@vcRefLengthF            = 0.045            ; define length of vec ref
vnres@vcGlyphStyle            = "CurlyVector"    ;CurlyVector   turn on curly vectors
vnres@vcMinDistanceF          = 0.02
vnres@gsnRightString          = ""
vnres@gsnLeftString           = ""
vnres@gsnCenterString         =""
vnres@vcRefAnnoOn             =True
vnres@vcRefAnnoBackgroundColor="white"
vnres@vcRefAnnoFontHeightF    =0.02
vnres@vcRefAnnoString1On      =False
vnres@vcRefAnnoString2On      =True
vnres@vcRefAnnoString2        ="2 m/s"


cnres@gsnLeftStringFontHeightF=0.04
cnres@gsnRightStringFontHeightF=0.04

cnres@gsnLeftString       = "(a) DJF"
cnres@gsnRightString        = "L~B~cf~N~=2km"
uv_plot(0)  = gsn_csm_vector(wks,u22,v22,vnres)
ts_plot(0) = gsn_csm_contour_map(wks,var2,cnres)
overlay(ts_plot(0),uv_plot(0))

cnres@gsnLeftString       = "(b) JJA"
cnres@gsnRightString        = "L~B~cf~N~=2km"
uv_plot(1)  = gsn_csm_vector(wks,u55,v55,vnres)
ts_plot(1) = gsn_csm_contour_map(wks,var5,cnres)
overlay(ts_plot(1),uv_plot(1))


cnres@gsnLeftString       = "(c) DJF"
cnres@gsnRightString        = "L~B~cf~N~*"
uv_plot(2)  = gsn_csm_vector(wks,u33,v33,vnres)
ts_plot(2) = gsn_csm_contour_map(wks,var3,cnres)
overlay(ts_plot(2),uv_plot(2))


cnres@gsnLeftString       = "(d) JJA"
cnres@gsnRightString        = "L~B~cf~N~*"
uv_plot(3)  = gsn_csm_vector(wks,u66,v66,vnres)
ts_plot(3) = gsn_csm_contour_map(wks,var6,cnres)
overlay(ts_plot(3),uv_plot(3))




resp                          = True
resp@gsnMaximize=True
resp@gsnPanelLabelBar         = True
resp@pmLabelBarWidthF         = 0.8               ; label bar width
resp@pmLabelBarHeightF        = 0.05
resp@pmLabelBarOrthogonalPosF = -0.01          ; move labelbar up a bit
resp@pmLabelBarParallelPosF   = 0.005            ; move labelbar right a bit
resp@gsnPanelBottom           = 0.06
resp@gsnPanelYWhiteSpacePercent=6
resp@gsnPanelXWhiteSpacePercent=5 
; resp@lbBoxLinesOn=False
resp@lbLabelFontHeightF=0.02
; resp@lbLabelFont=25
; resp@lbTitleOn= True
; resp@lbTitleString   ="K" 
; resp@lbTitlePosition ="Center"
; resp@lbTitleFontHeightF=0.015


gsn_panel(wks,ts_plot,(/2,2/),resp)
