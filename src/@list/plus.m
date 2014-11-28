function q = plus(o, p)

% Union of two list objects. Overloads the + binary operator.
%
% INPUTS 
% - o [list]
% - p [list]
%
% OUTPUTS 
% - q [list]
%
% REMARKS 
% - Repetitions are removed.

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

if ~(islist(o) || islist(p))
    error('list:plus:ArgCheck', 'At least one argument must be a list object!')
end

% Switch the input arguments if the first one is not a list object.
if ~islist(o)
    q = o;
    o = p;
    p = q;
end

% Check that the second argument is a list or string.
if ~(islist(p) || ischar(p))
    error('list:plus:ArgCheck', 'Input arguments must be a list object or string!')
end

% Copy the first object
q = copy(o);

% Compute the union of objects  o and p
if islist(p)
    q.elements = union(q.elements, p.elements);
else
    q.add(p);
end

%@test:1
%$ a = list('dora','babouche');
%$ b = list('babouche','chipeur');
%$ c = list('babouche','chipeur','dora');
%$ t = zeros(2,1);
%$
%$ try
%$    d = a+b;
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

%@test:2
%$ a = list('dora','babouche');
%$ b = 'babouche';
%$
%$ t = zeros(2,1);
%$
%$ try
%$    c = a+b;
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(a,c),true);
%$ end
%$ T = all(t);
%@eof:2

%@test:3
%$ b = list('dora','babouche');
%$ a = 'babouche';
%$
%$ t = zeros(2,1);
%$
%$ try
%$    c = a+b;
%$    t(1) = 1;
%$ catch
%$    t = 0;
%$ end
%$
%$ if t(1)
%$    t(2) = dassert(isequal(b,c),true);
%$ end
%$ T = all(t);
%@eof:3