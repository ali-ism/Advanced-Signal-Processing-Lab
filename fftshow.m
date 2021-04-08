function fftshow(f,type)
if nargin < 2 %nargin is the number of function inputs
    type = 'log';
end
if type == 'log'
    fl = log(1 + abs(f));
    fm = max(fl(:)); %f1(:) converts matrix into column vector, bcz the max function returns the max for each column in a matrix
    figure, imshow(fl/fm)
elseif type == 'abs'
    fa = abs(f);
    fm = max(fa(:));
    figure, imshow(fa/fm)
else
    error('Type must be either log or abs.')
end
end