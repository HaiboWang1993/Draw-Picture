fil1=addfile("/mnt/i/Twoparameter/model_data_single/lcf_climo_2007-2010.nc","r")

v1=fil1->LCF(:,{30:70},{30:130})
v2=fil1->LCF(:,{-15:15},{60:170})
v3=fil1->LCF(:,{-65:-35},{60:270})
v4=fil1->LCF(:,{-30:0},{255:300})

vl1=dim_avg_n_Wrap(dim_avg_n_Wrap(v1, 2), 1)
vl2=dim_avg_n_Wrap(dim_avg_n_Wrap(v2, 2), 1)
vl3=dim_avg_n_Wrap(dim_avg_n_Wrap(v3, 2), 1)
vl4=dim_avg_n_Wrap(dim_avg_n_Wrap(v4, 2), 1)

vl1!0 = "time" 
vl1&time = ispan(1,12,1)
var=new((/4,12/),float)

var(0,:)      =vl1
var(1,:)      =vl2
var(2,:)      =vl3
var(3,:)      =vl4

; wks_type = "png"
; wks_type@wkWidth = 2500
; wks_type@wkHeight = 2500
wks=gsn_open_wks("eps", "Fig.2")
res                         =True
res@gsnFrame                = False
res@gsnDraw                 =False
res@gsnMaximize             =True
; res@tiMainString            = ""
; res@tiMainOffsetYF          =0.03
; res@tiMainFontHeightF       =0.02
res@tiXAxisString           ="Month"
res@tiYAxisString           ="L~B~cf~N~* Domain Mean (km)"
res@tiXAxisSide             ="Bottom"
res@tiXAxisFontHeightF      =0.025
res@tiYAxisFontHeightF      =0.025
res@tmYLMode                ="Manual"
res@trYMinF                 =1.5
res@trYMaxF                 =4.5
res@tmYLTickSpacingF        =0.5
res@tmYLMinorPerMajor       =4
res@trXMinF                 =1
res@tmXBMode="Explicit"
res@tmXBValues=(/1,2,3,4,5,6,7,8,9,10,11,12/)
res@tmXBLabels=(/"1","2","3","4","5","6","7","8","9","10","11","12"/)
res@tmYLLabelFontHeightF=0.025
res@tmXBLabelFontHeightF=0.025
res@xyExplicitLegendLabels  =(/"A","B","C","D"/)
res@xyLineColors            =(/"blue","black","green","red"/)
res@xyDashPatterns          =(/5,4,2,1/)
res@xyLineThicknessF        =3
res@pmLegendDisplayMode     ="Always"
res@lgLabelFontHeightF      =0.02
res@lgPerimOn               =False
res@pmLegendWidthF          =0.12
res@pmLegendHeightF         =0.15
res@pmLegendOrthogonalPosF  =-1.3
res@pmLegendParallelPosF    =0.8
res@vpHeightF=0.4
res@vpWidthF=0.8
res@tmXTOn = False
res@tmYROn = False
;drawNDCGrid(wks)

plot=gsn_csm_xy(wks, vl1&time, var, res)

draw(plot)
frame(wks)
; res@gsLineColor      = "red"
; res@gsLineThicknessF =3

; y=fspan(0, 0, 64)
; gsn_polyline(wks, plot, v1&lat, y, res)
; ;frame(wks)

