function s = rbSim2D(t1, t2, t3, w, anh, delta, t_corr)
% rbSim2D
% 20110629, RB: started function
%
% INPUT:
% t1, t3, arrays with coherence times in fs
% t2: population time in fs
% w: center frequency of the peak in cm-1
% anh: anharmonicity in cm-1
% delta: 5
% t_corr: 2
%
% OUTPUT:
% 2D time array with the response

IM = sqrt(-1);

s = construct2d;

t1range = linspace(1, length(t1), length(t1));
t3range = linspace(1, length(t3), length(t3));

R2 = zeros(length(t1), length(t3));

for i = t1range
  t1v = t1(i);
  for j = t3range   
    t3v = t3(j);


    %R2(i, j) = (exp(- IM * (t3v + t1v) * w) - exp(- IM * (t3v * (w - anh) + t1v * w))) * 
    - g(t1v, delta, t_corr) - g(t2, delta, t_corr) - g(t3v, delta, t_corr) + g(t1v + t2, delta, t_corr) + g(t2 + t3v, delta, t_corr) - g(t1v + t2 + t3v, delta, t_corr)
    %R2(i, j) = (exp())
    %R1(i, j) = (exp(- IM * (t3(j) - t1(i)) * w) - exp(- IM * (t3(j) * (w - anh) - t1(i) * w))) * (exp(- g(t1(i), delta, t_corr) + g(t2, delta, t_corr) - g(t3(j), delta, t_corr) - g(t1(i)-t2, delta, t_corr) - g(t2+t3(j), delta, t_corr) + g(t1(i)+t2+t3(j), delta, t_corr)))
    
  end   
end

R2


%for i = t1range
%  t1v = t1(i)  
%  R2(i) = (exp(- IM * (t3 + t1v) * w) - exp(- IM * (t3 * (w - anh) + t1v * w))) %* (exp(- g(t1, delta, t_corr) - g(t2, delta, t_corr) - g(t3, delta, t_corr) + g(t1 + t2, delta, t_corr) + g(t2 + t3, delta, t_corr) - g(t1 + t2 + t3, delta, t_corr)))
    %R1(i, j) = (exp(- IM * (t3(j) - t1(i)) * w) - exp(- IM * (t3(j) * (w - anh) - t1(i) * w))) * (exp(- g(t1(i), delta, t_corr) + g(t2, delta, t_corr) - g(t3(j), delta, t_corr) - g(t1(i)-t2, delta, t_corr) - g(t2+t3(j), delta, t_corr) + g(t1(i)+t2+t3(j), delta, t_corr)))
%end  


%    -g(t1v, delta, t_corr)
%    -g(t2, delta, t_corr)
%    -g(t3v, delta, t_corr)
%    +g(t2 + t3v, delta, t_corr) 
%    - g(t1v + t2 + t3v, delta, t_corr)

