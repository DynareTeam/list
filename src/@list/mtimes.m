function q = mtimes(o, p)

% Cartesian product of two list objects.
%
% INPUTS 
% - o list object
% - p list object
%
% OUTPUTS 
% - q list object

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
if ~(islist(o) && islist(p))
    error('list:plus:ArgCheck', 'All arguments must be list objects!')
end

% Instantiate an empty list object
q = list();

% Compute the cartesian product
for i=1:length(o)
    t1 = o.elements{i};
    if isequal(t1(1),'(') && isequal(t1(end),')')
        t1 = t1(2:end-1);
    end
    for j=1:length(p)
        t2 = p.elements{j};
        if isequal(t2(1),'(') && isequal(t2(end),')')
            t2 = t2(2:end-1);
        end
        q.add(sprintf('(%s,%s)', t1, t2));
    end
end

%@test:1
%$ a = list('1','2','3');
%$ b = list('1','2');
%$ c = list('(1,1)', '(1,2)', '(2,1)', '(2,2)', '(3,1)', '(3,2)');
%$ t = zeros(2,1);
%$
%$ try
%$    d = a*b;
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
