namespace HoardUtils;

class ServerMetrics
{

    protected function getOsName()
    {
        return PHP_OS;
    }

    protected function runCommand(command)
    {
        return trim((string) exec(command));
    }

    public function getLoad()
    {
        var output;
        var matches = [];
        switch this->getOsName() {
            case "Linux":
                let output = this->runCommand("cat /proc/loadavg");
                preg_match_all("/[0-9]+[.]{1}[0-9]+/", output, matches);
                return array_map("floatval", matches[0]);
            case "Darwin":
                let output = this->runCommand("sysctl -n vm.loadavg");
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
        var output;
        switch this->getOsName() {
            case "Linux":
                let output = this->runCommand("cat /proc/cpuinfo | grep processor | wc -l");
                return (int) output;
            case "Darwin":
                let output = this->runCommand("sysctl -n hw.ncpu");
                return (int) output;
        }
    }

}
