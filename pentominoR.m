function [ m, err ] = pentominoR(nligne,ncolonne,m)
    err=0;
    n=size(m,1);
    if nligne-1>=1 && ncolonne+2<=n
        m(nligne,ncolonne)=0;
        m(nligne,ncolonne+1)=0;
        m(nligne-1,ncolonne+1)=0;
        m(nligne+1,ncolonne+1)=0;
        m(nligne-1,ncolonne+2)=0;
    else
        err=1;
    end
end
