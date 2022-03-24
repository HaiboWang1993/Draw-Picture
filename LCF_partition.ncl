fil1=addfile("/mnt/i/Twoparameter/ceres_data/lcf_climo_2007-2010.nc","r")
v1=(fil1->LCF(0,:,:)+fil1->LCF(1,:,:)+fil1->LCF(11,:,:))/3
v2=(fil1->LCF(5,:,:)+fil1->LCF(6,:,:)+fil1->LCF(7,:,:))/3

lat=fspan(-87.86379883923262,87.86379883923262,64)
lon=fspan(0,357.1875,128)

v1!0="lat"
v1!1="lon"
v1&lat=lat
v1&lon=lon
v1&lat@units="degrees_north"
v1&lon@units="degrees_east"

v2!0="lat"
v2!1="lon"
v2&lat=lat
v2&lon=lon
v2&lat@units="degrees_north"
v2&lon@units="degrees_east"  


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
qSum1 = wgt_areaave2(v1, wgt1, 0) 

wgt2  = new((/64, 128/), float)
wgt2  = conform (wgt2, dxdy, 0)
qSum2 = wgt_areaave2(v2, wgt2, 0)  

wks= gsn_open_wks("eps","Fig.1")                 
gsn_define_colormap(wks,"WhiteBlueGreenYellowRed")       
res                 = True 
res@gsnDraw         = False                   
res@gsnFrame        = False    

res@cnLinesOn       = False
res@cnFillOn        = True
res@mpCenterLonF    = 180.
res@gsnSpreadColors = True
res@lbLabelBarOn                = False       
res@gsnAddCyclic                = True          
res@cnLineLabelsOn              = False

plot=new((/2/),"graphic")


res@gsnRightString = ""
res@tiMainString=""
;res@tiMainOffsetYF =-0.03

res@gsnRightString="km"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(a) DJF" 
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=1
res@cnMaxLevelValF=10
res@cnLevelSpacingF = 1
res@tmXBLabelFontHeightF=0.04
res@tmXBValues = (/0,30,60,90,120,150,180,210,240,270,300,330,360/)
res@tmXBLabels = (/"0~S~o~N","","","90~S~o~N~E","","","180~S~o~N","","","90~S~o~N~W","","","0~S~o~N"/)
res@tmYLLabelFontHeightF=0.04
res@tmYLValues = (/90,45,0,-45,-90/)
res@tmYLLabels = (/"90~S~o~N~N","45~S~o~N~N","0~S~o~N","45~S~o~N~S","90~S~o~N~S"/)
plot(0)=gsn_csm_contour_map(wks,v1,res)


ypts1 = (/ 70.0,  70.0,  30.0,  30.0, 70.0/)
xpts1 = (/130.0, 30.0,30.0, 130.0,130.0/)

ypts2 = (/ -15.0,  15.0,  15.0,   -15.0, -15.0/)
xpts2 = (/60.0, 60.0,170.0, 170.0,60.0/)

ypts4 = (/ -30.0,  0.0,  0.0,   -30.0, -30.0/)
xpts4 = (/300.0, 300.0,255.0, 255.0,300.0/)


ypts3 = (/ -35.0,  -35.0,  -65.0,   -65.0/)
xpts3 = (/180.0, 60.0,60.0, 180.0/)

ypts33 = (/ -35.0,  -35.0,  -65.0,   -65.0/)
xpts33 = (/180.0, 270.0,270.0, 180.0/)

resp                  = True                      
resp@gsLineColor      = "red"                    
resp@gsLineThicknessF = 2.0                     


dum1 = new(4,graphic)  

do i = 0 , 3
    dum1(i)=gsn_add_polyline(wks,plot(0),xpts1(i:i+1),ypts1(i:i+1),resp)      
end do 

dum2 = new(4,graphic)  

do i = 0 , 3
    dum2(i)=gsn_add_polyline(wks,plot(0),xpts2(i:i+1),ypts2(i:i+1),resp)      
end do 

dum4 = new(4,graphic)  

do i = 0 , 3
    dum4(i)=gsn_add_polyline(wks,plot(0),xpts4(i:i+1),ypts4(i:i+1),resp)      
end do 

dum3 = new(3,graphic)  

do i = 0 , 2
    dum3(i)=gsn_add_polyline(wks,plot(0),xpts3(i:i+1),ypts3(i:i+1),resp)      
end do 

dum33 = new(3,graphic)  

do i = 0 , 2
    dum33(i)=gsn_add_polyline(wks,plot(0),xpts33(i:i+1),ypts33(i:i+1),resp)      
end do 


;drawNDCGrid(wks)
txres = True
txres@txFontHeightF = 0.05
txres@txFontColor="red"
dumtxt1=gsn_add_text(wks, plot(0), "A",80,50,txres)
dumtxt2=gsn_add_text(wks, plot(0), "B",115,0,txres)
dumtxt3=gsn_add_text(wks, plot(0), "C",160,-50,txres)
dumtxt4=gsn_add_text(wks, plot(0), "D",280,-15,txres)

res@gsnRightString = "km"
res@gsnRightStringFontHeightF  = 0.04
res@gsnLeftString = "(b) JJA" 
res@gsnLeftStringFontHeightF  = 0.04
;res@cnLevelSelectionMode = "AutomaticLevels"  
res@cnLevelSelectionMode = "ManualLevels"  
res@cnMinLevelValF=1
res@cnMaxLevelValF=10
res@cnLevelSpacingF = 1
;res@tmYLOn=False
plot(1)=gsn_csm_contour_map(wks,v2,res)



resp                          = True
resp@gsnPanelLabelBar         = True
resp@pmLabelBarWidthF         = 0.8               ; label bar width
resp@pmLabelBarHeightF        = 0.05
resp@pmLabelBarOrthogonalPosF = -0.035         ; move labelbar up a bit
resp@pmLabelBarParallelPosF   = 0.005            ; move labelbar right a bit
resp@gsnPanelBottom           = 0.06
resp@gsnPanelYWhiteSpacePercent=4
resp@gsnPanelXWhiteSpacePercent=3
resp@lbLabelFontHeightF=0.02
; resp@lbTitleString="L~B~cf~N~ (km)"
; resp@lbTitleFontHeightF=0.02
; resp@lbTitlePosition="Bottom"
; ; resp@lbLabelStride = 4 

;res@lbBoxEndCapStyle="TriangleBothEnds"

gsn_panel(wks,plot,(/1,2/),resp)

