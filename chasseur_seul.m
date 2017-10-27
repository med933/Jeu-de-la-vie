function [ m, err ] = chasseur_seul(nligne,ncolonne,m)
    err=0;
    n=size(m,1);
    if nligne+6<=n && nligne-4>=0 && ncolonne+10<=n
        m(nligne,ncolonne)=0;
        m(nligne+1,ncolonne)=0;
        m(nligne+2,ncolonne)=0;

        m(nligne,ncolonne+2)=0;
        m(nligne+2,ncolonne+2)=0;
        m(nligne+4,ncolonne+2)=0;
        m(nligne-2,ncolonne+2)=0;

        m(nligne-2,ncolonne+4)=0;
        m(nligne-2,ncolonne+6)=0;
        m(nligne-2,ncolonne+8)=0;

        m(nligne,ncolonne+8)=0;
        m(nligne+2,ncolonne+8)=0;
        m(nligne+4,ncolonne+8)=0;

        m(nligne+4,ncolonne+6)=0;
        m(nligne+4,ncolonne+4)=0;
        m(nligne+4,ncolonne+2)=0;

        m(nligne+6,ncolonne+4)=0;
        m(nligne+6,ncolonne+5)=0;
        m(nligne+6,ncolonne+6)=0;

        m(nligne,ncolonne+10)=0;
        m(nligne+1,ncolonne+10)=0;
        m(nligne+2,ncolonne+10)=0;

        m(nligne-4,ncolonne+4)=0;
        m(nligne-4,ncolonne+5)=0;
        m(nligne-4,ncolonne+6)=0;
    else
        err=1;
    end
end
