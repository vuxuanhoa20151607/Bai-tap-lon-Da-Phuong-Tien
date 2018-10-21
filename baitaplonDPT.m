
%---------tach cac chu ra de xu ly ---------------------------------------
a = audioread('ori_input.wav'); %Ho va ten Vu Xuan Hoa, ma so sinh vien 20151607, lop dien tu 07, K60
a1 = a(51000:75000); %Ho
a2 = a(93600:108000); %va 
a3 = a(121000:145000); %ten
a4 = a(165000:189000); %Vu
a5 = a(195000:233400); %Xuan 
a6 = a(258000:272400); %Hoa
a7 = a(296000:324800); %ma
a8 = a(335000:359000); %so
a9 = a(368000:392000); %sinh
a10 = a(400000:438400); %vien
a11 = a(439000:453400); %2
a12 = a(465000:489000); %0
a13 = a(498000:522000); %1
a14 = a(532000:560800); %5
a15 = a(570000:594000); %1
a16 = a(605000:629000); %6
a17 = a(635000:659000); %0
a18 = a(670000:684400); %7
a19 = a(720000:744000); %lop
a20 = a(750000:788400); %dien
a21 = a(789000:803400); %tu
a22 = a(810000:834000); %0
a23 = a(840000:864000); %7
a24 = a(870000:908000); %K
a25 = a(905000:920000); %sau
a26 = a(925000:948800); %muoi

%--------------------tao tone cho giong noi--------------------------------
%lam cho giong noi len xuong bang cach thay doi do dai tin hieu ghi am, quy
%uoc cac gia tri theo not nhac de ghep vao voi nhac
%thay doi tan so bang cach thay doi chieu dai cua tin hieu
%y1 = y(1:1:length(y));     Do 
%y2 = y(1:1.4:length(y));   Re
%y3 = y(1:1.8:length(y));   Mi
%y4 = y(1:2.2:length(y));   La
%y5 = y(1:2.6:length(y));   Sol
%y6 = y(1:3:length(y));     La
%y7 = y(1:3.4:length(y));   Si
%y8 = y(1:3.8:length(y));   Do
x1 = a1(1:1.4:length(a1));
x2 = a2(1:0.8:length(a2));
x3 = a3(1:1.8:length(a3));
x4 = a4(1:1.8:length(a4));
x5 = a5(1:1.8:length(a5));
x6 = a6(1:1:length(a6));
x7 = a7(1:1.4:length(a7));
x8 = a8(1:1.6:length(a8));
x9 = a9(1:1.6:length(a9));
x10 = a10(1:1:length(a10));
x11 = a11(1:1:length(a11));
x12 = a12(1:2.2:length(a12));
x13 = a13(1:1.8:length(a13));
x14 = a14(1:1.6:length(a14));
x15 = a15(1:1.6:length(a15));
x16 = a16(1:1.6:length(a16));
x17 = a17(1:1.8:length(a17));
x18 = a18(1:1.8:length(a18));
x19 = a19(1:1.8:length(a19));
x20 = a20(1:1:length(a20));
x21 = a21(1:1.8:length(a21));
x22 = a22(1:1.6:length(a22));
x23 = a23(1:1.8:length(a23));
x24 = a24(1:1.6:length(a24));
x25 = a25(1:0.8:length(a25));
x26 = a26(1:1.4:length(a26));
x= [x1; x2; x3; x4; x5; x6; x7; x8; x9; x10; x11; x12; x13; x14; x15; x16; x17; x18; x19; x20; x21; x22; x23; x24 ;x25; x26];
b = audioread('concobebe.wav');
b = b(:,1);
b = b(528000:970078); 
y = (10.*x)+b; %tang bien do cua giong noi len 10 lan va cong voi tin hieu nhac
sound (y, 48000);

filename = 'melody.wav';       
     
audiowrite (filename, y, 48000);

%-------------Chuyen doi FFT cho file melody.wav---------------------------
fs = 48000; %tan so lay mau
N = fs % so diem FFT
transform = fft(y,N)/N;
magTransform = abs(transform);

faxis = linspace(-fs/2,fs/2,N);
subplot(2,1,1);
plot(faxis,fftshift(magTransform)); %ve pho tin hieu
xlabel('Frequency (Hz)') %ten cua truc x
title('Fast Fourier Transform'); %tieu de cua anh

%thay doi nhan dan danh dau cua do thi sang dau phay dong
xt = get(gca,'XTick');  
set(gca,'XTickLabel', sprintf('%.0f|',xt))

%---------------------Tao va ve spectrogram trong khi choi nhac-------------


win = 128; % chieu dai cua cua so trong cac mau
% So mau chong len nhau cua cac cua so
hop = win/2;            

nfft = win 
subplot(2,1,2);
spectrogram(y,win,hop,nfft,fs,'yaxis')
title('Spectrogram')

yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))


