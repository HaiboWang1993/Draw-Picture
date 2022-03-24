fil1=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_DJF_climo.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_JJA_climo.nc", "r")

fil11=addfile("/mnt/i/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_DJF_climo.nc","r")
fil22=addfile("/mnt/i/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_DJF_climo.nc", "r")
fil33=addfile("/mnt/i/Twoparameter/CRF_ONE_2/ave_CRF_ONE_2_JJA_climo.nc","r")
fil44=addfile("/mnt/i/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_JJA_climo.nc", "r")

a=addfile("/mnt/i/Twoparameter/CRF_ONE_lcf/ave_CRF_ONE_lcf_JJA_climo.nc", "r")



u1 = fil1->U(0,:,:,:) 
u2 = fil11->U(0,:,:,:)  
u3 = fil2->U(0,:,:,:)  
u4 = fil22->U(0,:,:,:)  
u5 = fil3->U(0,:,:,:)  
u6 = fil33->U(0,:,:,:)  
u7 = fil4->U(0,:,:,:)  
u8 = fil44->U(0,:,:,:)  

v1 = fil1->V(0,:,:,:)  
v2 = fil11->V(0,:,:,:)  
v3 = fil2->V(0,:,:,:)  
v4 = fil22->V(0,:,:,:)  
v5 = fil3->V(0,:,:,:)  
v6 = fil33->V(0,:,:,:)  
v7 = fil4->V(0,:,:,:)  
v8 = fil44->V(0,:,:,:)  

u22=u1-u2 ;djf shuang
u33=u3-u4   ;jja shuang
u55=u5-u6  ;jja dan 
u66=u7-u8  ;jja dan

v22=u2-u1  ;djf shuang
v33=u4-u3   ;jja shuang
v55=u6-u5  ;jja dan 
v66=u8-u7  ;jja dan

copy_VarMeta(u1, u22)
copy_VarMeta(u1, u33)
copy_VarMeta(u1, u55)
copy_VarMeta(u1, u66)

copy_VarMeta(v1, v22)
copy_VarMeta(v1, v33)
copy_VarMeta(v1, v55)
copy_VarMeta(v1, v66)

lat=a->lat
lon=a->lon
dv2=new((/26,64,128/), float)
dv3=new((/26,64,128/), float)
dv5=new((/26,64,128/), float)
dv6=new((/26,64,128/), float)

do i = 0, 25
    dv2(i,:,:)=(uv2dv_cfd(u22(i,:,:),v22(i,:,:),lat,lon,2))*1000000
    dv3(i,:,:)=(uv2dv_cfd(u33(i,:,:),v33(i,:,:),lat,lon,2))*1000000
    dv5(i,:,:)=(uv2dv_cfd(u55(i,:,:),v55(i,:,:),lat,lon,2))*1000000
    dv6(i,:,:)=(uv2dv_cfd(u66(i,:,:),v66(i,:,:),lat,lon,2))*1000000
end do

copy_VarMeta(v1, dv2)
copy_VarMeta(v1, dv3)
copy_VarMeta(v1, dv5)
copy_VarMeta(v1, dv6)


hyam =   a->hyam         
hybm =   a->hybm
P0mb =   a->P0*0.01
ps   =   a->PS           
; lat  =   a->lat                              
lev_p           = (/200,400,600,800,1000/)
lev_p@units     = "hPa"                        ; required for vinth2p

vp2 = vinth2p (dv2(:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp3 = vinth2p (dv3(:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp5 = vinth2p (dv5(:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )
vp6 = vinth2p (dv6(:,:,:), hyam,hybm, lev_p ,ps(0,:,:), 2, P0mb, 1, False )

psi2=dim_avg_n_Wrap(vp2, 2)
psi3=dim_avg_n_Wrap(vp3, 2)
psi5=dim_avg_n_Wrap(vp5, 2)
psi6=dim_avg_n_Wrap(vp6, 2)



wks = gsn_open_wks("eps","Fig.14")   
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
cnres@cnMinLevelValF=-3
cnres@cnMaxLevelValF=3
cnres@cnLevelSpacingF =0.3


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
cnres@gsnCenterStringFontHeightF=0.04

cnres@gsnLeftString       = "(a) DJF"
cnres@gsnRightString        = "10~S~-6~N~ s~S~-1~N~"
cnres@gsnCenterString          ="L~B~cf~N~=2km"                          
cnres@tiYAxisString           ="Pressure(mb)"
plot(0) =gsn_csm_contour(wks,psi2,cnres) 


cnres@gsnLeftString       = "(b) JJA"
cnres@gsnCenterString        = "L~B~cf~N~=2km"
cnres@gsnRightString        = "10~S~-6~N~ s~S~-1~N~"
cnres@tiYAxisString           =""
plot(1) =gsn_csm_contour(wks,psi5,cnres) 


cnres@gsnLeftString       = "(c) DJF"
cnres@gsnCenterString        = "L~B~cf~N~*"
cnres@gsnRightString        = "10~S~-6~N~ s~S~-1~N~"
cnres@tiYAxisString           ="Pressure(mb)"
plot(2) =gsn_csm_contour(wks,psi3,cnres) 


cnres@gsnLeftString       = "(d) JJA"
cnres@gsnCenterString        = "L~B~cf~N~*"
cnres@gsnRightString        = "10~S~-6~N~ s~S~-1~N~"
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
; resp@lbTitleString   ="10~S~-6~N~ S~S~-1~N~" 
; resp@lbTitlePosition ="Center"
; resp@lbTitleFontHeightF=0.015

gsn_panel(wks,plot,(/2,2/),resp)


 