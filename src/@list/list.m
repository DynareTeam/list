classdef list<handle

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
    
    properties
        elements = {};
    end
    methods
        function o = list(varargin)
            if ~nargin
                o.elements = {};
                return
            end
            if all(cellfun(@ischar,varargin))
                o.elements(1) = varargin(1);
                for i=2:nargin
                    if ~ismember(varargin{i},o.elements)
                        o.elements(i) = varargin(i);
                    end
                end
                return
            end
            error('list:ArgCheck', 'Input arguments must be strings!')
        end
        function p = subsref(o, S)
            switch S(1).type
              case '{}'
                p = o.elements{S(1).subs{1}};
              case '()'
                p = list(o.elements{S(1).subs{1}});
              otherwise
                p = builtin('subsref', o, S);
            end
        end
        o = add(o, varargin);
        o = remove(o, varargin);
        l = isempty(o);
        l = isequal(o, p);
        l = ismember(e, o);
        l = eq(o, p);
        n = length(o);
        o = sort(o);
        q = plus(o, p);
        q = minus(o, p);
        q = mtimes(o, p);
        q = mpower(o, n);
    end
end


function S = shiftS(S,n)
    if length(S) >= n+1
        S = S(n+1:end);
    else
        S = {};
    end
end