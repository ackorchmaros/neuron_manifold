% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b
function x = gather_try(x)

try
    x = gather(x);
catch
end