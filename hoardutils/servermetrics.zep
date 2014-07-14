namespace HoardUtils;

class ServerMetrics
{

    protected function getOsName()
    {
        return PHP_OS;
    }

    public function getLoad()
    {
        string output;
        string command;
        var matches = [];
        switch this->getOsName() {
            case "Linux":
                let command = "cat /proc/loadavg";
                let output = (string) exec(command);
                preg_match_all("/[0-9]+[.]{1}[0-9]+/", output, matches);
                return array_map("floatval", matches[0]);
            case "Darwin":
                let command = "sysctl -n vm.loadavg";
                let output = (string) exec(command);
                preg_match_all("/[0-9]+[.]{1}[0-9]+/", output, matches);
                return array_map("floatval", matches[0]);
        }
    }

    /**
     * Count the number of CPUs available to the system
     * @return {int}
     */
    public function getCpuCount()
    {
        int output;
        string command;
        switch this->getOsName() {
            case "Linux":
                let command = "cat /proc/cpuinfo | grep processor | wc -l";
                let output = (int) exec(command);
                return output;
            case "Darwin":
                let command = "sysctl -n hw.ncpu";
                let output = (int) exec(command);
                return output;
        }
    }

}
