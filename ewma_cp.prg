wfopen C:\Users\Pedro\Dropbox\Topicos_em_Financas_2022\garch_model\dados_br.wf1 
smpl@all
' cria a serie dos quadrados
series dibvsq=dlibov_per_sq
' obtem volatilidade via ewma para as series - 1-lambda estimado
freeze(tewmaibvf) dibvsq.smooth(s,e) dibvsqsm
%alpha=tewmaibvf(8,5)
%rmse=tewmaibvf(10,5)
!trmse=@val(%rmse)
scalar rmseibv=!trmse
!lambda=@val(%alpha)
scalar libv=1-!lambda
series EWMA_IBV=dibvsqsm
EWMA_IBV.line

