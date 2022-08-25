wfopen C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\dados_br.wf1 
smpl @all
' modelo arch distribuição normal
' ajusto pela média
series dlibovm=dlibovc_sb_per-@mean(dlibovc_sb_per)
' estimo um NARCH(1)
equation archdibv
freeze(out_narch) archdibv.arch(1,0) dlibovm c
show out_narch
out_narch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\narch.tex"

archdibv.makegarch volatilidadearch
volatilidadearch=@sqrt(volatilidadearch)
graph g1 volatilidadearch
freeze g1
g1.addtext(t,ac)  "Volatilidade para RCPIBOV usando N-ARCH"
show g1
' Adequabilidade do modelo
archdibv.makeresids(s) res_n_arch_st 
' FAC e FACP residuos padronizados
freeze(tab1) res_n_arch_st.correl(12)
show tab1
' Define os resíduos ao quadrado
series res_n_arch_st_sq=res_n_arch_st^2
'FAC e FACP dos resíduos ao quadrado
freeze(tab2) res_n_arch_st_sq.correl(12)
show tab2


' modelo arch com distribuição t-Student
equation t_archdibv
freeze(out_tgarch) t_archdibv.arch(1,0,tdist) dlibovm c 
show out_tgarch
out_tgarch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\tarch.tex"

t_archdibv.makegarch volatilidade_t_arch
volatilidade_t_arch=@sqrt(volatilidade_t_arch)
graph g2 volatilidade_t_arch
g2.addtext(t,ac)  "Volatilidade para RCPIBOV usando t-ARCH"
show g2

' Adequabilidade do modelo
t_archdibv.makeresids(s) res_t_arch_st 
' FAC e FACP residuos padronizados
freeze(tab3) res_t_arch_st.correl(12)
show tab3

' Define os resíduos ao quadrado
series res_t_arch_st_sq=res_t_arch_st^2
'FAC e FACP dos resíduos ao quadrado
freeze(tab4) res_t_arch_st_sq.correl(12)
show tab4


' modelo arch distribuição GED
equation ged_archdibv
freeze(out_ged_arch) ged_archdibv.arch(1,0,ged)  dlibovm c 
show out_ged_arch
out_ged_arch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\ged_arch.tex"

ged_archdibv.makegarch volatilidade_ged_arch
volatilidade_ged_arch=@sqrt(volatilidade_ged_arch)
graph g3  volatilidade_ged_arch
g3.addtext(t,ac)  "Volatilidade para RCPIBOV usando GED_ARCH"
show g3 

' Adequabilidade do modelo
ged_archdibv.makeresids(s) res_ged_arch_st 
' FAC e FACP residuos padronizados
freeze(tab5) res_ged_arch_st.correl(12)
show tab5

' Define os resíduos ao quadrado
series res_ged_arch_st_sq=res_ged_arch_st^2
'FAC e FACP dos resíduos ao quadrado
freeze(tab6) res_ged_arch_st_sq.correl(12)
show tab6



' modelo garch distribuição normal
equation garchdibv
freeze(out_n_garch) garchdibv.arch(1,1) dlibovm c 
show out_n_garch
out_n_garch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\n_garch.tex"

garchdibv.makegarch volatilidadegarch
volatilidadegarch=@sqrt(volatilidadegarch)
graph g4 volatilidadegarch
g4.addtext(t,ac)  "Volatilidade para RCPIBOV usando N_GARCH(1,1)"
show g4 

' Adequabilidade do modelo
garchdibv.makeresids(s) res_n_garch_st
' FAC e FACP residuos padronizados
freeze(tab7) res_n_garch_st.correl(12)
show tab7
' Define os resíduos ao quadrado
series res_n_garch_st_sq=res_n_garch_st^2

'FAC e FACP dos resíduos ao quadrado
freeze(tab8)res_n_garch_st_sq.correl(12)
show tab8


' Estimo modelos da classe IGARCH(1,1) 
equation igarchibv
freeze(out_n_igarch) igarchibv.arch(1,1,integrated) dlibovm c 
show(out_n_igarch)
out_n_igarch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\n_igarch.tex"

igarchibv.makegarch volatilidadeigarch
volatilidadeigarch=@sqrt(volatilidadeigarch)
graph g5 volatilidadeigarch
g5.addtext(t,ac)  "Volatilidade para RCPIBOV usando N_IGARCH(1,1)"
show g5


' Estima um moddelo EGARCH
equation egarchdibv
freeze(out_n_egarch) egarchdibv.arch(1,1,e) dlibovm c 
show out_n_egarch
out_n_egarch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\n_egarch.tex"

egarchdibv.makegarch volatilidadeegarch
volatilidadeegarch=@sqrt(volatilidadeegarch)
graph g6 volatilidadeegarch
g6.addtext(t,ac)  "Volatilidade para RCPIBOV usando N_EGARCH(1,1)"
show g6


' Adequabilidade do modelo
egarchdibv.makeresids(s) res_egarch_st
' FAC e FACP residuos padronizados
freeze(tab9) res_egarch_st.correl(12)
show tab9
' Define os resíduos ao quadrado
series res_egarch_st_sq=res_egarch_st^2

'FAC e FACP dos resíduos ao quadrado
freeze(tab10) res_egarch_st_sq.correl(12)
show tab10


' modelo limiar garch
equation tgarchibv
freeze(out_n_tgarch)  tgarchibv.arch(1,1,thrsh=1) dlibovm c 
show out_n_tgarch
out_n_tgarch.save(t=tex)  "C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\EVIEWS\n_tgarch.tex"


tgarchibv.makegarch volatilidadetgarch
volatilidadetgarch=@sqrt(volatilidadetgarch)
graph g7 volatilidadetgarch
g7.addtext(t,ac)  "Volatilidade para RCPIBOV usando N_TGARCH(1,1)"
show g7

' Adequabilidade do modelo
tgarchdibv.makeresids(s) res_tgarch_st
' FAC e FACP residuos padronizados
freeze(tab11) res_tgarch_st.correl(12)
show tab11
' Define os resíduos ao quadrado
series res_tgarch_st_sq=res_tgarch_st^2

'FAC e FACP dos resíduos ao quadrado
freeze(tab12) res_tgarch_st_sq.correl(12)
show tab12



' Previsão
' estima o N-GARCH sem as ultimas 10 observaçoes
smpl @first @last-10
garchdibv.arch(1,1) dlibovm c 
smpl @last-9 @last
garchdibv.forecast fibvgarch se fibvgarchvar
series fibvgarchls=fibvgarch+1.96*@sqrt(fibvgarchvar)
series fibvgarchli=fibvgarch-1.96*@sqrt(fibvgarchvar)
group previsaogarch fibvgarch fibvgarchli fibvgarchls dlibovm
graph g66 previsaogarch
show g66
smpl @all




' modelo de volatilidade estoc ´astica
' cria a s ´erie do log dos retornos ao quadrado ajustados pela media
series lqdibvfm =log(dlibovm^2)
' fixo a variancia da equa ¸cao como o log da distribui ¸c~ao quadrado
!pi = @acos(-1)
scalar s2 = 0.5*!pi*!pi
' crio o objeto de espa ¸co de estado no eviews para a estimacao por quasi-m ´axima verossimilhanca
sspace volatilidadeestocastica
volatilidadeestocastica.append @signal lqdibvfm= -1.27 + ht + [var=s2]
volatilidadeestocastica.append @state ht = c(1) + c(2)*ht(-1) + [var=exp(c(3))]
' valores iniciais
c(1) = 0.01
c(2) = 0.85
c(3) = 0.1
 ' estimo por usando maxima verossimilhança
volatilidadeestocastica.ml
volatilidadeestocastica.makestate(t=pred) vehf
volatilidadeestocastica.makestate(t=predse) vehfse
volatilidadeestocastica.makestate(t=filt) veht
volatilidadeestocastica.makestate(t=filtse) vehtse
volatilidadeestocastica.makestate(t=smooth) vehs
volatilidadeestocastica.makestate(t=smoothse) vehsse
' gr ´afico comparando a log volatilidade dos modelos sv e garch
graph graph1.line log(volatilidadegarch^2) vehf vehs
' graph1.options size(8,2)
graph1.addtext(0.1,-0.3) Log Volatilidade
graph1.setelem(1) legend(GARCH(1,1))
graph1.setelem(2) legend(Volatilidade Estocástica - Um Passo a Frente)
graph1.setelem(3) legend(Volatilidade Estocástica - Suavizada)
' graph1.legend columns(1) position(0,0)
show graph1
series volatilidadesv=@sqrt(exp(vehf))



