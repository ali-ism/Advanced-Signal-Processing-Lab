function [ft,fr]=my_fft_pos(x,nTs)
fs=1/(nTs(2)-nTs(1));
ft=fft(x);
ft=ft(1:length(ft)/2);
fr=linspace(0,fs/2,length(ft));
plot(fr,abs(ft))
end