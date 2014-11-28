function l = ne(o, p)

% Compares two list objects element by element (overloads ~= operator).
%
% INPUTS 
% - o   [list]    A list object (with n or 1 elements).
% - p   [list]    A list object (with n or 1 elements).
%
% OUTPUTS 
% - l   [logical] Array of true and false (1 and 0). l(i) is equal to true iff o{i}~=p{i}.

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

[q, r] = broadcast(o, p);

l = ~cellfun(@isequal, q.elements, r.elements);