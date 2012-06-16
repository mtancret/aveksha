%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 9;
%AUTOASSIGN      = 1;
%DECIMALS        = 1;
%ENDTIME         = 100000;
data_in[15:0] { A In Default None 0 1 50 } = DonTCare 10000 84 294000
   0 500000;
mode { A In Default None 0 1 50 } = 2 10000 0 294500 1 500000
  ;
reset { A In Default None 0 1 50 } = 0 10000 1 10000 0 284500
   1 10000 0 500000;
enable { A In Default None 0 1 50 } = 0 30000 1 780000;
clock { A In Default None 0 1 50 } = (0 5000 1 5000)## ;
tdo { A In Default None 0 1 50 } = 0 450000 1 100000 0 250000
  ;
data_out[15:0] { A Out Default None 0 1 50 } = ;
done { A Out Default None 0 1 50 } = ;
tck { A Out Default None 0 1 50 } = ;
tms { A Out Default None 0 1 50 } = ;
tdi { A Out Default None 0 1 50 } = ;
