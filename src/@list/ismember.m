function l = ismember(e, o)

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

if isa(e,'list')
    if isa(o, 'char')
        p = copy(e);
        q = o;
    else
        error('list:ismember:ArgCheck','Argument should be a string!')
    end
elseif isa(e,'char') && isa(o, 'list')
    p = copy(o);
    q = e;
else
    error('list:ismember:ArgCheck','First and second input arguments should be a string and a list object!')
end

l = ismember(q, p.elements);