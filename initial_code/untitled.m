function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.w
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 30-May-2019 17:22:49

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%弹出窗口时就最大化

 javaFrame = get(gcf,'JavaFrame');

 set(javaFrame,'Maximized',1); 
% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.text10,'String',strcat('当前:',datestr(now,'yyyy-mm-dd')));


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%%compute the CCI
%read the date from datebase
StockCode=get(handles.edit1,'String');
type=get(handles.popupmenu3,'Value');
if type==1
    if(str2double(StockCode)>=600000)
        symbol=strcat(StockCode,'.SH');
    else
        symbol=strcat(StockCode,'.SZ');
    end
    location="c:\\database\equity";
    if exist(location,"dir")==0
        
        mkdir(location);
    end
    filename=strcat(symbol,".csv");
    site=strcat(location,"\",filename);
else
    if(str2double(StockCode)>=600000||str2double(StockCode)<=1000)
        symbol=strcat(StockCode,'.SH');
    else
        symbol=strcat(StockCode,'.SZ');
    end
    location="c:\\database\index";
    if exist(location,"dir")==0
        mkdir(location);
    end
    filename=strcat(symbol,".csv");
    site=strcat(location,"\",filename);
end
years=get(handles.popupmenu1,'Value');
n=get(handles.popupmenu2,'Value')*10;
num=years*250;
if exist(site,"file")==2
    dd=readtable(site,'Format','%s%s%f%f%f%f%f%f%f%f%f','Delimiter','\t');
    dd=dd(1:num,:);
    set(handles.text11,"String","数据读入成功，正在计算……");
    
else
    set(handles.text11,"String","数据不存在，请更新数据！！！");
end

%calculate the CCI of TYP and 
TYP=(table2array(dd(:,4))+table2array(dd(:,5))+table2array(dd(:,6)))/3;
volume=table2array(dd(:,10));

rtn=table2array(dd(:,9));
x=numel(TYP)-n+1;
MA=zeros(x,2);
AVEDEV=zeros(x,2);
Y=zeros(x,1);
for ii=1:1:x
    MA(ii,1)=sum(TYP(ii:ii+n-1))/n;
    MA(ii,2)=sum(volume(ii:ii+n-1))/n;
    if rtn(ii)>0
        Y(ii)=true;
    else
        Y(ii)=false;
    end
end
Y=nominal(Y);
for jj=1:1:x
    AVEDEV(jj,1)=sum(abs(TYP(jj:jj+n-1)-MA(jj,1)))/n;
    AVEDEV(jj,2)=sum(abs(volume(jj:jj+n-1)-MA(jj,2)))/n;
end
CCI1=(TYP(1:x)-MA(1:x,1))./(0.015*AVEDEV(:,1));
CCI2=(volume(1:x)-MA(1:x,2))./(0.015*AVEDEV(:,2));
data=[CCI1,CCI2];
%计算预警概率
I=find(CCI1<=CCI1(1));
N=length(I);
probnum=(N/numel(CCI1))*100;
prob=num2str(roundn(probnum,-2));
prob=strcat(prob,'%');
set(handles.text12,'String',prob);
%SVM估计

Test=data(1:round(x*0.3),:);
Test=Test(2:end,:);
y1=Y(1:(round(x*0.3)-1));
Train=data((round(x*0.3)+1):end,:);
Train=Train(2:end,:);
y2=Y(round(x*0.3+1):x-1);
SVMModel = fitcsvm(Train,y2,'Standardize',true,'KernelFunction','RBF',...
    'KernelScale','auto');
y11=predict(SVMModel,Test);
t=0;

for ii=1:1:numel(y1)
    if (y1(ii)~=y11(ii))
        t=t+1;
    end
end
p=strcat(num2str((1-t/numel(y1))*100),"%");
set(handles.text17,"String",p);
if y11(1)==nominal(true)
    set(handles.text18,"String","想啥呢，赶紧买！！");
else
    set(handles.text18,"String","别傻了，赶紧卖！！");
end
%compute and plot the quantiles and CCI in one plot
date=dd(:,2);
date=table2array(date);%%

yyyy=zeros(numel(date),1);
mm=zeros(numel(date),1);
day=zeros(numel(date),1);

for ii = 1:1:numel(date)
    yyyy(ii,1)=round(str2double(date{ii})/10000);
    day(ii,1)=round(rem(rem(str2double(date{ii}),10000),100));
    mm(ii,1)=round(rem(str2double(date{ii}),10000)/100);
end
axes(handles.axes1);

y=fliplr(CCI1);
xaxis=datenum(yyyy,mm,day);
xaxis=xaxis(1:numel(CCI1));
hold on;
%plot(xaxis,y,'b');
dateaxis('x',2);
xlabel('时间');
ylabel('CCI');
title('CCI的历史走向');
xmin=min(xaxis);
xmax=max(xaxis);
ymin=min(CCI1);
ymax=max(CCI1);
axis([xmin xmax ymin ymax])
%h=waitbar(0,"计算中请稍后……");
plot(xaxis,y);
% for jj=1:1:numel(CCI1)
%     plot(xaxis(numel(CCI1)-jj+1),y(jj),".--","MarkerSize",10);
%     waitbar(jj/numel(CCI))
% end
%close(h);


Q1=quantile(CCI1,0.01);
Q2=quantile(CCI1,0.02);
Q3=quantile(CCI1,0.05);
Q4=quantile(CCI1,0.15);
Q9=quantile(CCI1,0.85); 
Q10=quantile(CCI1,0.95); 
Q11=quantile(CCI1,0.98); 
Q12=quantile(CCI1,0.99); 
plot(xaxis,Q1*ones(numel(xaxis)),'r--');
plot(xaxis,Q2*ones(numel(xaxis)),'r--');
plot(xaxis,Q3*ones(numel(xaxis)),'r--');
plot(xaxis,Q4*ones(numel(xaxis)),'g--');
plot(xaxis,Q9*ones(numel(xaxis)),'g--');
plot(xaxis,Q10*ones(numel(xaxis)),'r--');
plot(xaxis,Q11*ones(numel(xaxis)),'r--');
plot(xaxis,Q12*ones(numel(xaxis)),'r--');
text(xmax,Q1,' 1','Color','red');
text(xmax,Q2,' 2','Color','red');
text(xmax,Q3,' 5','Color','red');
text(xmax,Q4,' 15','Color','red');
text(xmax,Q9,' 85','Color','red');
text(xmax,Q10,' 95','Color','red');
text(xmax,Q11,' 98','Color','red');
text(xmax,Q12,' 99','Color','red');
text(xmax,ymax,'（%）','Color','red');

grid on;
hold off;
set(handles.text11,"String","图一绘制成功（图二绘制中）！！！");

%%plot the one year data
x=250-n+1;
CCI=CCI1(1:x);
I=find(CCI<=CCI(1));
N=length(I);
probnum=(N/numel(CCI))*100;
prob=num2str(roundn(probnum,-2));
prob=strcat(prob,'%');
set(handles.text12,'String',prob);
axes(handles.axes2);
y=fliplr(CCI);
xaxis=xaxis(1:x);
plot(xaxis,y,'b');
dateaxis('x',2);
xlabel('时间');
ylabel('CCI');
title('CCI的历史走向');
xmin=min(xaxis);
xmax=max(xaxis);
ymin=min(CCI);
ymax=max(CCI);
axis([xmin xmax ymin ymax])
hold on;
Q1=quantile(CCI,0.01);
Q2=quantile(CCI,0.02);
Q3=quantile(CCI,0.05);
Q4=quantile(CCI,0.15);
Q9=quantile(CCI,0.85); 
Q10=quantile(CCI,0.95); 
Q11=quantile(CCI,0.98); 
Q12=quantile(CCI,0.99); 
plot(xaxis,Q1*ones(numel(xaxis)),'r--');
plot(xaxis,Q2*ones(numel(xaxis)),'r--');
plot(xaxis,Q3*ones(numel(xaxis)),'r--');
plot(xaxis,Q4*ones(numel(xaxis)),'g--');
plot(xaxis,Q9*ones(numel(xaxis)),'g--');
plot(xaxis,Q10*ones(numel(xaxis)),'r--');
plot(xaxis,Q11*ones(numel(xaxis)),'r--');
plot(xaxis,Q12*ones(numel(xaxis)),'r--');
text(xmax,Q1,' 1','Color','red');
text(xmax,Q2,' 2','Color','red');
text(xmax,Q3,' 5','Color','red');
text(xmax,Q4,' 15','Color','red');
text(xmax,Q9,' 85','Color','red');
text(xmax,Q10,' 95','Color','red');
text(xmax,Q11,' 98','Color','red');
text(xmax,Q12,' 99','Color','red');
text(xmax,ymax,'（%）','Color','red');

grid on;
hold off;
set(handles.text11,"String","图一图二绘制成功！！！");

function text12_Callback(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text12 as text
%        str2double(get(hObject,'String')) returns contents of text12 as a double


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%
%%数据（股票，指数，期货）的更新
%接口处理
token = '0c9651c9e9ad210c21f17838168d1cf3a38e00e8ce90467479edd7af'; 
api = pro_api(token);

%获取当前日期
t=datetime('now');
endDate=num2str(str2double(datestr(t,'yyyy'))*10000+str2double(datestr(t,'mm'))*100+str2double(datestr(t,'dd')));
%从用户输入判断证券种类
StockCode=get(handles.edit1,'String');
type=get(handles.popupmenu3,'Value');
if type==1
    method='E';
    flag="stock_basic";
    if(str2double(StockCode)>=600000)
        symbol=strcat(StockCode,'.SH');
    else
        symbol=strcat(StockCode,'.SZ');
    end
elseif type==2
    method='I';
    flag="index_basic";
    if(str2double(StockCode)>=600000||str2double(StockCode)<=1000)
        symbol=strcat(StockCode,'.SH');
    else
        symbol=strcat(StockCode,'.SZ');
    end
end

%%check the list
basic=strcat("c:\\database\",flag,".csv");

if exist("c:\\database","dir")==0
    mkdir(strcat("c:\\database"));
    if exist(basic,"file")==0
        if flag=="stock_basic"
            bb=api.query(flag);
        else
            bb=readtable("index_basic.csv",'Delimiter',',');
        end
        writetable(bb,basic,'Delimiter','\t');
    else
        bb=readtable(basic,'Delimiter','\t');
    end
else
    if exist(basic,"file")==0
        if flag=="stock_basic"
            bb=api.query(flag);
        else
            bb=readtable("index_basic.csv",'Delimiter',',');
        end
        writetable(bb,basic,'Delimiter','\t');
    else
        bb=readtable(basic,'Delimiter','\t');
    end
end
namelist=table2array(bb(:,1));%%
order=0;
if type==1
    for ii=1:1:numel(namelist)
        if strcmp(table2array(namelist(ii)),symbol)
            order=ii;
            name=table2array(bb(order,3));
            name=name{1};
            set(handles.text13,"String",name);
            break
        end
    end
    if order==0
        set(handles.text13,"String","该证券不存在！！");%%如何暂停？？
        close all;
    end
else
    for ii=1:1:numel(namelist)
        if strcmp(table2array(namelist(ii)),symbol)
            order=ii;
            name=table2array(bb(order,2));
            name=name{1};
            set(handles.text13,"String",name);
            break
        end
    end
    if order==0
        set(handles.text13,"String","该证券不存在！！");%%如何暂停？？
        close all;
    end
end
filename=strcat(symbol,".csv");
%second:read the file,creat a new one if not exists
if type==1
    location="c:\\database\equity";
    mkdir(location);
    site=strcat(location,"\",filename);
else
    location="c:\\database\index";
    mkdir(location);
    site=strcat(location,"\",filename);
end
if exist(site,"file")==0
    set(handles.text11,"String","该文件不存在，数据下载中！！！")
    years=25;
    startDate=num2str(str2double(endDate)-(years)*10000);
    dd = pro_bar(symbol,api,startDate,endDate,'D',method,' ','qfq');
    lastdate=table2array(dd(end,2));
    if str2double(lastdate)>(str2double(startDate)+10000)
        endDate=num2str(str2double(table2array(dd(end,2)))-1);
        dd2= pro_bar(symbol,api,startDate,endDate,'D',method,' ','qfq');
        dd=[dd;dd2];
    end
    writetable(dd,site,'Delimiter','\t');
    set(handles.text11,"String","数据下载完成！！！")

else
    set(handles.text11,"String","数据更新中！！！")
    dd=readtable(site,'Format','%s%s%f%f%f%f%f%f%f%f%f','Delimiter','\t');
    if str2double(table2array(dd(1,2)))~=str2double(endDate)
        startDate2=num2str(str2double(table2array(dd(1,2))));
        ddtemp= pro_bar(symbol,api,startDate2,endDate,'D',method,' ','qfq');
        if str2double(table2array(ddtemp(end,2)))~=str2double(startDate2)
            dd=[ddtemp;dd];
        end
    end
    writetable(dd,site,'Delimiter','\t');
    set(handles.text11,"String","数据更新完成！！！");

end
%save the updated data


function text11_Callback(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text11 as text
%        str2double(get(hObject,'String')) returns contents of text11 as a double


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
