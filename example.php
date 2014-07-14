<?php

$metrics = new HoardUtils\ServerMetrics;

// Server Load
echo 'Load: ' . implode(' ', $metrics->getLoad()) . "\n";
