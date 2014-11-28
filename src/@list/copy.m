function p = copy(o)

% Adds elements to a list object.
%
% INPUTS 
% - o   [list]    A list object.
%
% OUTPUTS 
% - p   [list]    A copy of list object o.
%
% REMARKS 
% 1. Note that if o is a list object, then by defining another object p by p = o, any
% modification on p will change o and any modification on o will change p. If you need to change
% p without changing o you need to do p = copy(o) instead.  

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

p = list(o.elements{:});