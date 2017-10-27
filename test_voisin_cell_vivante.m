function [ test ] = test_voisin_cell_vivante(M, i, j)
% Ici on va tester les voisins de la cellule vivante(i,j)
% si la cellule i,j admet 2 ou 3 voisins, alors la fonction retourne 1 
% ce qui signifie que la cellule reste en vie, sinon la fonction retourne 0
% ce qui signifie que la cellule meurt.

% cellule vivante vaut 0, 1 sinon
% Une cellule vivante entouree de deux ou trois cellules vivante reste
% vivante.(Sinon, elle meurt)

n=size(M,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% si la cellule n est pas sur les bords de l organe, elle a 8 voisins
% on compte le nombre de cellule vivante qui entourent la cellule i,j
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nb_cell_vivante=0;
if (i>=2 && j>=2 && j<n && i<n) 
  
    if M(i-1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i-1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
     
    if M(i-1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% si la cellule est sur les bords de l organe sauf aux coins, alors elle a 
% 5 voisins.
% on compte le nombre de cellule vivante qui entourent la cellule i,j
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cote1= i==1 && (j>=2 && j<n);% premiere ligne
cote2= i==n && (j>=2 && j<n);% derniere ligne
cote3= j==1 && (i>=2 && i<n);% premiere colonne 
cote4= j==n && (i>=2 && i<n);% derniere colonne

%si la cellule est sur la premiere colonne
if cote3 
    if M(i-1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    if M(i-1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end
%si la cellule est sur la derniere ligne 
if cote2 
    if M(i-1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    if M(i-1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i-1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end

%si la cellule est sur la premiere ligne
if cote1 
    if M(i,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    if M(i,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j+1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end

%si la cellule est sur la premiere ligne
if cote4 
    if M(i-1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    if M(i-1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(i+1,j)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% si la cellule est sur les aux coins, alors elle a 3 voisins.
% on compte le nombre de cellule vivante qui entourent la cellule i,j
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if i==1 && j==1 
    if M(1,2)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(2,2)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(2,1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end

if i==n && j==1 
    if M(n,2)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(n-1,1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(n-1,2)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end

if i==1 && j==n 
    if M(1,n-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(2,n-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(2,n)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end

if i==n && j==n 
    if M(n-1,n-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(n-1,n)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
    
    if M(n,n-1)==0
        nb_cell_vivante=nb_cell_vivante+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (nb_cell_vivante==2 || nb_cell_vivante==3)
    test=true;
    % La cellule reste vivante
else
    test=false;
    % La cellule meurt   
end

end

