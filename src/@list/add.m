function o = add(o, varargin)

% Adds elements to a list object. 
%
% INPUTS 
% - o   [list]    A list object.
% - ... [string]  Elements to be added.
%
% OUTPUTS 
% - o [list]      Augmented list object.
%
% REMARKS 
% 1. New elements are added without doing a copy of the list object (in place modification).

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

for i=1:(nargin-1)
    if ischar(varargin{i})
        if ~ismember(varargin{i}, o.elements)
            o.elements(length(o)+1) = varargin(i);
        end
    else
        error('list:add:ArgCheck', 'Can only append strings to a list object!')
    end
end