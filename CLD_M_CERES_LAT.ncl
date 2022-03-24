fil1=addfile("/mnt/i/Twoparameter/model_data_double/ave_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/ceres_data/ceres06-15_cld_DJF.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/model_data_double/ave_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/ceres_data/ceres06-15_cld_JJA.nc", "r")


vl1=dim_avg_n_Wrap(fil1->GCLDTOT, 0)
vl2=dim_avg_n_Wrap(fil1->CLDTOT, 0)
vl3=fil2->CLDTOT

vl4=dim_avg_n_Wrap(fil3->GCLDTOT, 0)
vl5=dim_avg_n_Wrap(fil3->CLDTOT, 0)
vl6=fil4->CLDTOT

; vl1=fil1->GCLDTOT
; vl2=fil1->CLDTOT
; vl3=fil2->CLDTOT

; vl4=fil3->GCLDTOT
; vl5=fil3->CLDTOT
; vl6=fil4->CLDTOT

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


var11=vl2-vl1
var22=vl5-vl4


copy_VarMeta(vl1,var1)
copy_VarMeta(vl1,var2)
copy_VarMeta(vl1,var3)
copy_VarMeta(vl1,var4)
copy_VarMeta(vl1,var5)
copy_VarMeta(vl1,var6)

copy_VarMeta(vl1,var11)
copy_VarMeta(vl1,var22)

var_2=dim_avg_n_Wrap(var2, 1)
var_3=dim_avg_n_Wrap(var3, 1)
var_5=dim_avg_n_Wrap(var5, 1)
var_6=dim_avg_n_Wrap(var6, 1)

var_11=dim_avg_n_Wrap(var11, 1)
var_22=dim_avg_n_Wrap(var22, 1)

var=new((/4,64/),float)

var(0,:)      =var_2
var(1,:)      =var_3
var(2,:)      =var_5
var(3,:)      =var_6

var_diff=new(((/2,64/)),float)
var_diff(0,:)      =var_11
var_diff(1,:)      =var_22


wks=gsn_open_wks("eps", "Fig.4")

plot=new((/2/),"graphic")

res                         =True
res@gsnFrame                = False
res@gsnDraw                 =False
res@tiMainString            = "Total Cloud Fraction Difference "
res@tiMainOffsetYF          =0.03
res@tiMainFontHeightF       =0.03
res@tiXAxisString           =""
res@tiYAxisString           ="Model and Observation"
res@tiXAxisSide             ="Bottom"
res@tiXAxisFontHeightF      =0.03
res@tiYAxisFontHeightF      =0.03
res@tmXBLabelFontHeightF=0.03
res@tmYLLabelFontHeightF=0.03
res@tmYLMode                ="Explicit"
res@tmYLValues=(/-0.2,-0.1,0,0.1,0.2,0.3/)
res@tmYLLabels=(/"-0.2","-0.1","0","0.1","0.2","0.3"/)
res@tmXBMode                ="Explicit"
res@tmXBValues = (/90,60,30,0,-30,-60,-90/)
res@tmXBLabels = (/"90~S~o~N~N","60~S~o~N~N","30~S~o~N~N","0","30~S~o~N~S","60~S~o~N~S","90~S~o~N~S"/)
res@tmXBLabelsOn=False
res@xyExplicitLegendLabels  =(/"DJF_L~B~cf~N~=2km","DJF_L~B~cf~N~*","JJA_L~B~cf~N~=2km","JJA_L~B~cf~N~*"/)
res@xyLineColors            =(/"blue","blue","red","red"/)
res@xyDashPatterns          =(/5,4,2,1/)
res@xyLineThicknessF        =3
res@pmLegendDisplayMode     ="Always"
res@lgLabelFontHeightF      =0.015
res@lgPerimOn                = False
res@pmLegendWidthF          =0.12
res@pmLegendHeightF         =0.1
res@pmLegendOrthogonalPosF  =-1.15
res@pmLegendParallelPosF    =0.75
res@vpHeightF=0.3
res@vpWidthF=0.7
res@vpXF             = 0.2
res@vpYF             = 0.85        ; Higher on the page


plot(0)=gsn_csm_xy(wks, vl1&lat, var, res)

ypts = (/ 0, 0/)
xpts = (/-90, 90/)

resp                  = True                      
resp@gsLineColor      = "black"                    
resp@gsLineThicknessF = 2.0    

dum1=gsn_add_polyline(wks,plot(0),xpts(0:1),ypts(0:1),resp)

res1                         =True
res1@gsnFrame                = False
res1@gsnDraw                 =False

res1@tiXAxisString           ="Latitude"
res1@tiYAxisString           ="Model and Model "
res1@tiXAxisSide             ="Bottom"
res1@tiXAxisFontHeightF      =0.03
res1@tiYAxisFontHeightF      =0.03
res1@tmXBLabelFontHeightF=0.03
res1@tmYLLabelFontHeightF=0.03
res1@tmYLMode                ="Explicit"
res1@tmYLValues=(/-0.08,-0.06,-0.04,-0.02,0,0.02,0.04/)
res1@tmYLLabels=(/"-0.08","-0.06","-0.04","-0.02","0","0.02","0.04"/)
;res1@tmYLLabels=(/"-8","-6","-4","-2","0","2","4"/)
res1@tmXBMode                ="Explicit"
res1@tmXBValues = (/90,60,30,0,-30,-60,-90/)
res1@tmXBLabels = (/"90~S~o~N~N","60~S~o~N~N","30~S~o~N~N","0","30~S~o~N~S","60~S~o~N~S","90~S~o~N~S"/)
res1@xyExplicitLegendLabels  =(/"DJF_L~B~cf~N~*-L~B~cf~N~=2km","JJA_L~B~cf~N~*-L~B~cf~N~=2km"/)
res1@xyLineColors            =(/"blue","red"/)
res1@xyDashPatterns          =(/5,2/)
res1@xyLineThicknessF        =3
res1@pmLegendDisplayMode     ="Always"
res1@lgLabelFontHeightF      =0.015
res1@lgPerimOn                = False
res1@pmLegendWidthF          =0.12
res1@pmLegendHeightF         =0.1
res1@pmLegendOrthogonalPosF  =-1.5
res1@pmLegendParallelPosF    =0.8
res1@vpHeightF=0.3
res1@vpWidthF=0.7
res1@vpXF             = 0.2       ; Same X location as first plot
res1@vpYF             = 0.45      ; Lower on the page


plot(1)=gsn_csm_xy(wks, vl1&lat, var_diff, res1) 


dum2=gsn_add_polyline(wks,plot(1),xpts(0:1),ypts(0:1),resp)


; resp=True
; resp@gsnMaximize=True
; resp@gsnPanelYWhiteSpacePercent=0
; ; resp@gsnPanelXWhiteSpacePercent=10
; gsn_panel(wks,plot,(/2,1/),resp)

draw(plot)