function s = comparePumpProbe(ppFname, constr2d)

if ~exist(ppFname,'file')
  if exist([ppFname '.dat'])
    ppFname = [ppFname '.dat'];
  else
    error(['Could not find file ' ppFname])
  end
end

% import the pump probe data
s = construct1d;
s.basename = ppFname;
data = load(ppFname);

s.freq = data(:,1);
s.S = data(:,2);

% make a projection of the 2DIR data
if isempty(constr2d.R)
  error('Please run absorption2d first for the 2d construct.')
end

ind1 = find(constr2d.w1 >= constr2d.w3(1) & constr2d.w1 <= constr2d.w3(end));
proj = sum(constr2d.R(ind1(1):ind1(end), :));

% normalize the data to 1
maxpp = max(s.S);
minpp = min(s.S);
if maxpp >= -minpp
  normpp = maxpp;
else
  normpp = minpp;
end
pp = s.S / normpp;

max2d = max(proj);
min2d = min(proj);
if max2d >= -min2d
  norm2d = max2d;
else
  norm2d = min2d;
end
proj = proj / norm2d;

% plot the data
plot(s.freq, pp);
hold all
plot(constr2d.freq, proj)
xlabel('frequency (cm-1)');
ylabel('absorption (au)');
xlim([s.freq(1) s.freq(end)]);
ylim([-1 1]);

