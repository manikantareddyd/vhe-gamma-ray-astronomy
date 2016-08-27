load data.dat;
[r,c]=size(data);
jdl = timeconv(data(1,2),data(1,3),data(1,4),data(1,5),data(1,6),data(1,6));
count=1;
bin=100/86400;
timeaxis(1)=jdl+bin/2;
freq(1)=0;
for n=1:1:r
    if(data(n,20)<360)
        asc = -1.3;
    else
        asc = -0.4;
    end
    if(timeconv(data(n,2),data(n,3),data(n,4),data(n,5),data(n,6),data(n,6))>jdl+bin)
        error(count) = sqrt(freq(count));
        count=count+1;
        freq(count)=0;
        
        if(timeconv(data(n,2),data(n,3),data(n,4),data(n,5),data(n,6),data(n,6))<jdl+(2*bin))
            jdl=jdl+bin;
        else
            jdl=timeconv(data(n,2),data(n,3),data(n,4),data(n,5),data(n,6),data(n,6));
        end
        timeaxis(count)=jdl+bin/2;
    end
    if(data(n,16)>=0.11 && data(n,16)<=(0.1+(0.052*log(data(n,20)))) && data(n,17)>=0.06 && data(n,17)<=(0.085+(0.016*log(data(n,20)))) && (data(n,16)/data(n,17))>=1.55 && data(n,20)>=310 && data(n,18)>=0.5 && data(n,18)<=(1.27*((cos(pi*data(n,14)/180))^0.95)) && data(n,22)>=4 && data(n,21)>=0.35 && data(n,25)>=asc)
        %for c=1:1:25
        %    Gamma(count,c) = data(n,c);
        %end
        freq(count) = freq(count) + 1;
        %SelectAlpha(count)=data(n,19);
    end
    per=100*n/r
end
error(count) = sqrt(freq(count));

errorbar(timeaxis,freq,error);
%plot(timeaxis,freq);



