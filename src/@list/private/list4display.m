function str = list4display(o, name, max_number_of_elements)

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