library(RxODE)

cortisolModel <- RxODE({
  Age=P01_Age+t/365.0/24.0;
  Bw=P01_Bw;
  C01_Cu=C01_A/C01_V;
  MW_ALB=66500;
  MW_CBG=55000;
  MW_COR=362.46;
  F=C01_Cu/MW_COR*1E6;
  TA=C01_ALB/MW_ALB*1E6;
  TC=C01_CBG/MW_CBG*1E6;
  TCI=(1-C01_RC)*TC;
  TCE=C01_RC*TC;
  KA=C01_Kca/MW_ALB*1E6;
  KCI=C01_Kci/MW_CBG*1E6;
  KCE=C01_Kce/MW_CBG*1E6;
  TF=F*(1+TA/(KA+F)+TCI/(KCI+F)+TCE/(KCE+F));
  C01_fu=F/TF;
  C01_C=C01_Cu/C01_fu;
  PO_R=PO_k*PO_A;
  ME_k=ME_CL/C01_V;
  ME_R=ME_k*C01_A;
  fu_Var=C01_fu;
  d/dt(C01_A)=(+PO_R)+(-ME_R);
  d/dt(PO_A)=(-PO_R);
  d/dt(AUCU_AUC)=C01_Cu;
  d/dt(AUC_AUC)=C01_C;
})

rxUse(cortisolModel)
rxUse()
