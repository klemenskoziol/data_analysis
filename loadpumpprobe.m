function s = loadpumpprobe(fname)

if ~exist(fname,'file')
  if exist([fname '.dat'])
    fname = [fname '.dat'];
  else
    error(['Could not find file ' fname])
  end
end

%s = construct1d;
%s.basename = fname;
%data = load(fname);

%s.freq = data(:,1);
%s.S = data(:,2);

%load a 1d spectrum
dummy = load(fname);
s.freq = dummy(1,2:end);
s.signal = dummy(2:end,2:end);
s.time = dummy(2:end,1)';

