wfopen C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\dados_br.wf1 
smpl @all
' modelo arch distribuição normal
' ajusto pela média
series dlibovm=dlibovc_sb_per-@mean(dlibovc_sb_per)
' estimo um NARCH(1)
equation archdibv
archdibv.arch(1,0) dlibovm c
show archdibv
archdibv.makegarch volatilidadearch
volatilidadearch=@sqrt(volatilidadearch)
graph g1 volatilidadearch
freeze g1
g1.addtext(t,ac)  "Volatilidade para RCPIBOV usando N-GARCH"
show g1
' Adequabilidade do modelo
archdibv.makeresids(s) res_n_arch_st 
' FAC e FACP residuos padronizados
freeze(g2) res_n_arch_st.correl(12)
show g2
' Define os resíduos ao quadrado
series res_n_arch_st_sq=res_n_arch_st^2
'FAC e FACP dos resíduos ao quadrado
freeze(g3) res_n_arch_st_sq.correl(12)
show g3
 modelo arch com distribuição t-Student
equation t_archdibv
t_archdibv.arch(1,0,tdist) dlibovm c 
show t_archdibv
t_archdibv.makegarch volatilidade_t_arch
volatilidade_t_arch=@sqrt(volatilidade_t_arch)
graph g4 volatilidade_t_arch
g4.addtext(t,ac)  "Volatilidade para RCPIBOV usando t-GARCH"
show g4
