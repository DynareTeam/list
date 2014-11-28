function l = isequal(o, p)

% Returns logical true (1) if list object o and p are equal.
%
% INPUTS 
% - o [list] A list object.
% - p [list] A list object.
%
% OUTPUTS 
% - l [logical] true (1) iff all the elements of o and p are equal.

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

if ~(islist(o) && islist(p))
    error('list:isequal:ArgCheck', 'Arguments must be list objects!')
end

l = isequal(o.elements, p.elements);