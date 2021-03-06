<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id'                  => 'app-backend',
    'basePath'            => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap'           => ['log'],
    'modules'             => [
        //yii2-admin 插件配置
        'admin' => [
            'class' => 'mdm\admin\Module',
        ],
    ],
    'aliases'             => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
    ],
    'components'          => [
        'request'      => [
            'csrfParam' => '_csrf-backend',
        ],
//        'user' => [
//            'identityClass' => 'common\models\User',
//            'enableAutoLogin' => true,
//            'identityCookie' => ['name' => '_identity-backend', 'httpOnly' => true],
//        ],
        'user'         => [
            'identityClass'   => 'backend\models\UserBackend',
            'enableAutoLogin' => true,
        ],
        'session'      => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-backend',
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
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager'   => [
            'enablePrettyUrl'     => true,
            'showScriptName'      => false,
            'enableStrictParsing' => true,
//            'suffix'              => '.html',
            'rules'               => [
//                '/blogs/<id:\d+>'                        => '/blog/view',
                '<controller:\w+>/<action:\w+>/<page:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>'            => '<controller>/<action>',
                '<controller:\w+>/<id:\d+>'                => '<controller>/view',
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
            'site/*',
        ],
    ],
    'as theme'            => [
        'class' => 'backend\components\ThemeControl',
    ],
    'params'              => $params,
];
