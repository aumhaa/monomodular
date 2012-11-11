autowatch = 1;
            
function anything()
{
    var args = arrayfromargs(messagename, arguments);
    //post('unpack', args, '\n');
    var length = args.length;
    for(var i = 0;i<length;i++)
    {
        var out = (args[i] + '').split('');
        out.shift();
        outlet(0, i, out);
    }
}
