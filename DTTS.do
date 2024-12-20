
xtunitroot fisher tasa_hom, dfuller trend lags(0)

xtunitroot fisher d.tasa_hom, dfuller trend lags(0)


*modelo 1 doble efecto fijo

xtreg d.tasa_hom DTTS i.year, robust fe

outreg2 using trafico.doc, replace ctitle(d.tasa_hom) drop(i.year)

*modelo 2 doble efecto fijo + control desempeno economico empleo

xtreg d.tasa_hom DTTS tasa_empleo i.year, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom) drop(i.year)


*modelo 3 doble efecto fijo + poblacion

xtreg d.tasa_hom DTTS lnpob i.year, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom) drop(i.year)

*modelo 4 doble efecto fijo + controles politicos 

xtreg d.tasa_hom DTTS i.gobierno i.year, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom) drop(i.year)


*modelo 5 doble efecto fijo + controles 

xtreg d.tasa_hom DTTS tasa_empleo lnpob i.gobierno i.year, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom) drop(i.year)


*modelos con pobreza y COVID


*modelo 1 doble efecto fijo + pobreza nbi

xtreg d.tasa_hom DTTS covid i.year pobrezanbi, robust fe

outreg2 using trafico.doc, replace ctitle(d.tasa_hom)


*modelo 2 doble efecto fijo + pobreza multi

xtreg d.tasa_hom DTTS  covid i.year pobrezamult, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom)


*modelo 3 doble efecto fijo + pobreza ingresos

xtreg d.tasa_hom DTTS covid i.year pobrezaing, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom)


*modelo 4 doble efecto fijo + pobreza ingresos

xtreg d.tasa_hom DTTS covid i.year pobrezaexing, robust fe

outreg2 using trafico.doc, append ctitle(d.tasa_hom)



*Causalidad

xtreg d.tasa_hom l.d.tasa_hom l.DTTS i.year, robust fe

outreg2 using trafico.doc, replace ctitle(d.tasa_hom)

xtdpdsys d.tasa_hom L(2).d.tasa_hom DTTS, twostep 
estat sargan
estat abond

outreg2 using trafico.doc, append ctitle(d.tasa_hom)

xtdpdsys d.tasa_hom L(2).d.tasa_hom DTTS, twostep vce(robust)
estat abond

outreg2 using trafico.doc, append ctitle(d.tasa_hom)



