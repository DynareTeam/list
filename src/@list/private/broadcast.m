function [q, r] = broadcast(o, p)

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

if islist(o) && islist(p)
    if ~isequal(o.length(), p.length())
        if isequal(o.length(), 1)
            q = list();
            q.elements = repmat(o.elements, 1, p.length());
            r = copy(p);
        elseif isequal(p.length(), 1)
            q = copy(o);
            r = list();
            r.elements = repmat(p.elements, 1, o.length());
        else
            stack = dbstack;
            error(sprintf('list:%s:ArgCheck',stack(2).name), 'Both arguments must have the same number of elements or one of them must have only one element!')
        end
    else
        q = copy(o);
        r = copy(p);
    end
elseif islist(o) && ischar(p)
    q = copy(o);
    r = list();
    r.elements = repmat({p}, 1, o.length()); 
elseif ischar(o) && islist(p)
    q = list();
    q.elements = repmat({o}, 1, p.length());
    r = copy(p);
else
    stack = dbstack;
    error(sprintf('list:%s:ArgCheck',stack(2).name), 'Input arguments must be two list objects or a list object and a string!')
end
