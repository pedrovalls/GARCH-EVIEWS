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
g1.addtext(t,ac)  "Volatilidade para RCPIBOV usando N-GARCH"
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
g2.addtext(t,ac)  "Volatilidade para RCPIBOV usando t-GARCH"
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

