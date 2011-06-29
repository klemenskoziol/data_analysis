function varout = g(t, delta, t_corr)

varout = delta^2 * t_corr^2 * (exp(-t/t_corr) + t/t_corr -1);