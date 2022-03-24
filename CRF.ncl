load "./panel_two_sets.ncl" 

name=(/"CRF_TWO_2","CRF_TWO_lcf"/)

fil1=addfile("/mnt/i/Twoparameter/"+name(0)+"/ave_"+name(0)+"_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/"+name(0)+"/ave_"+name(0)+"_JJA_climo.nc","r")
fil3=addfile("/mnt/i/Twoparameter/"+name(1)+"/ave_"+name(1)+"_DJF_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/"+name(1)+"/ave_"+name(1)+"_JJA_climo.nc","r")
fil5=addfile("/mnt/i/Twoparameter/ceres_data/CERES_CRF.nc","r")

swcf_djf1=(fil1->FSNT(0,:,:))-(fil1->FSNTC(0,:,:))-fil5->SWCF_DJF ;2 djf  sw
lwcf_djf1=-(fil1->FLNT(0,:,:))+(fil1->FLNTC(0,:,:))-fil5->LWCF_DJF;2 djf  lw
swcf_jja1=(fil2->FSNT(0,:,:))-(fil2->FSNTC(0,:,:))-fil5->SWCF_JJA;2 jja  sw
lwcf_jja1=-(fil2->FLNT(0,:,:))+(fil2->FLNTC(0,:,:))-fil5->LWCF_JJA ;2 jja  lw

copy_VarMeta((fil1->FSNT(0,:,:)), swcf_djf1)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_djf1)
copy_VarMeta((fil1->FSNT(0,:,:)), swcf_jja1)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_jja1)

swcf_djf11=(fil3->FSNT(0,:,:))-(fil3->FSNTC(0,:,:))-fil5->SWCF_DJF ;lcf djf  sw
lwcf_djf11=-(fil3->FLNT(0,:,:))+(fil3->FLNTC(0,:,:))-fil5->LWCF_DJF;lcf djf  lw
swcf_jja11=(fil4->FSNT(0,:,:))-(fil4->FSNTC(0,:,:))-fil5->SWCF_JJA;lcf jja  sw
lwcf_jja11=-(fil4->FLNT(0,:,:))+(fil4->FLNTC(0,:,:))-fil5->LWCF_JJA ;clf jja  lw

copy_VarMeta((fil1->FSNT(0,:,:)), swcf_djf11)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_djf11)
copy_VarMeta((fil1->FSNT(0,:,:)), swcf_jja11)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_jja11)

swcf_djf_mm=swcf_djf11-swcf_djf1
swcf_jja_mm=swcf_jja11-swcf_jja1
lwcf_djf_mm=lwcf_djf11-lwcf_djf1
lwcf_jja_mm=lwcf_jja11-lwcf_jja1

copy_VarMeta((fil1->FSNT(0,:,:)), swcf_djf_mm)
copy_VarMeta((fil1->FSNT(0,:,:)), swcf_jja_mm)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_djf_mm)
copy_VarMeta((fil1->FSNT(0,:,:)), lwcf_jja_mm)

wks=gsn_open_wks("eps","Fig.9")
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
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftStringFontHeightF  = 0.04

plot=new((/4/),"graphic")
plot2=new((/2/),"graphic")

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~=2km"
res@gsnLeftString = "(a) DJF"
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-30 ;-60 60  10sw
res@cnMaxLevelValF=30
res@cnLevelSpacingF = 5
plot(0)=gsn_csm_contour_map(wks,lwcf_djf1,res)

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~=2km"
res@gsnLeftString = "(b) JJA" 
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-30 ;-60 60  10sw
res@cnMaxLevelValF=30
res@cnLevelSpacingF = 5
plot(1)=gsn_csm_contour_map(wks,lwcf_jja1,res)


res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~*"
res@gsnLeftString = "(c) DJF" 
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-30 ;-60 60  10sw
res@cnMaxLevelValF=30
res@cnLevelSpacingF = 5
plot(2)=gsn_csm_contour_map(wks,lwcf_djf11,res)

res@tiMainString    =""   
res@gsnRightString = "L~B~cf~N~*"
res@gsnLeftString = "(d) JJA" 
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-30 ;-60 60  10sw
res@cnMaxLevelValF=30
res@cnLevelSpacingF = 5

plot(3)=gsn_csm_contour_map(wks,lwcf_jja11,res)



res@tiMainString    =""   
res@gsnRightString = ""
res@gsnLeftString = "(e) DJF"
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-10
res@cnMaxLevelValF=10
res@cnLevelSpacingF = 2
plot2(0)=gsn_csm_contour_map(wks,lwcf_djf_mm,res)

res@tiMainString    =""   
res@gsnRightString = ""
res@gsnLeftString = "(f) JJA"
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=-10
res@cnMaxLevelValF=10
res@cnLevelSpacingF = 2
plot2(1)=gsn_csm_contour_map(wks,lwcf_jja_mm,res)


;---Panel the two sets of plots
  pres1 = True        ; Resources specific to first set of paneled plots
  pres2 = True        ; Resources specific to second set of paneled plots
  pres  = True        ; For setting the area of paneled plots


  pres1@pmLabelBarOrthogonalPosF = -0.02    ; Move closer to plots
  pres2@pmLabelBarOrthogonalPosF = -0.02

; pres@gsnPanelTop    = 1.0  ; set these if desired
; pres@gsnPanelBottom = 0.0  ; must be between 0 and 1
; pres@gsnPanelLeft   = 0.0
; pres@gsnPanelRight  = 1.0

  panel_two_sets(wks,plot,plot2,(/2,2/),(/2,1/),pres1,pres2,pres)

 
