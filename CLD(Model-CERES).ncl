
fil1=addfile("/mnt/i/Twoparameter/model_data_single/ave_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/ceres_data/ceres06-15_cld_DJF.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/model_data_single/ave_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/ceres_data/ceres06-15_cld_JJA.nc", "r")


; vl1=dim_avg_n_Wrap(fil1->GCLDTOT, 0)
; vl2=dim_avg_n_Wrap(fil1->CLDTOT, 0)
vl1=fil1->GCLDTOT
vl2=fil1->CLDTOT
vl3=fil2->CLDTOT

; vl4=dim_avg_n_Wrap(fil3->GCLDTOT, 0)
; vl5=dim_avg_n_Wrap(fil3->CLDTOT, 0)
vl4=fil3->GCLDTOT
vl5=fil3->CLDTOT
vl6=fil4->CLDTOT

lat=fspan(-87.86379883923262,87.86379883923262,64)
lon=fspan(0,357.1875,128)

var1=new((/64,128/),float)
var2=new((/64,128/),float)
var3=new((/64,128/),float)
var4=new((/64,128/),float)
var5=new((/64,128/),float)
var6=new((/64,128/),float)


;-------------DJF--------------
var1=vl3/100          ;ceres
var2=vl1-var1         ;2-ceres
var3=vl2-var1         ;lcf-ceres
;------------JJA---------------
var4=vl6/100         ;ceres
var5=vl4-var4         ;2-ceres
var6=vl5-var4         ;lcf-ceres


copy_VarMeta(vl1,var1)
copy_VarMeta(vl1,var2)
copy_VarMeta(vl1,var3)
copy_VarMeta(vl1,var4)
copy_VarMeta(vl1,var5)
copy_VarMeta(vl1,var6)

re   = 6.37122e06
rad  = 4.0 * atan(1.0) / 180.0
con  = re * rad
clat = cos(lat * rad)           

dlon = (lon(2) - lon(1))        
dlat = (lat(2) - lat(1))        

dx   = con * dlon * clat        
dy   = con * dlat               
dxdy = dy * dx                  

wgt1  = new((/64, 128/), float)
wgt1  = conform (wgt1, dxdy, 0)
qSum1 = wgt_areaave2(var1, wgt1, 0) 

wgt2  = new((/64, 128/), float)
wgt2  = conform (wgt2, dxdy, 0)
qSum2 = wgt_areaave2(var2, wgt2, 0)  

wgt3  = new((/64, 128/), float)
wgt3  = conform (wgt3, dxdy, 0)
qSum3 = wgt_areaave2(var3, wgt3, 0) 

wgt4  = new((/64, 128/), float)
wgt4  = conform (wgt4, dxdy, 0)
qSum4 = wgt_areaave2(var4, wgt4, 0)  

wgt5  = new((/64, 128/), float)
wgt5  = conform (wgt5, dxdy, 0)
qSum5 = wgt_areaave2(var5, wgt5, 0) 

wgt6  = new((/64, 128/), float)
wgt6  = conform (wgt6, dxdy, 0)
qSum6 = wgt_areaave2(var6, wgt6, 0) 

; print(qSum6)
; printVarSummary(var6)
; aaa=dim_avg_n(dim_avg_n(var6, 0), 0)
; print(aaa)

wks=gsn_open_wks("eps","Fig.A1")
gsn_define_colormap(wks,"MPL_RdBu")
gsn_reverse_colormap(wks)    

res                 = True 
res@gsnDraw         = False                   
res@gsnFrame        = False    

res@cnLinesOn       =False
res@cnFillOn        =True
res@mpCenterLonF    =180.
res@lbLabelBarOn                = False       
res@gsnAddCyclic                = True          
res@cnLineLabelsOn              = False
res@tmXBLabelFontHeightF=0.04
res@tmXBValues = (/0,30,60,90,120,150,180,210,240,270,300,330,360/)
res@tmXBLabels = (/"0~S~o~N","","","90~S~o~N~E","","","180~S~o~N","","","90~S~o~N~W","","","0~S~o~N"/)
res@tmYLLabelFontHeightF=0.04
res@tmYLValues = (/90,45,0,-45,-90/)
res@tmYLLabels = (/"90~S~o~N~N","45~S~o~N~N","0~S~o~N","45~S~o~N~S","90~S~o~N~S"/)

plot=new((/4/),"graphic")

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~=2km"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(a) DJF"
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
;res@cnLevelSelectionMode = "ManualLevels"  
;res@cnMinLevelValF=-0.5
;res@cnMaxLevelValF=0.5
;res@cnLevelSpacingF = 0.1
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels =  (/-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5/)
plot(0)=gsn_csm_contour_map(wks,var2,res)


res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~=2km"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(b) JJA" 
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
;res@cnLevelSelectionMode = "ManualLevels"  
;res@cnMinLevelValF=-0.5
;res@cnMaxLevelValF=0.5
;res@cnLevelSpacingF = 0.1
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels =  (/-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5/)
plot(1)=gsn_csm_contour_map(wks,var5,res)

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~*"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(c) DJF" 
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
;res@cnLevelSelectionMode = "ManualLevels"  
;res@cnMinLevelValF=-0.5
;res@cnMaxLevelValF=0.5
;res@cnLevelSpacingF = 0.1

res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels =  (/-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5/)
plot(2)=gsn_csm_contour_map(wks,var3,res)

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~*"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(d) JJA" 
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
;res@cnLevelSelectionMode = "ManualLevels"  
;res@cnMinLevelValF=-0.5
;res@cnMaxLevelValF=0.5
;res@cnLevelSpacingF = 0.1
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels =  (/-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5/)
plot(3)=gsn_csm_contour_map(wks,var6,res)


resp                          = True
resp@gsnPanelLabelBar         = True
resp@pmLabelBarWidthF         = 0.8               ; label bar width
resp@pmLabelBarHeightF        = 0.05
resp@pmLabelBarOrthogonalPosF = -0.01          ; move labelbar up a bit
resp@pmLabelBarParallelPosF   = 0.005            ; move labelbar right a bit
resp@gsnPanelBottom           = 0.06
resp@gsnPanelYWhiteSpacePercent=4
resp@gsnPanelXWhiteSpacePercent=3 
resp@lbLabelFontHeightF=0.02
;resp@lbBoxEndCapStyle="TriangleBothEnds" 


gsn_panel(wks,plot,(/2,2/),resp)
