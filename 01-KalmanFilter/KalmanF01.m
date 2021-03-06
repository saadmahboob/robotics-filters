function varargout = KalmanF01(varargin)
% KALMANF01 MATLAB code for KalmanF01.fig
%      KALMANF01, by itself, creates a new KALMANF01 or raises the existing
%      singleton*.
%
%      H = KALMANF01 returns the handle to a new KALMANF01 or the handle to
%      the existing singleton*.
%
%      KALMANF01('CALLBACK', hObject, eventData, handles, ...) calls the local
%      function named CALLBACK in KALMANF01.M with the given input arguments.
%
%      KALMANF01('Property', 'Value', ...) creates a new KALMANF01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KalmanF01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KalmanF01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
%
% -- 
% Salvatore La Bua (slabua@gmail.com)
% GLB
% MTM
% DICGIM - University of Palermo

% Edit the above text to modify the response to help KalmanF01

% Last Modified by GUIDE v2.5 16-Oct-2013 01:45:32

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
                       'gui_Singleton', gui_Singleton, ...
                       'gui_OpeningFcn', @KalmanF01_OpeningFcn, ...
                       'gui_OutputFcn', @KalmanF01_OutputFcn, ...
                       'gui_LayoutFcn', [], ...
                       'gui_Callback', []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT

% --- Executes just before KalmanF01 is made visible.
function KalmanF01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KalmanF01 (see VARARGIN)
    handles = initialize_gui(hObject, handles);
    % Choose default command line output for KalmanF01
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

% UIWAIT makes KalmanF01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = KalmanF01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;

% --- Executes on button press in Default.
function Default_Callback(hObject, eventdata, handles)
% hObject    handle to Default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    flag_default = get(handles.Default, 'Value');
    if (flag_default)
        set_Default(hObject, handles);
        disable_fields(hObject, handles);
    else
        set_Default(hObject, handles);
        enable_fields(hObject, handles);
    end
    % Hint: get(hObject, 'Value') returns toggle state of Default

function Mu0_X_Callback(hObject, eventdata, handles)
% hObject    handle to Mu0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Mu0_X as text
%        str2double(get(hObject, 'String')) returns contents of Mu0_X as a double

% --- Executes during object creation, after setting all properties.
function Mu0_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Mu0_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Mu0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Mu0_Y as text
%        str2double(get(hObject, 'String')) returns contents of Mu0_Y as a double

% --- Executes during object creation, after setting all properties.
function Mu0_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function X0_X_Callback(hObject, eventdata, handles)
% hObject    handle to X0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of X0_X as text
%        str2double(get(hObject, 'String')) returns contents of X0_X as a double

% --- Executes during object creation, after setting all properties.
function X0_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function X0_Y_Callback(hObject, eventdata, handles)
% hObject    handle to X0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of X0_Y as text
%        str2double(get(hObject, 'String')) returns contents of X0_Y as a double

% --- Executes during object creation, after setting all properties.
function X0_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Direction_Callback(hObject, eventdata, handles)
% hObject    handle to Direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Direction as text
%        str2double(get(hObject, 'String')) returns contents of Direction as a double

% --- Executes during object creation, after setting all properties.
function Direction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Control_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Control_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Control_noise as text
%        str2double(get(hObject, 'String')) returns contents of Control_noise as a double

% --- Executes during object creation, after setting all properties.
function Control_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sensor_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Sensor_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sensor_noise as text
%        str2double(get(hObject, 'String')) returns contents of Sensor_noise as a double

% --- Executes during object creation, after setting all properties.
function Sensor_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sensor_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_stdX_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdX as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdX as a double

% --- Executes during object creation, after setting all properties.
function Sigma_stdX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_stdY_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdX as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdX as a double

% --- Executes during object creation, after setting all properties.
function Sigma_stdY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_std_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdY as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdY as a double

% --- Executes during object creation, after setting all properties.
function Sigma_std_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Linear_velocity_Callback(hObject, eventdata, handles)
% hObject    handle to Linear_velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Linear_velocity as text
%        str2double(get(hObject, 'String')) returns contents of Linear_velocity as a double

% --- Executes during object creation, after setting all properties.
function Linear_velocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Linear_velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Frequency as text
%        str2double(get(hObject, 'String')) returns contents of Frequency as a double

% --- Executes during object creation, after setting all properties.
function Frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Wall_parameters_m_Callback(hObject, eventdata, handles)
% hObject    handle to Wall_parameters_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Wall_parameters_m as text
%        str2double(get(hObject, 'String')) returns contents of Wall_parameters_m as a double

% --- Executes during object creation, after setting all properties.
function Wall_parameters_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wall_parameters_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Wall_parameters_q_Callback(hObject, eventdata, handles)
% hObject    handle to Wall_parameters_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Wall_parameters_q as text
%        str2double(get(hObject, 'String')) returns contents of Wall_parameters_q as a double

% --- Executes during object creation, after setting all properties.
function Wall_parameters_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wall_parameters_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cla(handles.Plot, 'reset');
    set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    zoom off;
    pan off;
    set(handles.Default, 'Enable', 'OFF');
    disable_fields(hObject, handles);
    set_Legend(hObject, handles);

    [mu0, X0, theta, r, q, Sigma0, vl, freq, m, b, iter] = create_var(hObject, handles);
    Esercitazione1(mu0, X0, theta, r, q, Sigma0, vl, freq, m, b, iter, hObject, handles);

    set(handles.Default, 'Enable', 'ON');
    flag_default = get(handles.Default, 'Value');
    if (~flag_default)
        enable_fields(hObject, handles);
    end

function set_Legend(hObject, handles)
    im = imread('legend1.png');
    set(handles.Legend, 'HandleVisibility', 'ON');
    axes(handles.Legend);
    image(im);
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);

function steps_Callback(hObject, eventdata, handles)
% hObject    handle to steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of steps as text
%        str2double(get(hObject, 'String')) returns contents of steps as a double

% --- Executes during object creation, after setting all properties.
function steps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global flag_stop;
    flag_stop = 1;
    set(handles.Default, 'Enable', 'ON');
    flag_default = get(handles.Default, 'Value');
    if (~flag_default)
        enable_fields(hObject, handles);
    end

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Stop_Callback(hObject, eventdata, handles);
    zoom off;
    pan off;
    h = initialize_gui(hObject, handles);
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);

% --- Executes on button press in Zoom_in.
function Zoom_in_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Zoom_out.
function Zoom_out_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Zoom.
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    zoom on;

% --- Executes on button press in Pan.
function Pan_Callback(hObject, eventdata, handles)
% hObject    handle to Pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    pan on;

function handles = initialize_gui(hObject, handles)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
    cla(handles.Plot, 'reset');
    set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    cla(handles.Legend, 'reset');
    set(handles.Legend, 'Color', [0.3 0.3 0.3]);
    set(handles.Legend, 'Visible', 'OFF');
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);
    set(handles.Default, 'Enable', 'ON');
    set(handles.Default, 'Value', 1);
    set_Default(hObject, handles);
    disable_fields(hObject, handles);

function set_Default(hObject, handles)
    set(handles.Mu0_X, 'String', 7);
    set(handles.Mu0_Y, 'String', -5);
    set(handles.X0_X, 'String', -1);
    set(handles.X0_Y, 'String', 0);
    set(handles.Direction, 'String', -0.52);
    set(handles.Control_noise, 'String', 0);
    set(handles.Sensor_noise, 'String', 0.33);
    set(handles.Sigma_stdX, 'String', 100);
    set(handles.Sigma_stdY, 'String', 100);
    set(handles.Linear_velocity, 'String', 4.5);
    set(handles.Frequency, 'String', 50);
    set(handles.Wall_parameters_m, 'String', 0);
    set(handles.Wall_parameters_q, 'String', 2);
    set(handles.steps, 'String', 200);

function disable_fields(hObject, handles)
    set(handles.Mu0_X, 'Enable', 'OFF');
    set(handles.Mu0_Y, 'Enable', 'OFF');
    set(handles.X0_X, 'Enable', 'OFF');
    set(handles.X0_Y, 'Enable', 'OFF');
    set(handles.Direction, 'Enable', 'OFF');
    set(handles.Control_noise, 'Enable', 'OFF');
    set(handles.Sensor_noise, 'Enable', 'OFF');
    set(handles.Sigma_stdX, 'Enable', 'OFF');
    set(handles.Sigma_stdY, 'Enable', 'OFF');
    set(handles.Linear_velocity, 'Enable', 'OFF');
    set(handles.Frequency, 'Enable', 'OFF');
    set(handles.Wall_parameters_m, 'Enable', 'OFF');
    set(handles.Wall_parameters_q, 'Enable', 'OFF');
    set(handles.steps, 'Enable', 'OFF');

function enable_fields(hObject, handles)
    set(handles.Mu0_X, 'Enable', 'ON');
    set(handles.Mu0_Y, 'Enable', 'ON');
    set(handles.X0_X, 'Enable', 'ON');
    set(handles.X0_Y, 'Enable', 'ON');
    set(handles.Direction, 'Enable', 'ON');
    set(handles.Control_noise, 'Enable', 'ON');
    set(handles.Sensor_noise, 'Enable', 'ON');
    set(handles.Sigma_stdX, 'Enable', 'ON');
    set(handles.Sigma_stdY, 'Enable', 'ON');
    set(handles.Linear_velocity, 'Enable', 'ON');
    set(handles.Frequency, 'Enable', 'ON');
    set(handles.Wall_parameters_m, 'Enable', 'ON');
    set(handles.Wall_parameters_q, 'Enable', 'ON');
    set(handles.steps, 'Enable', 'ON');

function [mu0, X0, theta, r, q, Sigma0, vl, freq, m, b, iter] = create_var(hObject, handles)
    Mu0_X = eval(get(handles.Mu0_X, 'String'));
    Mu0_Y = eval(get(handles.Mu0_Y, 'String'));
    X0_X = eval(get(handles.X0_X, 'String'));
    X0_Y = eval(get(handles.X0_Y, 'String'));
    Direction = eval(get(handles.Direction, 'String'));
    Control_noise = eval(get(handles.Control_noise, 'String'));
    Sensor_noise = eval(get(handles.Sensor_noise, 'String'));
    Sigma_stdX = eval(get(handles.Sigma_stdX, 'String'));
    Sigma_stdY = eval(get(handles.Sigma_stdY, 'String'));
    Linear_velocity = eval(get(handles.Linear_velocity, 'String'));
    Frequency = eval(get(handles.Frequency, 'String'));
    Wall_parameters_m = eval(get(handles.Wall_parameters_m, 'String'));
    Wall_parameters_q = eval(get(handles.Wall_parameters_q, 'String'));
    steps = eval(get(handles.steps, 'String'));

    mu0 = [Mu0_X; Mu0_Y];
    X0 = [X0_X; X0_Y];
    theta = Direction;
    r = Control_noise;
    if (Sensor_noise <= 2e-5)
        Sensor_noise = 2e-5;
    end
    q = Sensor_noise^2;
    Sigma0 = [Sigma_stdX, 0; 0, Sigma_stdY];
    vl = Linear_velocity;
    freq = Frequency;
    m = Wall_parameters_m;
    b = Wall_parameters_q;
    iter = steps;

function Esercitazione1(mu0, X0, theta, r, q, Sigma0, vl, freq, m, b, iter, hObject, handles)
%La Funzione implementa il Filtro di Kalman

    global flag_stop;
    flag_stop = 0;
    axes(handles.Plot);

    cov_gain = 1;
    dt = 1/freq; %Periodo di campionamento
    u = [vl; vl]; %Vettore di controllo sul robot
    I = eye(2); %Matrice identita' utilizzata nel filtro di Kalman

    A = [1 0; 0 1];
    B = [cos(theta)*dt 0; 0 sin(theta)*dt];
    C = [-2*m/(sqrt(m*m+1)), 2/(sqrt(m*m+1))];

    R = r*eye(2); %matrice di covarianza del processo

    %Inizializzazione algoritmo
    Xk = X0;
    Sigmak = Sigma0;
    muk = mu0;
    matrix_err = zeros(iter, 1);
    matrix_mu_pred = zeros(iter, 2);
    matrix_xk = zeros(iter, 2);
    matrix_muk = zeros(iter, 2);
    matrix_sigmak = zeros(2, 2, iter);

    for i = 1 : iter

        %distanza tra la posizione reale del robot e il muro
        dist_PR = (-m*Xk(1, 1) + Xk(2, 1) - b) / sqrt( (-m)^2 +1 );

        %Matrice di covarianza della misura
        %Il rumore generato e' a media 0 e varianza pari a q
        Q = (0 + sqrt(q) .* randn(1));
        Xk = (A*Xk)+(B*u); %Posizione reale del robot
        Z_temp = 2*dist_PR + Q; %Misura della distanza con aggiunta di rumore
        Zk = Z_temp - 2*(-b/sqrt(1+m*m)); %Misura

        %Fase di Predizione
        mu_pred = (A*muk + B*u);
        Sigma_pred = A*(Sigmak*A') + R;

        %Fase di Correzione
        S = symmetric_m(C*(Sigma_pred*C') + q);
        %K_gain = Sigma_pred*(C'*inv(S)); %Guadagno di Kalman
        K_gain = Sigma_pred*(C'/S); %Guadagno di Kalman
        muk = mu_pred+K_gain*(Zk-C*mu_pred); %Posizione stimata del robot
        Sigmak = (I-K_gain*C)*Sigma_pred; %Matrice di covarianza stimata del robot
        Sigmak = symmetric_m(Sigmak);

        %Calcolo distanza tra posizione reale e stimata
        errore = sqrt((Xk-muk)'*(Xk-muk));

        %Memorizzazione dati
        matrix_xk(i, :) = Xk(:, :)';
        matrix_mu_pred(i, :) = mu_pred(:, :)';
        matrix_muk(i, :) = muk(:, :)';
        matrix_err(i, :) = errore;
        matrix_sigmak(:, :, i) = Sigmak;

    end

    %Calcolo dei limiti della finestra di visualizzazione
    x_min = min(matrix_xk(:, 1));
    x_max = max(matrix_xk(:, 1));
    y_min = min(matrix_xk(:, 2));
    y_max = max(matrix_xk(:, 2));
    ymuro = m*(x_min-50:0.2:x_max+50)+b;
    y_min_ass = min(y_min, min(ymuro));
    y_max_ass = max(y_max, max(ymuro));

    %Plot dei parametri
    x = x_min-20:0.2:x_max+20;
    set(gca, 'Color', [0.3 0.3 0.3]);
    lim_axis = [x_min-20 x_max+20 y_min_ass-20 y_max_ass+20];
    axis(lim_axis);
    x_step = (lim_axis(2)-lim_axis(1))/5;
    y_step = (lim_axis(4)-lim_axis(3))/5;
    set(handles.Plot, 'XTick', round(100*(lim_axis(1):x_step:lim_axis(2)))/100);
    set(handles.Plot, 'YTick', round(100*(lim_axis(3):y_step:lim_axis(4)))/100);
    hold on
    plot(x, m*x+b, '.-', 'LineWidth', 9, 'Color', [1 0.5 0]);
    %plot(x, m*x+b, '-g', 'LineWidth', 3);
    plot(X0(1, 1), X0(2, 1), 'xc');
    plot(mu0(1, 1), mu0(2, 1), 'or');
    plot(matrix_muk(1, 1), matrix_muk(1, 2), 'xr');
    plot(matrix_xk(:, 1), matrix_xk(:, 2), 'c');
    h2 = plot(matrix_muk(1, 1), matrix_muk(1, 2), 'ro', 'markersize', 5, 'markerfacecolor', 'r');
    vcov = plot(matrix_muk(1, 1), matrix_muk(1, 2), 'r');

    %Rappresentazione puntuale dell'andamento stimato del robot
    fastdraw = true;
    if (fastdraw)
        drawstep = 2; %Parametro proporzionale alla velocita' di rappresentazione (>1)
        for i = 1+drawstep : drawstep-1 : size(matrix_muk, 1)
            h1 = plot(matrix_muk(1, 1), matrix_muk(1, 2), 'r');
            set(h2, 'XData', matrix_muk(i, 1), 'YData', matrix_muk(i, 2));
            set(h1, 'XData', matrix_muk(i-drawstep:i, 1), 'YData', matrix_muk(i-drawstep:i, 2));
            if (sum(sum(matrix_sigmak(:, :, i) == zeros(2))) ~= 4)
                pvcov = PlotEllipse(matrix_muk(i, :)', matrix_sigmak(:, :, i), cov_gain);
                set(vcov, 'xdata', pvcov(1, :), 'ydata', pvcov(2, :));
            end
            drawnow;
            if (flag_stop)
                return
            end
        end
    else
        for i = 1 : size(matrix_muk, 1)
            h1 = plot(matrix_muk(1, 1), matrix_muk(1, 2), 'r');
            set(h2, 'XData', matrix_muk(i, 1), 'YData', matrix_muk(i, 2));
            set(h1, 'XData', matrix_muk(i, 1), 'YData', matrix_muk(i, 2));
            if (sum(sum(matrix_sigmak(:, :, i) == zeros(2))) ~= 4)
                pvcov = PlotEllipse(matrix_muk(i, :)', matrix_sigmak(:, :, i), cov_gain);
                set(vcov, 'xdata', pvcov(1, :), 'ydata', pvcov(2, :));
            end
            drawnow;
            if (flag_stop)
                return
            end
        end
    end

    %h = legend('Muro', 'X0', 'mu0', 'mkinit', 'Xk', 'Robot', 'Mk', 'Location', 'Best');

function S = symmetric_m(S)
% Funzione per mantenere la forma simmetrica di una matrice ed ovviare ad
% eventuali errori di arrotondamento scaturiti dai calcoli
    S = (S+S')*0.5;

function el = PlotEllipse(x, P, nSigma)
% Funzione per il tracciamento di una singola ellisse di covarianza
    N = 8;
    step = 2*pi/N;
    if (all(diag(P)))
        [V, D] = eig(P);
        y = nSigma * [cos(0:step:2*pi); sin(0:step:2*pi)];
        el = V*sqrtm(D)*y;
        el = [el el(:, 1)] + repmat(x, 1, size(el, 2)+1);
        el(:, end) = NaN;
    end
