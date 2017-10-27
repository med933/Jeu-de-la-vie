function varargout = projet(varargin)
% PROJET MATLAB code for projet.fig
%      PROJET, by itself, creates a new PROJET or raises the existing
%      singleton*.
%
%      H = PROJET returns the handle to a new PROJET or the handle to
%      the existing singleton*.
%
%      PROJET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJET.M with the given input arguments.
%
%      PROJET('Property','Value',...) creates a new PROJET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projet

% Last Modified by GUIDE v2.5 20-Jun-2017 21:23:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projet_OpeningFcn, ...
                   'gui_OutputFcn',  @projet_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before projet is made visible.
function projet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projet (see VARARGIN)

% Choose default command line output for projet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global M; %M est une matrice carré composée de 1 et de 0
global N; %N est la taille de M
global m;
global t;
global END;%Pour faire la pause
global vitesse;
global saisieMat;
global T;
saisieMat=false;
T=100;%nb de generation 
N=100; %Par défaut
M = ones(N,N);
t=0;
image_affichee = imagesc(M,'parent', handles.axes1);
colormap jet(2);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;

set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_ajouter(handles) );


% UIWAIT makes projet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projet_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1);



function fonction_ajouter(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global N;
global saisieMat; 
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    M(NumeroLigne, NumeroColonne) = 0;
end

%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_ajouter(handles) );

function fonction_supprimer_cell(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global saisieMat;
global N;
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==0
    M(NumeroLigne, NumeroColonne) = 1;
end

%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_supprimer_cell(handles) );


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global t;
global END;
global vitesse;
global saisieMat;
global N;
global T;
global m;
END=0;
m=M;
%t=0;
if saisieMat==true
    while ((t<=T)&&(END ==0))
        for i=1:N
            for j=1:N
                if M(i,j)==1 
                    test=test_voisin_cell_morte(M, i, j);
                    if test==1
                        m(i,j)=0;
                    end
                end
                if M(i,j)==0
                    test=test_voisin_cell_vivante(M, i, j);
                    if test==0
                        m(i,j)=1;
                    end
                end
            end
        end
        set(handles.generation, 'String', num2str(t));
        pause(1/(vitesse*1000+1));
        imagesc(M);
        colormap jet(2);
        set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
        t=t+1;
        M=m;
    end
end

% --- Executes on button press in Generate_randomly.
function Generate_randomly_Callback(hObject, eventdata, handles)
% hObject    handle to Generate_randomly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global END;
global saisieMat;
global M;
global t;
global N;
global vitesse;
vitesse=0;
END=1; % on arrete la simulation 
%M=ones(N,N);
t=0;
saisieMat=true;

set(handles.generation, 'String', num2str(t));
set(handles.speed,'value',1);
set(handles.affiche_speed,'String',num2str(vitesse));

M=ones(N,N);
for i=int16(N/4) : int16(N*(3/4))
    for j=int16(N/4) : int16(N*(3/4))
        M(i,j)=randi([0,1]);
    end
end
I=imagesc(M);
colormap jet(2);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;

set(I, 'ButtonDownFcn', @(h, eventdata) fonction_ajouter(handles) );


% --- Executes on slider movement.
% Afficher la vitesse
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global vitesse;
vitesse = get(hObject,'Value');
set(handles.affiche_speed,'String',num2str(vitesse));


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function size_grid_Callback(hObject, eventdata, handles)
% hObject    handle to size_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global N;
global M;
global saisieMat;
global END; % pause
if saisieMat==false
    N = get(hObject,'Value')+100;
    set(handles.affiche_size,'String',num2str(N));
    M=ones(N,N);
else
    errordlg('Error','Error');
    END=1;
end

% --- Executes during object creation, after setting all properties.
function size_grid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer = questdlg('Are you sure to exit ?', ...
        'Exit','Yes','No','No');   
if strcmp(answer,'Yes')
   quit;
end


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global END;
global saisieMat;
global t;
global N;
global vitesse;
global T;
global m;
vitesse=0;
END=1;
t=0;
T=100;
N=100;
M=ones(N,N);
m=ones(N,N);

saisieMat=false;%La matrice est vide c-a-d qu il y a que des cellules mortes

set(handles.speed,'value',1);
set(handles.size_grid,'value',1);
set(handles.slider_generation,'value',1);
%%%
set(handles.generation, 'String', num2str(t));
set(handles.affiche_speed,'String',num2str(vitesse));
set(handles.affiche_size,'String',num2str(N));
set(handles.affiche_nb_generation,'String',num2str(T));
imagesc(M);
colormap jet(2);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;


% --- Executes on button press in manually.
function manually_Callback(hObject, eventdata, handles)
% hObject    handle to manually (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_ajouter(handles) );


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global END;
END=1;


% --- Executes on slider movement.
function slider_generation_Callback(hObject, eventdata, handles)
% hObject    handle to slider_generation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global T;
T = get(hObject,'Value')+100;
set(handles.affiche_nb_generation,'String',num2str(T));


% --- Executes during object creation, after setting all properties.
function slider_generation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_generation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in delete_manuelly.
function delete_manuelly_Callback(hObject, eventdata, handles)
% hObject    handle to delete_manuelly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_supprimer_cell(handles) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%structure_planeur%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fonction_structure_planeur(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global N;
global err;
global saisieMat; 
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    [M,err]=planeur(NumeroLigne,NumeroColonne,M);
end

if err==1
    errordlg('Domain error','Error');
end
%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_planeur(handles) );
% --- Executes on button press in planeur.

function planeur_Callback(hObject, eventdata, handles)
% hObject    handle to planeur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_planeur(handles) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LWSS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fonction_structure_LWSS(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global N;
global err;
global saisieMat; 
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    [M, err]=LWSS(NumeroLigne,NumeroColonne,M);
end

if err==1
    errordlg('Domain error','Error');
end
%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_LWSS(handles) );

% --- Executes on button press in lw.
function lw_Callback(hObject, eventdata, handles)
% hObject    handle to lw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_LWSS(handles) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Canon a planeur%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fonction_structure_canon_a_planeur(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global err;
global N;
global saisieMat; 
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    [M, err]=canon_planeur(NumeroLigne,NumeroColonne,M);
end
if err==1
    errordlg('Domain error','Error');
end
%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_canon_a_planeur(handles) );

% --- Executes on button press in canon_planeur.
function canon_planeur_Callback(hObject, eventdata, handles)
% hObject    handle to canon_planeur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_canon_a_planeur(handles) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Chasseur seul%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fonction_structure_chasseur_seul(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global err;
global saisieMat; 
global N;
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    [M, err]=chasseur_seul(NumeroLigne,NumeroColonne,M);
end

if err==1
    errordlg('Domain error','Error');
end
%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_chasseur_seul(handles) );
% --- Executes on button press in chasseur_seul.

function chasseur_seul_Callback(hObject, eventdata, handles)
% hObject    handle to chasseur_seul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_chasseur_seul(handles) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pentomino R%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fonction_structure_pentomino_R(handles) 
%M est une matrice globale, pour pouvoir récupérer sa valeur sans
global M;
global err;
global N;
global saisieMat; 
saisieMat=true;
%On récupère le point où l'utilisateur a cliqué
CurrentPoint = get(handles.axes1, 'CurrentPoint'); 
%Les coordonnées du point cliqué sont des valeurs flottantes : on les
%arrondit au plus proche entier
NumeroColonne = round(CurrentPoint(1,1));
NumeroLigne = round(CurrentPoint(1,2));
%Et on modifie la valeur du point cliqué à 1 (il devrait apparaître tout
%blanc)
if M(NumeroLigne, NumeroColonne)==1
    [M, err]=pentominoR(NumeroLigne,NumeroColonne,M);
end

if err==1
    errordlg('Domain error','Error');
end

%On met à jour l'affichage sur l'interface graphique (on affiche toute la
%matrice, et on rattache la fonction à la matrice)
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_pentomino_R(handles) );
% --- Executes on button press in pentominoR.

function pentominoR_Callback(hObject, eventdata, handles)
% hObject    handle to pentominoR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M;
global N;
image_affichee = imagesc(M, 'Parent', handles.axes1);
set(gca,'xtick',[1:N] -.5 ,'ytick',[1:N]-.5,'yticklabel',[],'xticklabel',[],'xcolor',[.7 .7 .7],'ycolor',[.7 .7 .7],'GridLineStyle','-');
axis on;
grid on;
set(image_affichee, 'ButtonDownFcn', @(h, eventdata) fonction_structure_pentomino_R(handles) );
