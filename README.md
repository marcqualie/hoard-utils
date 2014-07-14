# Hoard Utils

PHP Extension used by Hoard applications to access low-level system data fast


## Installation

[Zephir](http://zephir-lang.com) is required to build this extension. Please [install](http://zephir-lang.com/install.html) that first.

```
git clone git@github.com:marcqualie/hoard-utils.git
cd hoard-utils
make && sudo make install
```


## Examples

Get an instance of the ServerMetrics class

``` shell
$metrics = new HoardUtils\ServerMetrics;
```

Access various metrics from the under-lying system

``` php
$metrics->getHostName();
// demo1.hoardhq.com
$metrics->getLoad();
// [1.0, 1.5, 2.0]
$metrics->getCpuCount();
// 4
$metrics->getMemoryInfo();
// ['total' => 8192, 'used' => 4096, 'free' => 4096]
$metrics->getProcessInfo();
// ['total' => 512, 'running' => 32, 'stuck' => 1, 'sleeping' => 8, 'threads' => 1024]
```
