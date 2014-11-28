function str = list4display(o, name, max_number_of_elements)

% Converts a list object to a string.
%
% INPUTS 
% - o                      [list]     A list object.
% - name                   [string]   Name of the list object (to be displayed).
% - max_number_of_elements [integer]  Maximum number of elements displayed.
%
% OUTPUTS 
% - str  [string] Representation of the list object as a string. 
%
% See also display, disp

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

if isempty(o)
    str = sprintf('%s = {}\n', name);
    return
end

str = sprintf('%s = {', name);

if length(o)<=max_number_of_elements
    % All the elements are displayed
    for i=1:length(o)-1
        str = sprintf('%s%s, ', str, o.elements{i});
    end
else
    % Only display four elements (two first and two last)
    for i=1:2
        str = sprintf('%s%s, ', str, o.elements{i});
    end
    str = sprintf('%s%s, ', str, '...');
    str = sprintf('%s%s, ', str, o.elements{length(o)-1});
end
str = sprintf('%s%s}', str, o.elements{length(o)});