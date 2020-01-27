var cw,dd,ss,tt,aa,rr,result;ss=argument1;tt=argument2;cw=ss-tt;
if(cw=0)then{result=0;}if(cw<0)then{result=-1;
if(cw>-180)then{result=1;}}else{result=1;if(cw<180)then{result=-1;}}
aa=result;dd=abs(tt-ss);if(dd>180)then{result=360-dd;}else{result=dd;}
rr=result{if aa=1{rr=-result;}}if argument0=1{rr=abs(rr)}return rr;
