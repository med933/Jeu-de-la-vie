function [ m, err ] = canon_planeur(nligne,ncolonne,m)

    err=0;
    n=size(m,1);
    if nligne-4>=1 && nligne+4<=n && ncolonne+35<=n
        m(nligne,ncolonne)=0;
        m(nligne,ncolonne+1)=0;
        m(nligne-1,ncolonne+1)=0;

        %%%

        m(nligne,ncolonne+10)=0;
        m(nligne-1,ncolonne+10)=0;
        m(nligne-2,ncolonne+10)=0;

        m(nligne-3,ncolonne+11)=0;
        m(nligne-4,ncolonne+12)=0;
        m(nligne-4,ncolonne+13)=0;

        m(nligne+1,ncolonne+11)=0;
        m(nligne+2,ncolonne+12)=0;
        m(nligne+2,ncolonne+13)=0;

        %%%

        m(nligne,ncolonne+26)=0;
        m(nligne,ncolonne+27)=0;
        m(nligne+1,ncolonne+26)=0;
        m(nligne+1,ncolonne+27)=0;
        m(nligne+1,ncolonne+28)=0;
        m(nligne+2,ncolonne+26)=0;
        m(nligne+2,ncolonne+27)=0;

        %%%

        m(nligne-1,ncolonne+23)=0;
        m(nligne-1,ncolonne+24)=0;
        m(nligne-2,ncolonne+24)=0;

        %%%

        m(nligne+3,ncolonne+23)=0;
        m(nligne+3,ncolonne+24)=0;
        m(nligne+4,ncolonne+24)=0;

        %%%

        m(nligne+1,ncolonne+35)=0;
        m(nligne+2,ncolonne+34)=0;
        m(nligne+2,ncolonne+35)=0;
    else
        err=1;
end
