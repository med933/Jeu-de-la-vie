function [ m,err ]=planeur(nligne,ncolonne,m)
    err=0;
    n=size(m,1);
    if nligne-2>=1 && ncolonne+2<=n
        m(nligne,ncolonne)=0;
        m(nligne,ncolonne+1)=0;
        m(nligne,ncolonne+2)=0;
        m(nligne-1,ncolonne+2)=0;
        m(nligne-2,ncolonne+1)=0;
    else
        err=1;
    end
end

