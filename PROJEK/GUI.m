function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 27-May-2020 14:04:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

ax = axes('unit','normalized','position', [0 0 1 1]);
bg = imread('bg2.jpeg'); imagesc(bg);
set(ax,'handlevisibility','off','visible','off')
% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

jenis_1 = get(handles.jenis1, 'string');
harga_1 = str2num(get(handles.harga1, 'string'));
kamera_1 = str2num(get(handles.kamera1, 'string'));
mi_1 = str2num(get(handles.mi1, 'string'));
p_1 = get(handles.p1, 'string');
if p_1 == 'OCTACORE'
    P1 = 5;
else if p_1 == 'QUADCORE'
        P1 = 3;
else if p_1 == 'DUALCORE'
        P1 = 1;
    end
    end
end
ram_1 = str2num(get(handles.ram1, 'string'));

jenis_2 = get(handles.jenis2, 'string');
harga_2 = str2num(get(handles.harga2, 'string'));
kamera_2 = str2num(get(handles.kamera2, 'string'));
mi_2 = str2num(get(handles.mi2, 'string'));
p_2 = get(handles.p2, 'string');
if p_2 == 'OCTACORE'
    P2 = 5;
else if p_2 == 'QUADCORE'
        P2 = 3;
else if p_2 == 'DUALCORE'
        P2 = 1;
    end
    end
end
ram_2 = str2num(get(handles.ram2, 'string'));

jenis_3 = get(handles.jenis3, 'string');
harga_3 = str2num(get(handles.harga3, 'string'));
kamera_3 = str2num(get(handles.kamera3, 'string'));
mi_3 = str2num(get(handles.mi3, 'string'));
p_3 = get(handles.p3, 'string');
if p_3 == 'OCTACORE'
    P3 = 5;
else if p_3 == 'QUADCORE'
        P3 = 3;
else if p_3 == 'DUALCORE'
        P3 = 1;
    end
    end
end
ram_3 = str2num(get(handles.ram3, 'string'));

harga_b = str2num(get(handles.hargaB, 'string'));
kamera_b = str2num(get(handles.kameraB, 'string'));
mi_b = str2num(get(handles.miB, 'string'));
p_b = str2num(get(handles.pB, 'string'));
ram_b = str2num(get(handles.ramB, 'string'));

cek = harga_b+kamera_b+mi_b+p_b+ram_b;
if cek == 100
x=[harga_1,kamera_1,mi_1,P1,ram_1; harga_2,kamera_2,mi_2,P2,ram_2; harga_3,kamera_3,mi_3,P3,ram_3];
k=[0,1,1,1,1]; 
w1=[harga_b,kamera_b,mi_b,p_b,ram_b];
w = w1./100;
[m n] = size(x);
R= zeros(m,n);
Y= zeros(m,n);
for j=1:n,
if k(j)==1, %statement untuk kriteria 
  R(:,j)=x(:,j)./max(x(:,j));
 else
  R(:,j)=min(x(:,j))./x(:,j);
 end;
end;
for i=1:m,
 V(i)= sum(w.*R(i,:));
end; 
%B=sort(transpose(V),'descend');
%set(handles.tabel,'Data',B);
q=[jenis_1,jenis_2,jenis_3,""];
c=q(1:3);
X=sortrows(transpose([V;c]), 'descend')
y=X(:,2)
set(handles.hasil,'string',(y));
else
    msgbox('Total bobot harus 100','Peringatan','warn');
    return
end

% --- Executes on button press in hapus.
function hapus_Callback(hObject, eventdata, handles)
% hObject    handle to hapus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.jenis1, 'string','');
set(handles.harga1, 'string','');
set(handles.mi1, 'string','');
set(handles.p1, 'string','');
set(handles.kamera1, 'string','');
set(handles.ram1, 'string','');

set(handles.jenis2, 'string','');
set(handles.harga2, 'string','');
set(handles.mi2, 'string','');
set(handles.p2, 'string','');
set(handles.kamera2, 'string','');
set(handles.ram2, 'string','');

set(handles.jenis3, 'string','');
set(handles.harga3, 'string','');
set(handles.mi3, 'string','');
set(handles.p3, 'string','');
set(handles.kamera3, 'string','');
set(handles.ram3, 'string','');

set(handles.hargaB, 'string','');
set(handles.miB, 'string','');
set(handles.pB, 'string','');
set(handles.kameraB, 'string','');
set(handles.ramB, 'string','');
set(handles.hasil, 'string','');

function hargaB_Callback(hObject, eventdata, handles)
% hObject    handle to hargaB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hargaB as text
%        str2double(get(hObject,'String')) returns contents of hargaB as a double


% --- Executes during object creation, after setting all properties.
function hargaB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hargaB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function miB_Callback(hObject, eventdata, handles)
% hObject    handle to miB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of miB as text
%        str2double(get(hObject,'String')) returns contents of miB as a double


% --- Executes during object creation, after setting all properties.
function miB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to miB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramB_Callback(hObject, eventdata, handles)
% hObject    handle to ramB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramB as text
%        str2double(get(hObject,'String')) returns contents of ramB as a double


% --- Executes during object creation, after setting all properties.
function ramB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kameraB_Callback(hObject, eventdata, handles)
% hObject    handle to kameraB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kameraB as text
%        str2double(get(hObject,'String')) returns contents of kameraB as a double


% --- Executes during object creation, after setting all properties.
function kameraB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kameraB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pB_Callback(hObject, eventdata, handles)
% hObject    handle to pB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pB as text
%        str2double(get(hObject,'String')) returns contents of pB as a double


% --- Executes during object creation, after setting all properties.
function pB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jenis3_Callback(hObject, eventdata, handles)
% hObject    handle to jenis3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jenis3 as text
%        str2double(get(hObject,'String')) returns contents of jenis3 as a double


% --- Executes during object creation, after setting all properties.
function jenis3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jenis3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function harga3_Callback(hObject, eventdata, handles)
% hObject    handle to harga3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harga3 as text
%        str2double(get(hObject,'String')) returns contents of harga3 as a double


% --- Executes during object creation, after setting all properties.
function harga3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harga3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mi3_Callback(hObject, eventdata, handles)
% hObject    handle to mi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mi3 as text
%        str2double(get(hObject,'String')) returns contents of mi3 as a double


% --- Executes during object creation, after setting all properties.
function mi3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ram3_Callback(hObject, eventdata, handles)
% hObject    handle to ram3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ram3 as text
%        str2double(get(hObject,'String')) returns contents of ram3 as a double


% --- Executes during object creation, after setting all properties.
function ram3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ram3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kamera3_Callback(hObject, eventdata, handles)
% hObject    handle to kamera3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kamera3 as text
%        str2double(get(hObject,'String')) returns contents of kamera3 as a double


% --- Executes during object creation, after setting all properties.
function kamera3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kamera3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p3 as text
%        str2double(get(hObject,'String')) returns contents of p3 as a double


% --- Executes during object creation, after setting all properties.
function p3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jenis2_Callback(hObject, eventdata, handles)
% hObject    handle to jenis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jenis2 as text
%        str2double(get(hObject,'String')) returns contents of jenis2 as a double


% --- Executes during object creation, after setting all properties.
function jenis2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jenis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function harga2_Callback(hObject, eventdata, handles)
% hObject    handle to harga2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harga2 as text
%        str2double(get(hObject,'String')) returns contents of harga2 as a double


% --- Executes during object creation, after setting all properties.
function harga2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harga2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mi2_Callback(hObject, eventdata, handles)
% hObject    handle to mi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mi2 as text
%        str2double(get(hObject,'String')) returns contents of mi2 as a double


% --- Executes during object creation, after setting all properties.
function mi2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ram2_Callback(hObject, eventdata, handles)
% hObject    handle to ram2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ram2 as text
%        str2double(get(hObject,'String')) returns contents of ram2 as a double


% --- Executes during object creation, after setting all properties.
function ram2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ram2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kamera2_Callback(hObject, eventdata, handles)
% hObject    handle to kamera2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kamera2 as text
%        str2double(get(hObject,'String')) returns contents of kamera2 as a double


% --- Executes during object creation, after setting all properties.
function kamera2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kamera2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p2 as text
%        str2double(get(hObject,'String')) returns contents of p2 as a double


% --- Executes during object creation, after setting all properties.
function p2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jenis1_Callback(hObject, eventdata, handles)
% hObject    handle to jenis1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jenis1 as text
%        str2double(get(hObject,'String')) returns contents of jenis1 as a double


% --- Executes during object creation, after setting all properties.
function jenis1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jenis1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function harga1_Callback(hObject, eventdata, handles)
% hObject    handle to harga1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harga1 as text
%        str2double(get(hObject,'String')) returns contents of harga1 as a double


% --- Executes during object creation, after setting all properties.
function harga1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harga1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mi1_Callback(hObject, eventdata, handles)
% hObject    handle to mi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mi1 as text
%        str2double(get(hObject,'String')) returns contents of mi1 as a double


% --- Executes during object creation, after setting all properties.
function mi1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ram1_Callback(hObject, eventdata, handles)
% hObject    handle to ram1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ram1 as text
%        str2double(get(hObject,'String')) returns contents of ram1 as a double


% --- Executes during object creation, after setting all properties.
function ram1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ram1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kamera1_Callback(hObject, eventdata, handles)
% hObject    handle to kamera1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kamera1 as text
%        str2double(get(hObject,'String')) returns contents of kamera1 as a double


% --- Executes during object creation, after setting all properties.
function kamera1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kamera1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p1 as text
%        str2double(get(hObject,'String')) returns contents of p1 as a double


% --- Executes during object creation, after setting all properties.
function p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hasil.
function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hasil contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hasil


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
