function q = minus(o, p)

% Difference of two list objects. Overloads the - binary  operator.
%
% INPUTS 
% - o [list]
% - p [list]
%
% OUTPUTS 
% - q [list] All the elements in o that do not belong to p.

% Copyright (C) 2014 Dynare Team
%
% This code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare list submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

if ~islist(o)
    error('list:minus:ArgCheck', 'First argument must be a list object!')
end

if ~(islist(p) || ischar(p))
    error('list:minus:ArgCheck', 'Second argument must be a list object or a string!')
end

% Copy the first object
q = copy(o);

% Compute the union of objects  o and p
if islist(p)
    q.elements = setdiff(q.elements, p.elements);
else
    q.remove(p);
end

%@test:1
%$ a = list('dora');
%$ b = list('babouche','chipeur');
%$ c = list('babouche','chipeur','dora');
%$ t = zeros(2,1);
%$
%$ try
%$    d = c-b;
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(d, a),true);
%$ end
%$ T = all(t);
%@eof:1

%@test:2
%$ a = list('dora');
%$ b = list('babouche','chipeur');
%$ c = list('babouche','chipeur','dora');
%$ t = zeros(2,1);
%$
%$ try
%$    d = c-a;
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(d, b),true);
%$ end
%$ T = all(t);
%@eof:2

%@test:3
%$ a = list('dora');
%$ b = list('babouche','chipeur');
%$ c = list('babouche','chipeur','dora');
%$ t = zeros(2,1);
%$
%$ try
%$    d = c-a.elements{1};
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(d, b),true);
%$ end
%$ T = all(t);
%@eof:3
