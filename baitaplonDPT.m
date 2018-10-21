a = audioread('ori_input.wav'); %Ho va ten Vu Xuan Hoa, ma so sinh vien 20151607, lop dien tu 07, K60
b = audioread('concobebe.wav');
b = b(:,1);
b = b(528000:1494655); 
y = (5.*a)+b; %tang bien do cua giong noi len 10 lan va cong voi tin hieu nhac
%sound (y, 48000);

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
