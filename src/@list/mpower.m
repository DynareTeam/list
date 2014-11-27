function q = mpower(o, n)

% Copyright (C) 2014 Dynare Team
%
% This code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

% Check inputs
if ~(islist(o) && isnumeric(n) && abs(floor(n)-n)<1e-16)
    error('list:mpower:ArgCheck', 'Only integer powers are allowed!')
end

% Instantiate an empty list object
q = copy(o);

% Compute the cartesian products
for i=2:n
    q = q*o;
end

%@test:1
%$ a = list('1','2');
%$ b = list('1','2');
%$ c = list('(1,1)', '(1,2)', '(2,1)', '(2,2)');
%$ t = zeros(2,1);
%$
%$ try
%$    d = a^2;
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(c, d),true);
%$ end
%$ T = all(t);
%@eof:1
