function varargout = Neural_Network_53(varargin)
% NEURAL_NETWORK_53 MATLAB code for Neural_Network_53.fig
%      NEURAL_NETWORK_53, by itself, creates a new NEURAL_NETWORK_53 or raises the existing
%      singleton*.
%
%      H = NEURAL_NETWORK_53 returns the handle to a new NEURAL_NETWORK_53 or the handle to
%      the existing singleton*.
%
%      NEURAL_NETWORK_53('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEURAL_NETWORK_53.M with the given input arguments.
%
%      NEURAL_NETWORK_53('Property','Value',...) creates a new NEURAL_NETWORK_53 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Neural_Network_53_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Neural_Network_53_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Neural_Network_53

% Last Modified by GUIDE v2.5 20-Apr-2015 20:39:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Neural_Network_53_OpeningFcn, ...
                   'gui_OutputFcn',  @Neural_Network_53_OutputFcn, ...
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


% --- Executes just before Neural_Network_53 is made visible.
function Neural_Network_53_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Neural_Network_53 (see VARARGIN)

% Choose default command line output for Neural_Network_53
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Neural_Network_53 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.w11slider, 'Value', 0);
set(handles.w12slider, 'Value', 0);
set(handles.w13slider, 'Value', 0);

set(handles.w21slider, 'Value', 0);
set(handles.w22slider, 'Value', 0);
set(handles.w23slider, 'Value', 0);

set(handles.w31slider, 'Value', 0);
set(handles.w32slider, 'Value', 0);
set(handles.w33slider, 'Value', 0);



set(handles.w11post, 'String', ' ');
set(handles.w12post, 'String', ' ');
set(handles.w13post, 'String', ' ');

set(handles.w21post, 'String', ' ');
set(handles.w22post, 'String', ' ');
set(handles.w23post, 'String', ' ');

set(handles.w31post, 'String', ' ');
set(handles.w32post, 'String', ' ');
set(handles.w33post, 'String', ' ');



set(handles.w11text, 'String', '0');
set(handles.w12text, 'String', '0');
set(handles.w13text, 'String', '0');

set(handles.w21text, 'String', '0');
set(handles.w22text, 'String', '0');
set(handles.w23text, 'String', '0');

set(handles.w31text, 'String', '0');
set(handles.w32text, 'String', '0');
set(handles.w33text, 'String', '0');






set(handles.amplText, 'String', '50');
set(handles.durText, 'String', '1');
set(handles.perText, 'String', '20');


set(handles.stepText, 'String', '0.01');
set(handles.timeText, 'String', '100');

% --- Outputs from this function are returned to the command line.
function varargout = Neural_Network_53_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function w11text_Callback(hObject, eventdata, handles)
% hObject    handle to w11text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w11text as text
%        str2double(get(hObject,'String')) returns contents of w11text as a double

set(handles.w11slider, 'Value', str2double(get(handles.w11text, 'String')));
set(handles.w11post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w11text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w11text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w11slider_Callback(hObject, eventdata, handles)
% hObject    handle to w11slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w11text, 'String', num2str(get(handles.w11slider, 'Value')));
set(handles.w11post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w11slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w11slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w12text_Callback(hObject, eventdata, handles)
% hObject    handle to w12text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w12text as text
%        str2double(get(hObject,'String')) returns contents of w12text as a double

set(handles.w12slider, 'Value', str2double(get(handles.w12text, 'String')));
set(handles.w12post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w12text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w12text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w12slider_Callback(hObject, eventdata, handles)
% hObject    handle to w12slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w12text, 'String', num2str(get(handles.w12slider, 'Value')));
set(handles.w12post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w12slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w12slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w13text_Callback(hObject, eventdata, handles)
% hObject    handle to w13text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w13text as text
%        str2double(get(hObject,'String')) returns contents of w13text as a double

set(handles.w13slider, 'Value', str2double(get(handles.w13text, 'String')));
set(handles.w13post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w13text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w13text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w13slider_Callback(hObject, eventdata, handles)
% hObject    handle to w13slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w13text, 'String', num2str(get(handles.w13slider, 'Value')));
set(handles.w13post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w13slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w13slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w21text_Callback(hObject, eventdata, handles)
% hObject    handle to w21text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w21text as text
%        str2double(get(hObject,'String')) returns contents of w21text as a double

set(handles.w21slider, 'Value', str2double(get(handles.w21text, 'String')));
set(handles.w21post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w21text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w21text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w21slider_Callback(hObject, eventdata, handles)
% hObject    handle to w21slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w21text, 'String', num2str(get(handles.w21slider, 'Value')));
set(handles.w21post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w21slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w21slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w22text_Callback(hObject, eventdata, handles)
% hObject    handle to w22text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w22text as text
%        str2double(get(hObject,'String')) returns contents of w22text as a double

set(handles.w22slider, 'Value', str2double(get(handles.w22text, 'String')));
set(handles.w22post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w22text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w22text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w22slider_Callback(hObject, eventdata, handles)
% hObject    handle to w22slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w22text, 'String', num2str(get(handles.w22slider, 'Value')));
set(handles.w22post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w22slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w22slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w23text_Callback(hObject, eventdata, handles)
% hObject    handle to w23text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w23text as text
%        str2double(get(hObject,'String')) returns contents of w23text as a double

set(handles.w23slider, 'Value', str2double(get(handles.w23text, 'String')));
set(handles.w23post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w23text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w23text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w23slider_Callback(hObject, eventdata, handles)
% hObject    handle to w23slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w23text, 'String', num2str(get(handles.w23slider, 'Value')));
set(handles.w23post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w23slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w23slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w31text_Callback(hObject, eventdata, handles)
% hObject    handle to w31text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w31text as text
%        str2double(get(hObject,'String')) returns contents of w31text as a double

set(handles.w31slider, 'Value', str2double(get(handles.w31text, 'String')));
set(handles.w31post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w31text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w31text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w31slider_Callback(hObject, eventdata, handles)
% hObject    handle to w31slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w31text, 'String', num2str(get(handles.w31slider, 'Value')));
set(handles.w31post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w31slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w31slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w32text_Callback(hObject, eventdata, handles)
% hObject    handle to w32text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w32text as text
%        str2double(get(hObject,'String')) returns contents of w32text as a double

set(handles.w32slider, 'Value', str2double(get(handles.w32text, 'String')));
set(handles.w32post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w32text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w32text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w32slider_Callback(hObject, eventdata, handles)
% hObject    handle to w32slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w32text, 'String', num2str(get(handles.w32slider, 'Value')));
set(handles.w32post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w32slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w32slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w33text_Callback(hObject, eventdata, handles)
% hObject    handle to w33text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w33text as text
%        str2double(get(hObject,'String')) returns contents of w33text as a double

set(handles.w33slider, 'Value', str2double(get(handles.w33text, 'String')));
set(handles.w33post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w33text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w33text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function w33slider_Callback(hObject, eventdata, handles)
% hObject    handle to w33slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.w33text, 'String', num2str(get(handles.w33slider, 'Value')));
set(handles.w33post, 'String', ' ');

% --- Executes during object creation, after setting all properties.
function w33slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w33slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function w13post_Callback(hObject, eventdata, handles)
% hObject    handle to w13post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w13post as text
%        str2double(get(hObject,'String')) returns contents of w13post as a double


% --- Executes during object creation, after setting all properties.
function w13post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w13post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w11post_Callback(hObject, eventdata, handles)
% hObject    handle to w11post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w11post as text
%        str2double(get(hObject,'String')) returns contents of w11post as a double


% --- Executes during object creation, after setting all properties.
function w11post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w11post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w12post_Callback(hObject, eventdata, handles)
% hObject    handle to w12post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w12post as text
%        str2double(get(hObject,'String')) returns contents of w12post as a double


% --- Executes during object creation, after setting all properties.
function w12post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w12post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w23post_Callback(hObject, eventdata, handles)
% hObject    handle to w23post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w23post as text
%        str2double(get(hObject,'String')) returns contents of w23post as a double


% --- Executes during object creation, after setting all properties.
function w23post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w23post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w22post_Callback(hObject, eventdata, handles)
% hObject    handle to w22post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w22post as text
%        str2double(get(hObject,'String')) returns contents of w22post as a double


% --- Executes during object creation, after setting all properties.
function w22post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w22post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w21post_Callback(hObject, eventdata, handles)
% hObject    handle to w21post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w21post as text
%        str2double(get(hObject,'String')) returns contents of w21post as a double


% --- Executes during object creation, after setting all properties.
function w21post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w21post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w31post_Callback(hObject, eventdata, handles)
% hObject    handle to w31post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w31post as text
%        str2double(get(hObject,'String')) returns contents of w31post as a double


% --- Executes during object creation, after setting all properties.
function w31post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w31post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w32post_Callback(hObject, eventdata, handles)
% hObject    handle to w32post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w32post as text
%        str2double(get(hObject,'String')) returns contents of w32post as a double


% --- Executes during object creation, after setting all properties.
function w32post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w32post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w33post_Callback(hObject, eventdata, handles)
% hObject    handle to w33post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w33post as text
%        str2double(get(hObject,'String')) returns contents of w33post as a double


% --- Executes during object creation, after setting all properties.
function w33post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w33post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stim1.
function stim1_Callback(hObject, eventdata, handles)
% hObject    handle to stim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stim1


% --- Executes on button press in stim2.
function stim2_Callback(hObject, eventdata, handles)
% hObject    handle to stim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stim2


% --- Executes on button press in stim3.
function stim3_Callback(hObject, eventdata, handles)
% hObject    handle to stim3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stim3



function amplText_Callback(hObject, eventdata, handles)
% hObject    handle to amplText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplText as text
%        str2double(get(hObject,'String')) returns contents of amplText as a double


% --- Executes during object creation, after setting all properties.
function amplText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function durText_Callback(hObject, eventdata, handles)
% hObject    handle to durText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durText as text
%        str2double(get(hObject,'String')) returns contents of durText as a double


% --- Executes during object creation, after setting all properties.
function durText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stepText_Callback(hObject, eventdata, handles)
% hObject    handle to stepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepText as text
%        str2double(get(hObject,'String')) returns contents of stepText as a double


% --- Executes during object creation, after setting all properties.
function stepText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function perText_Callback(hObject, eventdata, handles)
% hObject    handle to perText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of perText as text
%        str2double(get(hObject,'String')) returns contents of perText as a double


% --- Executes during object creation, after setting all properties.
function perText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to perText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeText_Callback(hObject, eventdata, handles)
% hObject    handle to timeText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeText as text
%        str2double(get(hObject,'String')) returns contents of timeText as a double


% --- Executes during object creation, after setting all properties.
function timeText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Neural_Network_5_Func(handles)
