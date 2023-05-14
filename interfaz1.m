function varargout = interfaz1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz1_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz1_OutputFcn, ...
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

function interfaz1_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);




function varargout = interfaz1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function pb1_Callback(hObject, eventdata, handles)

qb1 = [0, 0, 0, 0]*pi/180;

axes1(qb1);

function pb2_Callback(hObject, eventdata, handles)

%qb2 = [-25, 15, -20, 20]*pi/180
qb2=[]
axes1(qb2);


function pb3_Callback(hObject, eventdata, handles)
qb3 = [35, -35, 30, -30]*pi/180;

axes1(qb3);


function pb4_Callback(hObject, eventdata, handles)
qb4 = [-85, 20, -55, 17]*pi/180;

axes1(qb4);


function pb5_Callback(hObject, eventdata, handles)
qb5 = [-80, 35, -55, 45]*pi/180;

axes1(qb5);



function axes1(q)
l = [4.47, 10.5, 10.5, 9];
offset = [0, pi/2, 0, 0];
% Orden parametros funcion link [THETA D A ALPHA SIGMA(0R,1P) OFFSET]
DHparameters = [q(1) 5.4 l(1) pi/2 0 offset(1);
                q(2) 0   l(2) 0    0 offset(2);
                q(3) 0   l(3) 0    0 offset(3);
                q(3) 0   l(4) pi/2 0 offset(4)                ];
L21(1) = Link(DHparameters(1,:));
L21(2) = Link(DHparameters(2,:));
L21(3) = Link(DHparameters(3,:));
L21(4) = Link(DHparameters(4,:));
Robot_punto21 = SerialLink(L21,'name','BASE');
ws2_2 = [-10 10 -10 10 -4.5 40];

 Robot_punto21.plot(q,'workspace',ws2_2);
 xlim([-10.0 16])
 
