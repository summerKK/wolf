<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class TestAsset extends AssetBundle
{
//    public $sourcePath = '@common/widget';
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site_test.css',
    ];
    public $js = [
        '//cdn.bootcss.com/jquery/3.1.1/jquery.js',
    ];
}
