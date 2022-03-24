fil1=addfile("/mnt/h/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_DJF_climo.nc","r")
fil2=addfile("/mnt/h/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_DJF_climo.nc", "r")
fil3=addfile("/mnt/h/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_JJA_climo.nc","r")
fil4=addfile("/mnt/h/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_JJA_climo.nc", "r")

fil11=addfile("/mnt/h/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_DJF_climo.nc","r")
fil22=addfile("/mnt/h/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_DJF_climo.nc", "r")
fil33=addfile("/mnt/h/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_JJA_climo.nc","r")
fil44=addfile("/mnt/h/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_JJA_climo.nc", "r")

a=addfile("/mnt/h/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_JJA_climo.nc", "r")


vl1=fil1->RELHUM
vl2=fil11->RELHUM
vl3=fil2->RELHUM
vl4=fil22->RELHUM
vl5=fil3->RELHUM
vl6=fil33->RELHUM
vl7=fil4->RELHUM
vl8=fil44->RELHUM



var2=vl1-vl2  ;djf shuang
var3=vl3-vl4  ;jja shuang
var5=vl5-vl6 ;jja dan 
var6=vl7-vl8 ;jja dan



copy_VarMeta(vl1, var2)
copy_VarMeta(vl1, var3)
copy_VarMeta(vl1, var5)
copy_VarMeta(vl1, var6)


hyam =   a->hyam         
hybm =   a->hybm
P0mb =   a->P0*0.01
ps   =   a->PS           
lat  =   a->lat                              
lev_p           = (/200,400,600,800,1000/)
lev_p@units     = "hPa"                        ; required for vinth2p

vp2 = vinth2p (var2(0,:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp3 = vinth2p (var3(0,:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp5 = vinth2p (var5(0,:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp6 = vinth2p (var6(0,:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )

psi2=dim_avg_n_Wrap(vp2, 2)
psi3=dim_avg_n_Wrap(vp3, 2)
psi5=dim_avg_n_Wrap(vp5, 2)
psi6=dim_avg_n_Wrap(vp6, 2)


wks = gsn_open_wks("pdf","Fig.13")   
gsn_define_colormap(wks,"MPL_RdBu")    
gsn_reverse_colormap(wks)        
plot=new((/4/),"graphic")

cnres                             = True
cnres@gsnDraw                     = False
cnres@gsnFrame                    = False
cnres@cnLinesOn                   = True
cnres@cnFillOn                    = True
cnres@lbLabelBarOn                = False       
cnres@cnLineLabelsOn              = False
cnres@gsnContourNegLineDashPattern = 1 

cnres@cnLevelSelectionMode = "ManualLevels"  
cnres@cnMinLevelValF=-5
cnres@cnMaxLevelValF=5
cnres@cnLevelSpacingF =1

cnres@tiXAxisFontHeightF      =0.04
cnres@tiYAxisFontHeightF      =0.04


cnres@tmXBLabelFontHeightF = 0.04
cnres@tmXBLabelFontThicknessF = 3
cnres@tmXBMode                ="Explicit"
cnres@tmXBValues = (/90,45,0,-45,-90/)
cnres@tmXBLabels = (/"90~S~o~N~N","45~S~o~N~N","0","45~S~o~N~S","90~S~o~N~S"/)

cnres@tmYLLabelFontHeightF = 0.04
cnres@tmYLLabelFontThicknessF = 3
; cnres@tmYLMode = 2
; cnres@tmYLValues = (/1000,800,600,400,200/)
; cnres@tmYLLabels = (/"1000","800","600","400","200"/)
cnres@trYReverse        = True 
;cnres@tiYAxisString           ="Pressure(mb)"
cnres@cnInfoLabelOn=False
; cnres@gsnPresHgtHeightLabelOn=False
; cnres@tmYROn   =False
;gsn_csm_pres_hgt(wks, data, res)

cnres@gsnLeftStringFontHeightF=0.04
cnres@gsnRightStringFontHeightF=0.04

cnres@gsnLeftString       = "(a) DJF"
cnres@gsnRightString        = "L~B~cf~N~=2km"
cnres@tiYAxisString           ="Pressure(hpa)"
plot(0) =gsn_csm_contour(wks,psi2,cnres) 


cnres@gsnLeftString       = "(b) JJA"
cnres@gsnRightString        = "L~B~cf~N~=2km"
cnres@tiYAxisString           =""
plot(1) =gsn_csm_contour(wks,psi5,cnres) 


cnres@gsnLeftString       = "(c) DJF"
cnres@gsnRightString        = "L~B~cf~N~*"
cnres@tiYAxisString           ="Pressure(hpa)"
plot(2) =gsn_csm_contour(wks,psi3,cnres) 


cnres@gsnLeftString       = "(d) JJA"
cnres@gsnRightString        = "L~B~cf~N~*"
cnres@tiYAxisString           =""
plot(3) =gsn_csm_contour(wks,psi6,cnres) 



resp                          = True
resp@gsnMaximize              =True
resp@gsnPanelLabelBar         = True
resp@pmLabelBarWidthF         = 0.8               ; label bar width
resp@pmLabelBarHeightF        = 0.05
resp@pmLabelBarOrthogonalPosF = -0.01          ; move labelbar up a bit
resp@pmLabelBarParallelPosF   = 0.005            ; move labelbar right a bit
resp@gsnPanelBottom           = 0.06
resp@gsnPanelYWhiteSpacePercent=6
resp@gsnPanelXWhiteSpacePercent=5 
;resp@lbBoxLinesOn=False
resp@lbLabelFontHeightF=0.02
; resp@lbLabelFont=25
; resp@lbTitleOn= True
; resp@lbTitleString   ="K" 
; resp@lbTitlePosition ="Center"
; resp@lbTitleFontHeightF=0.015

gsn_panel(wks,plot,(/2,2/),resp)
