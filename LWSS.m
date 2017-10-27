function [ m, err ] = LWSS(nligne,ncolonne,m)
    err=0;
    n=size(m,1);
    if nligne+3<=n && ncolonne+4<=n
        m(nligne,ncolonne)=0;
        m(nligne+2,ncolonne)=0;
        m(nligne,ncolonne+3)=0;
        m(nligne+3,ncolonne+1)=0;
        m(nligne+3,ncolonne+2)=0;
        m(nligne+3,ncolonne+3)=0;
        m(nligne+3,ncolonne+4)=0;

        m(nligne+2,ncolonne+4)=0;
        m(nligne+1,ncolonne+4)=0;
    else
        err=1;
    end
end

