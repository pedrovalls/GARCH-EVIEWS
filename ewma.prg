wfopen C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\dados_br.wf1 
smpl 1/04/2000 1/01/2020
' cria a serie dos quadrados
series dibvsq=dlibov_per_sq
' obtem volatilidade via ewma para as series - 1-lambda estimado
freeze(tewmaibvfpc) dibvsq.smooth(s,e) dibvsqsm
%alpha=tewmaibvfpc(8,5)
%rmse=tewmaibvfpc(10,5)
!trmse=@val(%rmse)
scalar rmseibv=!trmse
!lambda=@val(%alpha)
scalar libv=1-!lambda
series EWMA_IBV_pc=dibvsqsm
EWMA_IBV_pc.line

