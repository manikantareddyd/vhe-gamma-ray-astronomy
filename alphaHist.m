load data.dat;
count=1;
xc = [4.5,13.5,22.5,31.5,40.5,49.5,58.5,67.5,76.5,85.5];
[r,c]=size(data);
for n=1:1:r
    if(data(n,20)<360)
        asc = -1.3;
    else
        asc = -0.4;
    end
    if(data(n,16)>=0.11 && data(n,16)<=(0.1+(0.052*log(data(n,20)))) && data(n,17)>=0.06 && data(n,17)<=(0.085+(0.016*log(data(n,20)))) && (data(n,16)/data(n,17))>=1.55 && data(n,20)>=310 && data(n,18)>=0.5 && data(n,18)<=(1.27*((cos(pi*data(n,14)/180))^0.95)) && data(n,22)>=4 && data(n,21)>=0.35 && data(n,25)>=asc)
        %for c=1:1:25
        %    Gamma(count,c) = data(n,c);
        %end
        SelectAlpha(count)=data(n,19);
        count = count +1;
    end
    per=100*n/r
end
hist(SelectAlpha,xc);
Non=1;
Noff=1;
for n=1:1:count-1
    if(SelectAlpha(n)<=18)
        Non= Non+1;
    end
    if(SelectAlpha(n)<=81 && SelectAlpha(n)>=27)
        Noff= Noff+1;
    end
end
NoOfGamma = Non - Noff/3
Nsigma= NoOfGamma/sqrt(Non+(Noff/3))
