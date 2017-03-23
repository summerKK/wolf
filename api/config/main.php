<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id'                  => 'app-api',
    'basePath'            => dirname(__DIR__),
    'controllerNamespace' => 'api\controllers',
    'bootstrap'           => ['log'],
    'modules'             => [
        'v1' => [
            'class' => 'api\modules\v1\Module',
        ],
    ],
    'aliases'             => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
    ],
    'components'          => [
        'request'      => [
            'csrfParam' => '_csrf-backend',
        ],
        'user'         => [
            'identityClass'   => 'common\models\User',
            'enableAutoLogin' => true,
            'enableSession'   => false,
        ],
        'session'      => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-api',
        ],
        'log'          => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets'    => [
                [
                    'class'  => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'urlManager'   => [
            'enablePrettyUrl'     => true,
            'showScriptName'      => false,
            'enableStrictParsing' => true,
            'rules'               => [
                [
                    'class'         => 'yii\rest\UrlRule',
                    'pluralize'     => false,
                    'controller'    => [
                        'v1/user',
                        'v1/goods',
                        'v1/test'
                    ],
                    'extraPatterns' => [
                        'POST login'      => 'login',
                        'GET signup-test' => 'signup-test',
                    ],

                ],
                'GET v1/<controller:\w+>/<action:\w+>'=>'v1/<controller>/<action>',
                'GET v1/test/view/<id:\d+>' => 'v1/test/view',
            ],
        ],
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-blue',
                ],
            ],
        ],
        'authManager'  => [
            'class'        => 'yii\rbac\DbManager',
            'defaultRoles' => ['guest'],
        ],
        'view'         => [
            'theme' => [
                'pathMap' => [
                    '@app/views' => [
                        '@app/themes/christmas',
                        '@app/themes/spring',
                    ],
                ],
            ],
        ],
    ],
    'as access'           => [
        'class'        => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            //这里是允许访问的action
            //controller/action
            '*',
        ],
    ],
    'as theme'            => [
        'class' => 'backend\components\ThemeControl',
    ],
    'params'              => $params,
];
