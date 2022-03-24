fil1=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_DJF_climo.nc","r")
fil2=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_DJF_climo.nc", "r")
fil3=addfile("/mnt/i/Twoparameter/CRF_TWO_2/ave_CRF_TWO_2_JJA_climo.nc","r")
fil4=addfile("/mnt/i/Twoparameter/CRF_TWO_lcf/ave_CRF_TWO_lcf_JJA_climo.nc", "r")
fil5=addfile("/mnt/i/Twoparameter/ceres_data/CERES_CRF.nc", "r")

varname1=(/"FSNT","FSNTC"/)
varname2=(/"FLNT","FLNTC"/)
;djf
vl1=dim_avg_n_Wrap(fil1->$varname1(0)$, 0) ;2 all sw
vl2=dim_avg_n_Wrap(fil1->$varname1(1)$, 0) ;2 clr sw
vl3=dim_avg_n_Wrap(fil2->$varname1(0)$, 0) ;lcf all sw
vl4=dim_avg_n_Wrap(fil2->$varname1(1)$, 0) ;lcf clr sw

vl5=dim_avg_n_Wrap(fil1->$varname2(0)$, 0) ;2 all lw
vl6=dim_avg_n_Wrap(fil1->$varname2(1)$, 0) ;2 clr lw
vl7=dim_avg_n_Wrap(fil2->$varname2(0)$, 0) ;lcf all lw
vl8=dim_avg_n_Wrap(fil2->$varname2(1)$, 0) ;lcf clr lw

;jja
vl11=dim_avg_n_Wrap(fil3->$varname1(0)$, 0) ;2 all sw
vl22=dim_avg_n_Wrap(fil3->$varname1(1)$, 0) ;2 clr sw
vl33=dim_avg_n_Wrap(fil4->$varname1(0)$, 0) ;lcf all sw
vl44=dim_avg_n_Wrap(fil4->$varname1(1)$, 0) ;lcf clr sw

vl55=dim_avg_n_Wrap(fil3->$varname2(0)$, 0) ;2 all lw
vl66=dim_avg_n_Wrap(fil3->$varname2(1)$, 0) ;2 clr lw
vl77=dim_avg_n_Wrap(fil4->$varname2(0)$, 0) ;lcf all lw
vl88=dim_avg_n_Wrap(fil4->$varname2(1)$, 0) ;lcf clr lw

swcf_djf_2=vl1-vl2
lwcf_djf_2=-vl5+vl6
swcf_jja_2=vl11-vl22
lwcf_jja_2=-vl55+vl66

swcf_djf_lcf=vl3-vl4
lwcf_djf_lcf=-vl7+vl8
swcf_jja_lcf=vl33-vl44
lwcf_jja_lcf=-vl77+vl88

copy_VarMeta(vl1, swcf_djf_2)
copy_VarMeta(vl1, lwcf_djf_2)
copy_VarMeta(vl1, swcf_jja_2)
copy_VarMeta(vl1, lwcf_jja_2)
copy_VarMeta(vl1, swcf_djf_lcf)
copy_VarMeta(vl1, lwcf_djf_lcf)
copy_VarMeta(vl1, swcf_jja_lcf)
copy_VarMeta(vl1, lwcf_jja_lcf)

swcf_djf_ceres=fil5->SWCF_DJF
swcf_jja_ceres=fil5->SWCF_JJA
lwcf_djf_ceres=fil5->LWCF_DJF
lwcf_jja_ceres=fil5->LWCF_JJA

var1=swcf_djf_2({30:70},{30:130})
var2=swcf_djf_lcf({30:70},{30:130})
var3=swcf_djf_ceres({30:70},{30:130})

var4=swcf_jja_2({30:70},{30:130})
var5=swcf_jja_lcf({30:70},{30:130})
var6=swcf_jja_ceres({30:70},{30:130})

var7=lwcf_djf_2({30:70},{30:130})
var8=lwcf_djf_lcf({30:70},{30:130})
var9=lwcf_djf_ceres({30:70},{30:130})

var10=lwcf_jja_2({30:70},{30:130})
var11=lwcf_jja_lcf({30:70},{30:130})
var12=lwcf_jja_ceres({30:70},{30:130})

var1B=swcf_djf_2({-15:15},{60:170})
var2B=swcf_djf_lcf({-15:15},{60:170})
var3B=swcf_djf_ceres({-15:15},{60:170})

var4B=swcf_jja_2({-15:15},{60:170})
var5B=swcf_jja_lcf({-15:15},{60:170})
var6B=swcf_jja_ceres({-15:15},{60:170})

var7B=lwcf_djf_2({-15:15},{60:170})
var8B=lwcf_djf_lcf({-15:15},{60:170})
var9B=lwcf_djf_ceres({-15:15},{60:170})

var10B=lwcf_jja_2({-15:15},{60:170})
var11B=lwcf_jja_lcf({-15:15},{60:170})
var12B=lwcf_jja_ceres({-15:15},{60:170})


var1C=swcf_djf_2({-65:-35},{60:270})
var2C=swcf_djf_lcf({-65:-35},{60:270})
var3C=swcf_djf_ceres({-65:-35},{60:270})

var4C=swcf_jja_2({-65:-35},{60:270})
var5C=swcf_jja_lcf({-65:-35},{60:270})
var6C=swcf_jja_ceres({-65:-35},{60:270})

var7C=lwcf_djf_2({-65:-35},{60:270})
var8C=lwcf_djf_lcf({-65:-35},{60:270})
var9C=lwcf_djf_ceres({-65:-35},{60:270})

var10C=lwcf_jja_2({-65:-35},{60:270})
var11C=lwcf_jja_lcf({-65:-35},{60:270})
var12C=lwcf_jja_ceres({-65:-35},{60:270})


var1D=swcf_djf_2({-30:0},{255:300})
var2D=swcf_djf_lcf({-30:0},{255:300})
var3D=swcf_djf_ceres({-30:0},{255:300})

var4D=swcf_jja_2({-30:0},{255:300})
var5D=swcf_jja_lcf({-30:0},{255:300})
var6D=swcf_jja_ceres({-30:0},{255:300})

var7D=lwcf_djf_2({-30:0},{255:300})
var8D=lwcf_djf_lcf({-30:0},{255:300})
var9D=lwcf_djf_ceres({-30:0},{255:300})

var10D=lwcf_jja_2({-30:0},{255:300})
var11D=lwcf_jja_lcf({-30:0},{255:300})
var12D=lwcf_jja_ceres({-30:0},{255:300})

ap=new((/3,25/), double)
bp=new((/3,25/), double)
cp=new((/3,25/), double)
dp=new((/3,25/), double)
ap(0,:)  = pdfx(var1, 0, False)    ; default number of bins
ap(1,:)  = pdfx(var2, 0, False)    ; default number of bins
ap(2,:)  = pdfx(var3, 0, False)    ; default number of bins

bp(0,:)  = pdfx(var4, 0, False)    ; default number of bins
bp(1,:)  = pdfx(var5, 0, False)    ; default number of bins
bp(2,:)  = pdfx(var6, 0, False)    ; default number of bins

cp(0,:)  = pdfx(var7, 0, False)    ; default number of bins
cp(1,:)  = pdfx(var8, 0, False)    ; default number of bins
cp(2,:)  = pdfx(var9, 0, False)    ; default number of bins

dp(0,:)  = pdfx(var10, 0, False)    ; default number of bins
dp(1,:)  = pdfx(var11, 0, False)    ; default number of bins
dp(2,:)  = pdfx(var12, 0, False)    ; default number of bins



apB=new((/3,25/), double)
bpB=new((/3,25/), double)
cpB=new((/3,25/), double)
dpB=new((/3,25/), double)
apB(0,:)  = pdfx(var1B, 0, False)    ; default number of bins
apB(1,:)  = pdfx(var2B, 0, False)    ; default number of bins
apB(2,:)  = pdfx(var3B, 0, False)    ; default number of bins

bpB(0,:)  = pdfx(var4B, 0, False)    ; default number of bins
bpB(1,:)  = pdfx(var5B, 0, False)    ; default number of bins
bpB(2,:)  = pdfx(var6B, 0, False)    ; default number of bins

cpB(0,:)  = pdfx(var7B, 0, False)    ; default number of bins
cpB(1,:)  = pdfx(var8B, 0, False)    ; default number of bins
cpB(2,:)  = pdfx(var9B, 0, False)    ; default number of bins

dpB(0,:)  = pdfx(var10B, 0, False)    ; default number of bins
dpB(1,:)  = pdfx(var11B, 0, False)    ; default number of bins
dpB(2,:)  = pdfx(var12B, 0, False)    ; default number of bins

apC=new((/3,25/), double)
bpC=new((/3,25/), double)
cpC=new((/3,25/), double)
dpC=new((/3,25/), double)
apC(0,:)  = pdfx(var1C, 0, False)    ; default number of bins
apC(1,:)  = pdfx(var2C, 0, False)    ; default number of bins
apC(2,:)  = pdfx(var3C, 0, False)    ; default number of bins

bpC(0,:)  = pdfx(var4C, 0, False)    ; default number of bins
bpC(1,:)  = pdfx(var5C, 0, False)    ; default number of bins
bpC(2,:)  = pdfx(var6C, 0, False)    ; default number of bins

cpC(0,:)  = pdfx(var7C, 0, False)    ; default number of bins
cpC(1,:)  = pdfx(var8C, 0, False)    ; default number of bins
cpC(2,:)  = pdfx(var9C, 0, False)    ; default number of bins

dpC(0,:)  = pdfx(var10C, 0, False)    ; default number of bins
dpC(1,:)  = pdfx(var11C, 0, False)    ; default number of bins
dpC(2,:)  = pdfx(var12C, 0, False)    ; default number of bins



apD=new((/3,25/), double)
bpD=new((/3,25/), double)
cpD=new((/3,25/), double)
dpD=new((/3,25/), double)
apD(0,:)  = pdfx(var1D, 0, False)    ; default number of bins
apD(1,:)  = pdfx(var2D, 0, False)    ; default number of bins
apD(2,:)  = pdfx(var3D, 0, False)    ; default number of bins

bpD(0,:)  = pdfx(var4D, 0, False)    ; default number of bins
bpD(1,:)  = pdfx(var5D, 0, False)    ; default number of bins
bpD(2,:)  = pdfx(var6D, 0, False)    ; default number of bins

cpD(0,:)  = pdfx(var7D, 0, False)    ; default number of bins
cpD(1,:)  = pdfx(var8D, 0, False)    ; default number of bins
cpD(2,:)  = pdfx(var9D, 0, False)    ; default number of bins

dpD(0,:)  = pdfx(var10D, 0, False)    ; default number of bins
dpD(1,:)  = pdfx(var11D, 0, False)    ; default number of bins
dpD(2,:)  = pdfx(var12D, 0, False)    ; default number of bins


wks  = gsn_open_wks ("eps","pdfffffff")             ; send graphics to PNG file
plot    = new ( (/16/), "graphic")
res  = True
res@gsnDraw                = False
res@gsnFrame               = False
res@tmXBLabelFontHeightF=0.04
res@tmYLLabelFontHeightF=0.04
res@tiXAxisFontHeightF=0.06
res@tiYAxisFontHeightF=0.06
res@xyLineThicknessF       = 2
res@tiYAxisString          = "PDF (%)"

res@gsnCenterString        = "(a) SWCRF_DJF(W m~S~-2~N~)"
res@gsnCenterStringFontHeightF=0.06
res@xyExplicitLegendLabels  =(/"L~B~cf~N~=2km","L~B~cf~N~*","CERES"/)
res@xyLineColors            =(/"blue","red","black"/)
res@xyDashPatterns          =(/5,4,2/)
res@xyLineThicknessF        =3
res@tmYLMode                ="Manual"
res@trYMinF                 =0
res@trYMaxF                 =25
res@tmYLTickSpacingF        =12.5
res@tmXTOn = False
res@tmYROn = False

res@vpHeightF=0.3
res@vpWidthF=0.8

plot(0)= gsn_csm_xy (wks, ap@bin_center, ap, res)

res@tiYAxisString           =""
res@gsnCenterString        = "(b) SWCRF_JJA(W m~S~-2~N~)"
plot(1)= gsn_csm_xy (wks, bp@bin_center, bp, res)


res@gsnCenterString        = "(c) LWCRF_DJF(W m~S~-2~N~)"
plot(2)= gsn_csm_xy (wks, cp@bin_center, cp, res)

res@gsnCenterString        = "(d) LWCRF_JJA(W m~S~-2~N~)"

plot(3)= gsn_csm_xy (wks, dp@bin_center, dp, res)


res@gsnCenterString        = "(a) SWCRF_DJF(W m~S~-2~N~)"
res@tiYAxisString           ="PDF(%)"
plot(4)= gsn_csm_xy (wks, apB@bin_center, apB, res)

res@tiYAxisString           =""
res@gsnCenterString        = "(b) SWCRF_JJA(W m~S~-2~N~)"
plot(5)= gsn_csm_xy (wks, bpB@bin_center, bpB, res)


res@gsnCenterString        = "(c) LWCRF_DJF(W m~S~-2~N~)"
plot(6)= gsn_csm_xy (wks, cpB@bin_center, cpB, res)


res@gsnCenterString        = "(d) LWCRF_JJA(W m~S~-2~N~)"
plot(7)= gsn_csm_xy (wks, dpB@bin_center, dpB, res)


res@tiYAxisString           ="PDF(%)"
res@gsnCenterString        = "(a) SWCRF_DJF(W m~S~-2~N~)"
plot(8)= gsn_csm_xy (wks, apC@bin_center, apC, res)


res@tiYAxisString           =""
res@gsnCenterString        = "(b) SWCRF_JJA(W m~S~-2~N~)"
plot(9)= gsn_csm_xy (wks, bpC@bin_center, bpC, res)


res@gsnCenterString        = "(c) LWCRF_DJF(W m~S~-2~N~)"
plot(10)= gsn_csm_xy (wks, cpC@bin_center, cpC, res)



res@gsnCenterString        = "(d) LWCRF_JJA(W m~S~-2~N~)"
plot(11)= gsn_csm_xy (wks, dpC@bin_center, dpC, res)



res@tiYAxisString           ="PDF(%)"
res@gsnCenterString        = "(a) SWCRF_DJF(W m~S~-2~N~)"
plot(12)= gsn_csm_xy (wks, apD@bin_center, apD, res)

res@tiYAxisString           =""
res@gsnCenterString        = "(b) SWCRF_JJA(W m~S~-2~N~)"
plot(13)= gsn_csm_xy (wks, bpD@bin_center, bpD, res)


res@gsnCenterString        = "(c) LWCRF_DJF(W m~S~-2~N~)"
plot(14)= gsn_csm_xy (wks, cpD@bin_center, cpD, res)

res@gsnCenterString        = "(d) LWCRF_JJA(W m~S~-2~N~)"

res@pmLegendDisplayMode     ="Always"
res@lgPerimOn                = False
res@lgLabelFontHeightF      =0.04
res@pmLegendWidthF          =0.15
res@pmLegendHeightF         =0.15
res@pmLegendOrthogonalPosF  =-1.2
res@pmLegendParallelPosF    =0.8;0.2
plot(15)= gsn_csm_xy (wks, dpD@bin_center, dpD, res)

resp    = True
resp@gsnMaximize=True
;resp@gsnPanelRowSpec       = True              ; tell panel what order to plt
resp@gsnPanelYWhiteSpacePercent=8
resp@gsnPanelXWhiteSpacePercent=5
gsn_panel(wks,plot,(/4,4/),resp)

;A:30N-70N,30E-130E,;;;{30:70},{30:130}
;B:15S-15N,60E-170E,;;;{-15:15},{60:170}
;C:65S-35S,60E-90W,;;;{-65:-35},{60:270}
;D:30S-0,120W-75W,;;;{-30:0},{255:300}
