# Hoard Utils

This PHP extension can be used in conjunction with Hoard applications to collect low level system information.


## Dependencies

[Zephir](http://zephir-lang.com) is required to build this extension. You can find the installation instructions [here](http://zephir-lang.com/install.html).


## Installation

```
git clone git@github.com:marcqualie/hoard-utils.git
cd hoard-utils
make && sudo make install
```


## Examples

Get an instance of the ServerMetrics class

``` php
$metrics = new HoardUtils\ServerMetrics;
```

You can use the following commands to access various server metrics.

Get the host name

``` php
$metrics->getHostName();
// demo1.hoardhq.com
```

Get some load metrics
```php
$metrics->getLoad();
// [1.0, 1.5, 2.0]
```

Get CPU count
```php
$metrics->getCpuCount();
// 4
```

Get memory information
```php
$metrics->getMemoryInfo();
// ['total' => 8192, 'used' => 4096, 'free' => 4096]
```

Get system process information
```php
$metrics->getProcessInfo();
// ['total' => 512, 'running' => 32, 'stuck' => 1, 'sleeping' => 8, 'threads' => 1024]
```
