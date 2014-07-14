namespace HoardUtils\ServerMetrics;

class Darwin
{

    public function getLoad()
    {
        string output;
        var matches = [];
        string command = "sysctl -n vm.loadavg";
        let output = (string) exec(command);
        preg_match_all("/[0-9]+[.]{1}[0-9]+/", output, matches);
        return array_map("floatval", matches[0]);
    }

}
